module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypes
  
  # Handle reference types - save only the value labeled "full name"
  def handle_ref_type(key, value)
      if key.match(/customer_ref|parent_ref/)
        update_attribute("#{key.remove(/ref$/).concat('id')}", value['list_id'])
        update_attribute("#{key.remove(/ref$/).concat('full_name')}", value['full_name']) if key == 'customer_ref'
      else
      update_attribute("#{key.remove(/_ref$/)}", value['full_name'])
      end
  end

  # Try to update the attribute, only if the column named exists in the database table.
  # TODO: Throw an error when this is called and returns false due to self.respond_to? == false
  def update_attribute(column_name, new_value)
    if self.respond_to?("#{column_name}=")
      self.send("#{column_name}=", new_value)
    else
       QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{column_name}", :error_message => "update attribute failed for #{column_name}= #{new_value}")
     end
  end
  
  def handle_custom_type(value)
    self.send('site_contact=', nil)
    self.send('site_email=', nil)
    self.send('site_phone=', nil)
    value&.each do |k, v|
        v&.each do |arr|
          if arr['data_ext_name'] == 'Site Contact'
            update_attribute("site_contact", arr['data_ext_value'])
          elsif arr['data_ext_name'] == 'Site Email'
            update_attribute("site_email", arr['data_ext_value'])
          elsif arr['data_ext_name'] == 'Site Phone'
            update_attribute("site_phone", arr['data_ext_value'])
          end
        end
    end
  end
  
  def handle_address(key, value)
    prefix = key.remove(/address/)
    value&.each do |k, v|
      unless ignored_type?(k)
        update_attribute("#{prefix}#{k}", v)
      end
    end
  end
  
  # Takes a quickbooks hash and deals with each key/value pair according to its xml type.
  # TODO: shorten this - maybe pull out contacts, and parse the remainder, as two separate method calls?
  def parse_hash(qb)
    begin
    qb&.each do |key, value|
      next if ignored_type?(key) # skip ignored items.
      if line_item_type?(key)
        process_line_items(self.class.name, self.id, value)
      elsif address?(key)
        handle_address(key, value)
      elsif ref_type?(key)
        handle_ref_type(key, value)
      elsif custom_type?(key)
        handle_custom_type(value) # FIXME:  DEFINE IF WE NEED IT!
      else update_attribute(key, value)
      end
    end
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{self.id}", :error_message => "QB hash parsing error: #{e}")
    end
  end

included do
  def self.parse_qb_response(qb)
    begin
    id = (qb['list_id'] || qb['txn_id'])
    c = self.find_or_initialize_by(:id => id)
    c.parse_hash(qb.to_hash)
    c.save
      unless c.persisted?
        QbwcError.create(:worker_class => 'not persisted', :error_message => "#{c}")
      end
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.name}", :model_id => "#{id}", :error_message => "Error parsing response: #{e}")
    end
  end
end

  # Parse the line item returned block - send the key/value pairs for parsing one at a time
end

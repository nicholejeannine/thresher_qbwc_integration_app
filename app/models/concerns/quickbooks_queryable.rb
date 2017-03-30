module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypes
  
  # Handle reference types - save only the value labeled "full name"
  def handle_ref_type(key, value)
      if key.match(/customer_ref|parent_ref/)
        update_attribute("#{key.remove(/ref$/).concat('id')}", value['list_id'])
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
  
  # Takes a quickbooks hash and deals with each key/value pair according to its xml type.
  # TODO: shorten this - maybe pull out contacts, and parse the remainder, as two separate method calls?
  def parse_hash(qb)
    # Extract the contact information part of the hash
    begin
    contact_keys = ['salutation', 'first_name', 'middle_name', 'last_name', 'job_title', 'phone', 'alt_phone', 'fax', 'email', 'cc', 'contact', 'alt_contact', 'data_ext_ret']
    contact_hash = qb.extract!(*contact_keys)
    Contact.handle_contact(contact_hash, self.class.name ,self.id) unless contact_hash.empty?
    # Parse the rest of the hash in key/value pairs
    qb.each do |key, value|
      next if ignored_type?(key) # skip ignored items.
      if line_item_type?(key)
        process_line_items(self.class.name, self.id, value)
      elsif address?(key)
        Address.handle_address(key, value, self.class.name, self.id)
      elsif ref_type?(key)
        handle_ref_type(key, value) # deal with "ref types" (foreign keys to lookup tables)
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

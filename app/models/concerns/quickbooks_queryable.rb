module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypeable

  # Handle address types
  def handle_address(key, value)
    if value && value.is_a?(Qbxml::Hash)
      value.each do |k, v|
        update_attribute("#{key}_#{k}", v)
      end
    end
  end

  # Handle reference types - save only the value labeled "full name"
  def handle_ref_type(key, value)
    begin
      update_attribute("#{key.remove(/_ref$/)}", value['full_name'])
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{self.id}", :error_message => "#{e} in persisting #{key}")
    end
  end

  # Customer objects have custom fields - this method parses the value returned for this part of a qb hash
  def handle_custom_type(value)
    value.to_a.each do |arr|
      if arr['data_ext_name'] == 'Site Contact'
        update_attribute("primary_contact", arr['data_ext_value'])
      elsif arr['data_ext_name'] == 'Site Email'
        update_attribute("primary_email", arr['data_ext_value'])
      elsif arr['data_ext_name'] == 'Site Phone'
        update_attribute("primary_phone", arr['data_ext_value'])
      end
    end
  end

  # Try to update the attribute, only if the column named exists in the database table.
  def update_attribute(column_name, new_value)
    self.send("#{column_name}=", new_value) if self.respond_to?("#{column_name}=")
  end
  
  
  # Takes a quickbooks hash and deals with each key/value pair according to its xml type.
  def parse_qb_hash(qb)
    qb.to_hash.each do |key, value|
      next if ignored_type?(key) # skip ignored items.
      if line_item_type?(key)
        next unless self.class.name.match(/Line/) # Only line item models should handle the line items.
      end
      if address?(key)
        handle_address(key, value) # deal with address blocks
      elsif ref_type?(key)
        handle_ref_type(key, value) # deal with "ref types" (foreign keys to lookup tables)
      elsif custom_type?(key)
        handle_custom_type(value)
      else update_attribute(key, value) # handle custom data types we have added to quickbooks
      end
    end
  end

  module ClassMethods
   def parse_qb_response(qb)
     i = self.find_or_initialize_by(:id => qb['list_id'] || qb['txn_id'])
     i.save
  end
  end
end

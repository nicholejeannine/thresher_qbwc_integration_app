module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypes
  
  # Handle address types by creating or updating an instance in the appropriate table (BillAddress, ShipAddress, VendorAddress)
  def handle_address(key, value, klass, id)
    begin
    address_instance = key.classify.constantize.find_or_initialize_by(:id => id)
    address_instance.send("addressable_type=", klass)
    if value && value.is_a?(Qbxml::Hash)
      value.each do |k, v|
        address_instance.send("#{k}=", v) unless ignored_type?(k)
      end
    end
    address_instance.save
    rescue Exception => e
      QbwcError.create(:worker_class => "#{address_instance.class.name}: klass}", :model_id => "#{id}", :error_message => "#{e}")
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

  # Try to update the attribute, only if the column named exists in the database table.
  def update_attribute(column_name, new_value)
    self.send("#{column_name}=", new_value) if self.respond_to?("#{column_name}=")
  end
  
  def handle_contact(hash, klass, id)
    begin
      contact_instance = Contact.find_or_initialize_by(:id => id, :contact_type => klass)
      hash.each do |k, v|
      if custom_type?(k)
        # Customer objects have custom fields
        v.each do |arr|
          if arr['data_ext_name'] == 'Site Contact'
            contact_instance.update_attribute("primary_contact", arr['data_ext_value'])
          elsif arr['data_ext_name'] == 'Site Email'
            contact_instance.update_attribute("primary_email", arr['data_ext_value'])
          elsif arr['data_ext_name'] == 'Site Phone'
            contact_instance.update_attribute("primary_phone", arr['data_ext_value'])
          end
        end
      else
        contact_instance.update_attribute(k, v)
      end
      end
        contact_instance.save
    rescue Exception => e
      QbwcError.create(:worker_class => "Contact: #{klass}", :model_id => "#{id}", :error_message => "#{e}")
    end
  end
  
  # Takes a quickbooks hash and deals with each key/value pair according to its xml type.

  def parse_hash(qb)
    # Extract the contact information part of the hash
    contact_keys = ['salutation', 'first_name', 'middle_name', 'last_name', 'job_title', 'phone', 'alt_phone', 'fax', 'email', 'cc', 'contact', 'alt_contact', 'data_ext_ret']
    contact_hash = qb.to_hash.extract!(*contact_keys)
    handle_contact(contact_hash, self.class.name ,self.id) unless contact_hash.empty?
    # Parse the rest of the hash in key/value pairs
    qb.to_hash.each do |key, value|
      next if ignored_type?(key) # skip ignored items.
      if line_item_type?(key)
        process_line_items(self.id, value) if self.class.name.match(/Line/) # Only line item models should handle the line items.
      elsif address?(key)
        handle_address(key, value, self.class.name, self.id)
      elsif ref_type?(key)
        handle_ref_type(key, value) # deal with "ref types" (foreign keys to lookup tables)
      else update_attribute(key, value)
      end
    end
  end

included do
  def self.parse_qb_response(qb)
    klass = self.class.name
    id = (qb['list_id'] || qb['txn_id'])
    c = klass.find_or_initialize_by(:id => id)
    c.parse_hash(qb)
    c.save
  end
end
end

require 'qbxml'
module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypes
  
  # Handle reference types - save only the value labeled "full name"
  def handle_ref_type(key, value)
    begin
    if key.match(/customer_ref|vendor_ref|parent_ref/)
      update_attribute("#{key.remove(/ref$/).concat('id')}", value['list_id'])
      update_attribute("#{key.remove(/ref$/).concat('type')}", name_type(value['full_name'])) if key == 'customer_ref'
    else
      update_attribute("#{key.remove(/_ref$/)}", value['full_name'])
    end
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{self.id}", :error_message => "Error when attempting operation #{key}=#{value}: #{e}")
    end
  end

  # Try to update the attribute, only if the column named exists in the database table.
  # TODO: Throw an error when this is called and returns false due to self.respond_to? == false
  def update_attribute(column_name, new_value)
    begin
    if self.respond_to?("#{column_name}=")
      self.send("#{column_name}=", new_value)
    end
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{self.id}", :error_message => "Error when attempting operation #{column_name}=#{new_value}: #{e}")
    end
  end
  
  def handle_custom_type(value)
    value&.each do |arr|
      if arr['data_ext_name'] == 'Site Contact'
        update_attribute("site_contact", arr['data_ext_value'])
      elsif arr['data_ext_name'] == 'Site Email'
        update_attribute("site_email", arr['data_ext_value'])
      elsif arr['data_ext_name'] == 'Site Phone'
        update_attribute("site_phone", arr['data_ext_value'])
      end
    end
  end

  PARSE_ADDRESS = lambda{|address_hash, prefix|address_hash.keep_if{|key|key.in?(ADDRESS_KEYS)}.transform_keys!{|k|"#{prefix}_#{k}"}}

  # Takes a quickbooks hash and deals with each key/value pair according to its xml type.
  # TODO: shorten this - maybe pull out contacts, and parse the remainder, as two separate method calls?
  def parse_hash(qb)
    begin
    qb&.each do |key, value|
      next if ignored_type?(key) # skip ignored items.
      if line_item_type?(key)
        process_line_items(self.class.name, self.id, value)
      elsif linked_txn?(key)
        value.each{|hash|parse_linked_txn(hash)}
      elsif address?(key)
        handle_address(key, value)
      elsif ref_type?(key)
        handle_ref_type(key, value)
      elsif custom_type?(key)
        handle_custom_type(value)
      else update_attribute(key, value)
      end
    end
    rescue StandardError => e
      QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{self.id}", :error_message => "QB hash parsing error: #{e}")
    end
  end

included do
  
  def self.serialize_query_response(hash)
    hash = Qbxml::Hash.from_hash(hash)
    qb = hash.extract!(*self.valid_keys)
    addresses, refs, custom = hash.extract!(*QuickbooksTypes::ADDRESS_TYPES), hash.extract!(*QuickbooksTypes::REF_TYPES), QuickbooksTypes::PARSE_CUSTOM.call(hash.extract!('data_ext_ret')['data_ext_ret'])
    qb.merge!(QuickbooksTypes::PARSE_ADDRESS.call(addresses["bill_address"], "bill")).merge!(QuickbooksTypes::PARSE_ADDRESS.call(addresses["ship_address"], "ship")).merge!(QuickbooksTypes::PARSE_REF.call(refs))
    custom&.each{|hash|qb.merge!(hash)}
    qb
  end
  
  def self.parse_qb_response(qb)
      qb_id = (self.column_names.include?("list_id") ? "list_id" : "txn_id").to_s
    qb_value = qb[qb_id]
      c = self.find_or_initialize_by(qb_id => qb_value)
      hash =  self.serialize_query_response(hash).select{|key|key.in?(self.valid_keys)}
      c.attributes.merge(hash)
      c.save
  end
end
end

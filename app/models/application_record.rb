class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include QuickbooksTypes
  def self.serialize_query_response(hash)
    hash = Qbxml::Hash.from_hash(hash)
    qb = hash.extract!(*self.valid_keys)
    addresses, refs, custom = hash.extract!(*ADDRESS_TYPES), hash.extract!(*QuickbooksTypes::REF_TYPES), QuickbooksTypes::PARSE_CUSTOM.call(hash.extract!('data_ext_ret')['data_ext_ret'])
    qb.merge!(QuickbooksTypes::PARSE_ADDRESS.call(addresses["bill_address"], "bill")).merge!(QuickbooksTypes::PARSE_ADDRESS.call(addresses["ship_address"], "ship")).merge!(QuickbooksTypes::PARSE_REF.call(refs))
    custom&.each{|hash|qb.merge!(hash)}
    qb = self.attributes.merge(qb)
    qb.select{|key|is_valid_key?(key)}
  end

  def self.parse_qb_response(qb)
    qb_id = (self.column_names.include?("list_id") ? "list_id" : "txn_id").to_s
    qb_value = qb[qb_id]
    c = self.find_or_initialize_by(qb_id => qb_value)
    hash =  self.serialize_query_response(qb)
    c.update(hash)
    c.save
  end
  
  def self.is_valid_key?(key)
    key.in?(self.valid_keys)
  end
end

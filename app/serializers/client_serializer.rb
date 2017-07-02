require 'qbxml'
class ClientSerializer < Qbxml::Hash
  include ActiveModel::Serialization
  attr_accessor :attributes
  ADDRESS_TYPES = %w(ship_address bill_address vendor_address)
  ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)
  REF_TYPES = %w(customer_type_ref terms_ref sales_rep_ref sales_tax_code_ref item_sales_tax_code_ref job_type_ref)
  
  PARSE_ADDRESS = lambda{|address_hash, prefix|address_hash.keep_if{|key|key.in?(ADDRESS_KEYS)}.transform_keys!{|k|"#{prefix}_#{k}"}}
  
  PARSE_REF = lambda{|ref_hash|ref_hash.transform_keys!{|k|k.remove("_ref")}.transform_values!{|v|v["full_name"]}}
  
  PARSE_CUSTOM = lambda{|data|data.map{|hash|{hash['data_ext_name'] => hash['data_ext_value']}}.map{|h|h.transform_keys{|k|k.remove(" ").underscore}}}
  
  
  def self.query_hash(hash)
    hash = Qbxml::Hash.from_hash(hash)
    qb, addresses, refs, custom = hash.extract!(*attributes), hash.extract!(*ADDRESS_TYPES), hash.extract!(*REF_TYPES), hash.extract!('data_ext_ret')['data_ext_ret']
   qb.merge!(PARSE_ADDRESS.call(addresses["bill_address"], "bill")).merge!(PARSE_ADDRESS.call(addresses["ship_address"], "ship")).merge!(PARSE_REF.call(refs))
   PARSE_CUSTOM.call(custom).each{|hash|qb.merge!(hash)}
    qb
  end
  
  def self.attributes
    %w(list_id time_created time_modified edit_sequence full_name is_active company_name salutation first_name middle_name last_name job_title phone alt_phone fax email cc contact alt_contact balance total_balance account_number preferred_delivery_method)
  end
  
end

  
  
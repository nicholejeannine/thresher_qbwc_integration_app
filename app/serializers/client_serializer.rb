require 'qbxml'
class ClientSerializer < HashWithIndifferentAccess
  include ActiveModel::Serialization
  attr_accessor :attributes
  ADDRESS_TYPES = %w(ship_address bill_address vendor_address)
  ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)
  REF_TYPES = %w(customer_type_ref terms_ref sales_rep_ref sales_tax_code_ref item_sales_tax_code_ref job_type_ref)
  
  PARSE_ADDRESS = lambda{|address_hash, prefix|address_hash.keep_if{|key|key.in?(ADDRESS_KEYS)}.transform_keys!{|k|"#{prefix}_#{k}"}}
  
  PARSE_REF = lambda{|ref_hash|ref_hash.transform_keys!{|k|k.remove("_ref")}.transform_values!{|v|v["full_name"]}}
  
  PARSE_CUSTOM = lambda{|data|data&.map{|hash|{hash['data_ext_name'] => hash['data_ext_value']}}&.map{|h|h.transform_keys{|k|k.remove(" ").underscore}}}
  
  def serialize_query_response(hash)
    hash = Qbxml::Hash.from_hash(hash)
    qb = hash.extract!(*valid_keys)
   addresses, refs, custom = hash.extract!(*ADDRESS_TYPES), hash.extract!(*REF_TYPES), PARSE_CUSTOM.call(hash.extract!('data_ext_ret')['data_ext_ret'])
   qb.merge!(PARSE_ADDRESS.call(addresses["bill_address"], "bill")).merge!(PARSE_ADDRESS.call(addresses["ship_address"], "ship")).merge!(PARSE_REF.call(refs))
    custom&.each{|key|qb.merge!(key)}
    attributes.merge(qb).extract!(*valid_keys)
  end
  
  def valid_keys
    %w(list_id time_created time_modified edit_sequence full_name is_active company_name salutation first_name middle_name last_name job_title bill_addr1 bill_addr2 bill_addr3 bill_addr4 bill_addr5 bill_city bill_state bill_postal_code bill_country bill_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note phone alt_phone fax email cc contact alt_contact customer_type terms sales_rep balance total_balance sales_tax_code item_sales_tax account_number job_type preferred_delivery_method site_contact site_email site_phone)
  end

  def attributes
    {"list_id" =>nil, "time_created" =>nil, "time_modified" =>nil, "edit_sequence" =>nil, "full_name" =>nil, "is_active" =>nil, "company_name" =>nil, "salutation" =>nil, "first_name" =>nil, "middle_name" =>nil, "last_name" =>nil, "job_title" =>nil, "bill_addr1" =>nil, "bill_addr2" =>nil, "bill_addr3" =>nil, "bill_addr4" =>nil, "bill_addr5" =>nil, "bill_city" =>nil, "bill_state" =>nil, "bill_postal_code" =>nil, "bill_country" =>nil, "bill_note" =>nil, "ship_addr1" =>nil, "ship_addr2" =>nil, "ship_addr3" =>nil, "ship_addr4" =>nil, "ship_addr5" =>nil, "ship_city" =>nil, "ship_state" =>nil, "ship_postal_code" =>nil, "ship_country" =>nil, "ship_note" =>nil, "phone" =>nil, "alt_phone" =>nil, "fax" =>nil, "email" =>nil, "cc" =>nil, "contact" =>nil, "alt_contact" =>nil, "customer_type" =>nil, "terms" =>nil, "sales_rep" =>nil, "balance" =>nil, "total_balance" =>nil, "sales_tax_code" =>nil, "item_sales_tax" =>nil, "account_number" =>nil, "job_type" =>nil, "preferred_delivery_method" =>nil, "site_contact" =>nil, "site_email" =>nil, "site_phone" =>nil}
  end
  
end

  
  
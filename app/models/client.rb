class Client < ApplicationRecord
  include QuickbooksQueryable
  include PortalHash
  # REF_CAST  = Proc.new {|d| d ? (d.to_s.downcase == 'true' ? true : false) : false }
  
  
  def self.convert_hash hash
    hash.select!{|key|key.in?(Client::QB_KEYS)}
    bill = hash['bill_address'].select{|key|key.in?(Client::ADDRESS_KEYS)}.transform_keys!{|k|"bill_".concat(k)}
    hash.delete('bill_address')
    hash.merge!(bill)
    hash
  end
  
  def self.convert_address(address)
    address.transform_keys!(*Client::ADDRESS_KEYS)
    # address.select!{|key|key.in?(Client::ADDRESS_KEYS)}
    # address.keys.select!{|key|key.in?(QuickbooksHash::ADDRESS_KEYS)}.transform_keys!{|key|"#{name}_#{key}"}
    # address
  end

  #
  

  QB_KEYS = %w(list_id time_created time_modified edit_sequence full_name is_active company_name salutation first_name middle_name last_name job_title bill_address ship_address phone alt_phone fax email cc contact alt_contact customer_type_ref terms_ref sales_rep_ref balance total_balance sales_tax_code_ref item_sales_tax_code_ref account_number job_type_ref preferred_delivery_method data_ext_ret)
  
end

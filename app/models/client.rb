class Client < ApplicationRecord
  include QuickbooksQueryable
  
  def self.qb_id
    "list_id"
  end

  QB_KEYS = %w(list_id time_created time_modified edit_sequence full_name is_active company_name salutation first_name middle_name last_name job_title bill_address ship_address phone alt_phone fax email cc contact alt_contact customer_type_ref terms_ref sales_rep_ref balance total_balance sales_tax_code_ref item_sales_tax_ref account_number job_type_ref preferred_delivery_method data_ext_ret)
  
  def self.attributes
    {"list_id" =>nil, "time_created" =>nil, "time_modified" =>nil, "edit_sequence" =>nil, "full_name" =>nil, "is_active" =>true, "company_name" =>nil, "salutation" =>nil, "first_name" =>nil, "middle_name" =>nil, "last_name" =>nil, "job_title" =>nil, "bill_addr1" =>nil, "bill_addr2" =>nil, "bill_addr3" =>nil, "bill_addr4" =>nil, "bill_addr5" =>nil, "bill_city" =>nil, "bill_state" =>nil, "bill_postal_code" =>nil, "bill_country" =>nil, "bill_note" =>nil, "ship_addr1" =>nil, "ship_addr2" =>nil, "ship_addr3" =>nil, "ship_addr4" =>nil, "ship_addr5" =>nil, "ship_city" =>nil, "ship_state" =>nil, "ship_postal_code" =>nil, "ship_country" =>nil, "ship_note" =>nil, "phone" =>nil, "alt_phone" =>nil, "fax" =>nil, "email" =>nil, "cc" =>nil, "contact" =>nil, "alt_contact" =>nil, "customer_type" =>nil, "terms" =>nil, "sales_rep" =>nil, "balance" =>0, "total_balance" =>0, "sales_tax_code" =>nil, "item_sales_tax" =>nil, "account_number" =>nil, "job_type" =>nil, "preferred_delivery_method" =>nil, "site_contact" =>nil, "site_email" =>nil, "site_phone" =>nil}
  end

end

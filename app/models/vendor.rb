class Vendor < ApplicationRecord
  include QuickbooksQueryable

  QB_KEYS = %w(list_id time_created time_modified edit_sequence name is_active company_name salutation first_name middle_name last_name job_title vendor_address ship_address phone alt_phone fax email cc contact alt_contact name_on_check account_number vendor_type_ref terms_ref credit_limit vendor_tax_ident is_vendor_eligible_for1099 balance billing_rate_ref)
  
  def self.attributes
    {"list_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "name" => nil, "is_active" => true, "company_name" => nil, "salutation" => nil, "first_name" => nil, "middle_name" => nil, "last_name" => nil, "job_title" => nil, "vendor_addr1" => nil, "vendor_addr2" => nil, "vendor_addr3" => nil, "vendor_addr4" => nil, "vendor_addr5" => nil, "vendor_city" => nil, "vendor_state" => nil, "vendor_postal_code" => nil, "vendor_country" => nil, "vendor_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "phone" => nil, "alt_phone" => nil, "fax" => nil, "email" => nil, "cc" => nil, "contact" => nil, "alt_contact" => nil, "name_on_check" => nil, "account_number" => nil, "vendor_type" => nil, "terms" => nil, "credit_limit" => nil, "vendor_tax_ident" => nil, "is_vendor_eligible_for1099" => nil, "balance" => 0, "billing_rate" => nil}
  end
end

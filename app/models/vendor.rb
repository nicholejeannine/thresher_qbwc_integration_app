class Vendor < ApplicationRecord

  def self.attributes
    %w(list_id time_created time_modified edit_sequence name is_active company_name salutation first_name middle_name last_name job_title vendor_addr1 vendor_addr2 vendor_addr3 vendor_addr4 vendor_addr5 vendor_city vendor_state vendor_postal_code vendor_country vendor_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note phone alt_phone fax email cc contact alt_contact name_on_check account_number vendor_type terms credit_limit vendor_tax_ident is_vendor_eligible_for1099 balance billing_rate)
  end
end

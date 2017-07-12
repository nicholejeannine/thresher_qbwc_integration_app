class Job < ApplicationRecord
  include QuickbooksQueryable
  
  before_save :titleize_job_status
  
  QB_KEYS = %w(list_id time_created time_modified edit_sequence name full_name is_active sublevel company_name salutation first_name middle_name last_name job_title bill_address ship_address phone alt_phone fax email cc contact alt_contact customer_type_ref terms_ref sales_rep_ref balance total_balance sales_tax_code_ref item_sales_tax_ref account_number job_status job_start_date job_projected_end_date job_end_date job_desc job_type_ref preferred_delivery_method data_ext_ret)
  
  def self.attributes
    %w(list_id time_created time_modified edit_sequence name full_name is_active sublevel company_name salutation first_name middle_name last_name job_title bill_addr1 bill_addr2 bill_addr3 bill_addr4 bill_addr5 bill_city bill_state bill_postal_code bill_country bill_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note phone alt_phone fax email cc contact alt_contact customer_type terms sales_rep balance total_balance sales_tax_code item_sales_tax account_number job_status job_start_date job_projected_end_date job_end_date job_desc job_type preferred_delivery_method site_contact site_email site_phone)
  end

  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

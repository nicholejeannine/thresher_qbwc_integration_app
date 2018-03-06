class Job < ApplicationRecord
  # before_save :titleize_job_status
  self.table_name = "Jobs"
  self.primary_key = "Jobs_PKEY"

  PORTAL_MATCHING_FIELD = "full_name"
  QB_MATCHING_FIELD = "full_name"

  FIELD_MAP = {
      :Job_QB_JobName => 'name',
      :Job_NameSalutation => 'salutation',
      :Job_NameFirst => 'first_name',
      :Job_NameMiddle => 'middle_name',
      :Job_NameLast => 'last_name',
      :Job_PhoneOffice => 'phone',
      :Job_EmailTo => 'email',
      :Job_PhoneAlt => 'alt_phone',
      :Job_EmailCC => 'cc',
      :mobile => {"additional_contact_ref" => MOBILE_CAST},
      :Job_PhoneFax => 'fax',
      :bill_addr1 => {"bill_address" => "addr1"},
      :bill_addr2 => {"bill_address" => "addr2"},
      :bill_addr3 => {"bill_address" => "addr3"},
      :bill_addr4 => {"bill_address" => "addr4"},
      :bill_city => {"bill_address" => "city"},
      :bill_state => {"bill_address" => "state"},
      :bill_postal_code => {"bill_address" => "postal_code"},
      :ship_addr1 => {"ship_address" => "addr1"},
      :ship_addr2 => {"ship_address" => "addr2"},
      :ship_addr3 => {"ship_address" => "addr3"},
      :ship_addr4 => {"ship_address" => "addr4"},
      :ship_city => {"ship_address" => "city"},
      :ship_state => {"ship_address" => "state"},
      :ship_postal_code => {"ship_address" => "postal_code"},
      :Job_InactiveFlag => {"is_active" => INACTIVE_FLAG_CAST},
      :sales_rep => {"sales_rep_ref" => "full_name"},
      :Job_Status => "job_status",
      :Job_DateStartActual => "job_start_date",
      :Job_DateEndProjected => "job_projected_end_date",
      :Job_DateEndActual => "job_end_date",
      :list_id => "list_id",
      :full_name => "full_name"
  }
  
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.Job_Status = self['Job_Status']&.titleize
  end
  
end

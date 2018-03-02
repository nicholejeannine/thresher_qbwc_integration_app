class Job < ApplicationRecord
  before_save :titleize_job_status

  FIELDS = %w(Job_QB_JobName Job_NameSalutation Job_NameFirst Job_NameMiddle Job_NameLast Job_PhoneOffice Job_EmailTo Job_PhoneAlt Job_EmailCC mobile Job_PhoneFax bill_addr1 bill_addr2 bill_addr3 bill_addr4 bill_city bill_state bill_postal_code ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_city ship_state ship_postal_code Job_InactiveFlag Job_Status Job_DateStartActual Job_DateEndProjected Job_DateEndActual full_name)

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
      :Job_Status => "job_status",
      :Job_DateStartActual => "job_start_date",
      :Job_DateEndProjected => "job_projected_end_date",
      :Job_DateEndActual => "job_end_date",
      :list_id => "list_id",
      :full_name => "full_name",
      :sales_rep => {"sales_rep_ref" => "full_name"}
  }

  self.table_name = "Jobs"
  self.primary_key = "Jobs_PKEY"

  
  
  
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
  
  def self.save_to_portal(qb)
    begin
      # Look for customer by list id first. If not found, search by full name. If not found, create a new one.
      job = Job.find_by("list_id" => qb['list_id'])
      if job.nil?
        job = Job.find_or_create_by(:full_name => qb['full_name'])
      end
      # If customer if found, save the qb fields to their corresponding Thresher fields.
      Job::FIELDS.each {|x| customer[x] = ""}
      Job::FIELD_MAP.each do |k, v|
        if v.is_a?(Hash)
          v.each do |key, value|
            if qb.has_key?(key)
              if value.is_a?(String)
                job[k] = qb[key][value]
                # elsif value.is_a(Array)
                #  ref = qb[key]
              end
            end
          end
        elsif v.is_a?(String)
          job[k] = qb[v]
        end
      end
      if qb.has_key?("additional_contact_ref")
        ref = qb["additional_contact_ref"]
        if ref.pluck("contact_name").include?("Mobile")
          job.mobile = ref.find_all {|e| e['contact_name'] == 'Mobile'}.pluck("contact_value")[0]
        end
      end
      job.Cust_InactiveFlag = "X" if qb['is_active'] == false
      job.save
    rescue StandardError => e
      QbwcError.create(:worker_class => "Job.save_to_portal", :model_id => "#{qb['full_name']}", :error_message => "#{qb}")
    end
  end
end

class Project < Customer
  before_save :fk_customer_pkey, :fk_job_pkey
  attr_accessor :name
  self.table_name = "Project"
  self.primary_key = "Project_PKEY"

  FIELD_MAP = {
      :list_id => "list_id",
      :full_name => 'full_name',
      :Project_DateStartActual => 'job_start_date',
      :Project_DateEndEstimated => 'job_projected_end_date',
      :Project_DateEndActual => 'job_end_date',
      :Project_NameSalutation => 'salutation',
      :Project_NameFirst => 'first_name',
      :Project_NameMiddle => 'middle_name',
      :Project_NameLast => 'last_name',
      :Project_PhoneMain => 'phone',
      :Project_EmailMain => 'email',
      :Project_PhoneAlternate => 'alt_phone',
      :Project_EmailCC => 'cc',
      :Project_PhoneCell => {"additional_contact_ref" => MOBILE_CAST},
      :Project_PhoneFax => 'fax',
      :bill_addr1 => {"bill_address" => "addr1"},
      :bill_addr2 => {"bill_address" => "addr2"},
      :bill_addr3 => {"bill_address" => "addr3"},
      :bill_addr4 => {"bill_address" => "addr4"},
      :bill_city => {"bill_address" => "city"},
      :bill_state => {"bill_address" => "state"},
      :bill_postal_code => {"bill_address" => "postal_code"},
      :Project_Address1 => {"ship_address" => "addr1"},
      :Project_Address2 => {"ship_address" => "addr2"},
      :ship_addr3 => {"ship_address" => "addr3"},
      :ship_addr4 => {"ship_address" => "addr4"},
      :Project_City => {"ship_address" => "city"},
      :Project_State => {"ship_address" => "state"},
      :Project_Zip => {"ship_address" => "postal_code"},
      :is_active => "is_active",
      :sales_rep => {"sales_rep_ref" => "full_name"}
  }
  
  # Return just the "P-xxxx" portion without having to use the QB hash
  # TODO: maybe just grab this from the QB hash and compare to primary key? Roll back if no match
  def name
    names = self.full_name.split(":")
    names[names.count - 1]
  end
  
  def build_request(name, parent_full_name)
    {:customer_add_rq=>{:customer_add=>{:name=>"#{name}"}, :parent_ref=>{:full_name=>"#{parent_full_name}"}}}
  end

  # Lookup customer foreign key
  def fk_customer_pkey
    customer = self.full_name.split(":")[0]
    if customer
      self.FK_Customers_PKEY = Client.where(:Cust_CompanyAbr => customer).first&.Customers_PKEY
    else
      QbwcError.create(:worker_class => "fk_customer_pkey", :model_id => self.Jobs_PKEY, :error_message => "#{self.full_name}")
    end
  end
  
  # Lookup parent job foreign key - this is clunky but might work to start off
  def fk_job_pkey
    name = ":P-#{self.Project_PKEY}" # the "name" part to strip off full name
    parent_job_name = self.full_name.remove(name)
    self.FK_Jobs_PKEY = Job.where(:full_name => parent_job_name).first&.Jobs_PKEY
  end

end

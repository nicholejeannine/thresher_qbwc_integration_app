class Job < ApplicationRecord
  self.primary_key = :id # Required for this to work using mysql views
  belongs_to :customer, counter_cache: true
  belongs_to :parent, :class_name => 'Job', :foreign_key => 'parent_id'
  has_many :jobs, :class_name => 'Job', :foreign_key => 'parent_id'
  has_many :projects, :foreign_key => 'parent_id'
  scope :active, ->{ where(:is_active => true) }
  scope :inactive, ->{ where(:is_active => false) }
  # Use method borrowed from acts_as_tree gem, but without the gem
  def leaf?
    self.jobs.count == 0 && self.projects.count == 0
  end

  def active?
    self.is_active == true
  end

  def client?
    sublevel.to_i === 0
  end

  def job?
    !client? && !project?
  end

  def project?
    name.upcase.start_with?('P-')
  end

  # Included so that the url displays full_name instead of ugly quickbooks id value in url
  # e.g., `/customers/tcp` instead of `/customers/100273731-866661887 or whatever
  def to_param
    full_name
  end
end

# == Schema Information
#
# Table name: jobs
#
#  id                                 :string(40)
#  time_created                       :datetime
#  time_modified                      :datetime
#  edit_sequence                      :string(16)
#  name                               :string(50)
#  full_name                          :string(255)
#  is_active                          :string(11)
#  parent_id                          :string(40)
#  sublevel                           :string(40)
#  company_name                       :string(40)
#  salutation                         :string(40)
#  first_name                         :string(40)
#  middle_name                        :string(40)
#  last_name                          :string(40)
#  job_title                          :string(40)
#  bill_address_addr1                 :string(40)
#  bill_address_addr2                 :string(40)
#  bill_address_addr3                 :string(50)
#  bill_address_addr4                 :string(50)
#  bill_address_addr5                 :string(50)
#  bill_address_city                  :string(40)
#  bill_address_state                 :string(25)
#  bill_address_postal_code           :string(16)
#  bill_address_country               :string(40)
#  bill_address_note                  :string(255)
#  bill_address_block_addr1           :string(255)
#  bill_address_block_addr2           :string(255)
#  bill_address_block_addr3           :string(50)
#  bill_address_block_addr4           :string(50)
#  bill_address_block_addr5           :string(50)
#  ship_address_addr1                 :string(40)
#  ship_address_addr2                 :string(40)
#  ship_address_addr3                 :string(50)
#  ship_address_addr4                 :string(50)
#  ship_address_addr5                 :string(50)
#  ship_address_city                  :string(40)
#  ship_address_state                 :string(25)
#  ship_address_postal_code           :string(16)
#  ship_address_country               :string(40)
#  ship_address_note                  :string(255)
#  ship_address_block_addr1           :string(40)
#  ship_address_block_addr2           :string(40)
#  ship_address_block_addr3           :string(50)
#  ship_address_block_addr4           :string(50)
#  ship_address_block_addr5           :string(50)
#  phone                              :string(40)
#  alt_phone                          :string(40)
#  fax                                :string(40)
#  email                              :string(40)
#  cc                                 :string(40)
#  contact                            :string(40)
#  alt_contact                        :string(40)
#  customer_type_id                   :string(40)
#  customer_type_full_name            :string(40)
#  terms_id                           :string(40)
#  terms_full_name                    :string(255)
#  sales_rep_id                       :string(40)
#  sales_rep_full_name                :string(255)
#  balance                            :decimal(10, 5)
#  total_balance                      :decimal(10, 5)
#  sales_tax_code_id                  :string(40)
#  sales_tax_code_full_name           :string(255)
#  item_sales_tax_id                  :string(40)
#  item_sales_tax_full_name           :string(255)
#  resale_number                      :string(40)
#  account_number                     :string(40)
#  preferred_payment_method_id        :string(40)
#  preferred_payment_method_full_name :string(40)
#  job_status                         :string(40)
#  job_start_date                     :date
#  job_projected_end_date             :date
#  job_end_date                       :date
#  job_desc                           :string(40)
#  job_type_id                        :string(40)
#  job_type_full_name                 :string(255)
#  preferred_delivery_method          :string(40)
#  price_level_id                     :string(40)
#  price_level_full_name              :string(255)
#  primary_contact                    :string(255)
#  primary_email                      :string(255)
#  primary_phone                      :string(255)
#  Jobs_PKEY                          :integer
#  CreationTimeStamp                  :datetime
#  CreationUser                       :text(65535)
#  LastModificationTimeStamp          :datetime
#  LastModificationUser               :text(65535)
#  FK_Customers_PKEY                  :integer
#  FK_JobID_Parent                    :integer
#  Job_CustCLNo                       :text(65535)
#  Job_CustPONo                       :text(65535)
#  Job_DateEndActual                  :date
#  Job_DateEndProjected               :date
#  Job_DateStartActual                :date
#  Job_DateStartProjected             :date
#  Job_Description_Long               :text(65535)
#  Job_Description_Short              :text(65535)
#  Job_HourType                       :text(65535)
#

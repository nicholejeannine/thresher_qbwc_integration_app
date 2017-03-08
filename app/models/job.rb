class Job < ApplicationRecord
  include QuickbooksCustomer
  belongs_to :client, counter_cache: true
  belongs_to :parent, :class_name => 'Job', :foreign_key => 'parent_id'
  has_many :jobs, :class_name => 'Job', :foreign_key => 'parent_id'
  has_many :projects, :foreign_key => 'parent_id'
end

# == Schema Information
#
# Table name: jobs
#
#  id                                 :string(41)       primary key
#  time_created                       :datetime
#  time_modified                      :datetime
#  edit_sequence                      :string(16)
#  name                               :string(50)
#  full_name                          :string(255)
#  is_active                          :boolean          default(TRUE), not null
#  parent_id                          :string(41)
#  sublevel                           :string(41)
#  company_name                       :string(41)
#  salutation                         :string(41)
#  first_name                         :string(41)
#  middle_name                        :string(41)
#  last_name                          :string(41)
#  job_title                          :string(41)
#  bill_address_addr1                 :string(41)
#  bill_address_addr2                 :string(41)
#  bill_address_addr3                 :string(50)
#  bill_address_addr4                 :string(50)
#  bill_address_addr5                 :string(50)
#  bill_address_city                  :string(41)
#  bill_address_state                 :string(25)
#  bill_address_postal_code           :string(16)
#  bill_address_country               :string(41)
#  bill_address_note                  :string(255)
#  bill_address_block_addr1           :string(255)
#  bill_address_block_addr2           :string(255)
#  bill_address_block_addr3           :string(50)
#  bill_address_block_addr4           :string(50)
#  bill_address_block_addr5           :string(50)
#  ship_address_addr1                 :string(41)
#  ship_address_addr2                 :string(41)
#  ship_address_addr3                 :string(50)
#  ship_address_addr4                 :string(50)
#  ship_address_addr5                 :string(50)
#  ship_address_city                  :string(41)
#  ship_address_state                 :string(25)
#  ship_address_postal_code           :string(16)
#  ship_address_country               :string(41)
#  ship_address_note                  :string(255)
#  ship_address_block_addr1           :string(41)
#  ship_address_block_addr2           :string(41)
#  ship_address_block_addr3           :string(50)
#  ship_address_block_addr4           :string(50)
#  ship_address_block_addr5           :string(50)
#  phone                              :string(41)
#  alt_phone                          :string(41)
#  fax                                :string(41)
#  email                              :string(41)
#  cc                                 :string(41)
#  contact                            :string(41)
#  alt_contact                        :string(41)
#  customer_type_id                   :string(41)
#  customer_type_full_name            :string(41)
#  terms_id                           :string(41)
#  terms_full_name                    :string(255)
#  sales_rep_id                       :string(41)
#  sales_rep_full_name                :string(255)
#  balance                            :decimal(10, 5)
#  total_balance                      :decimal(10, 5)
#  sales_tax_code_id                  :string(41)
#  sales_tax_code_full_name           :string(255)
#  item_sales_tax_id                  :string(41)
#  item_sales_tax_full_name           :string(255)
#  resale_number                      :string(41)
#  account_number                     :string(41)
#  preferred_payment_method_id        :string(41)
#  preferred_payment_method_full_name :string(41)
#  job_status                         :string(41)
#  job_start_date                     :date
#  job_projected_end_date             :date
#  job_end_date                       :date
#  job_desc                           :string(41)
#  job_type_id                        :string(41)
#  job_type_full_name                 :string(255)
#  preferred_delivery_method          :string(41)
#  price_level_id                     :string(41)
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

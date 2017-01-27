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

require 'rails_helper'

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

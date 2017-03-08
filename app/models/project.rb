class Project < ApplicationRecord
  include QuickbooksCustomer
  belongs_to :job, counter_cache: true
  belongs_to :client
  # Since Project_Status is already an enum, we can avoid having to store it in a table and reference it only in one place for changes (e.g., in the Project model).
  # The line `enum Project_Status` creates a lookup for the column `Project`.`Project_Status`, as defined below. ("Quoting" = 1, "Pending" = 2, etc).
  enum Project_Status: [:Quoting, :Active, :Pending, :WorkComplete, :Invoiced, :Warranty, :Closed]
end

# == Schema Information
#
# Table name: projects
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
#  Project_PKEY                       :integer
#  CreationTimeStamp                  :datetime
#  CreationUser                       :text(16777215)
#  LastModificationTimeStamp          :datetime
#  LastModificationUser               :text(16777215)
#  FK_Customers_PKEY                  :integer
#  FK_Jobs_PKEY                       :integer
#  FK_ProgMan_Employees_PKEY          :integer
#  FK_ProjMan_Employees_PKEY          :integer
#  FK_TechLead_Employees_PKEY         :integer
#  FK_Foreman_Employees_PKEY          :integer
#  FK_TechForeman_Employees_PKEY      :integer
#  Project_Name                       :text(65535)
#  Project_Type                       :text(65535)
#  Project_DateStartEstimated         :date
#  Project_DateEndEstimated           :date
#  Project_RoughInStart               :date
#  Project_RoughInEnd                 :date
#  Project_DeviceInstallStart         :date
#  Project_DeviceInstallEnd           :date
#  Project_CommissioningStart         :date
#  Project_CommissioningEnd           :date
#  Project_ScopeText                  :text(65535)
#  Project_NameSalutation             :text(65535)
#  Project_NameFirst                  :text(65535)
#  Project_NameMiddle                 :text(65535)
#  Project_NameLast                   :text(65535)
#  Project_PhoneMain                  :text(65535)
#  Project_EmailMain                  :text(65535)
#  Project_PhoneAlternate             :text(65535)
#  Project_EmailCC                    :text(65535)
#  Project_PhoneCell                  :text(65535)
#  Project_PhoneFax                   :text(65535)
#  Project_Address1                   :text(65535)
#  Project_Address2                   :text(65535)
#  Project_Address_Parking1           :text(65535)
#  Project_Address_Parking2           :text(65535)
#  Project_City                       :text(65535)
#  Project_State                      :text(65535)
#  Project_Zip                        :text(65535)
#  Project_Park_1_Address             :text(65535)
#  Project_Park_1_Address_City        :text(65535)
#  Project_Park_1_Address_State       :text(65535)
#  Project_Park_1_Address_Zip         :integer
#  Project_Park_2_Address             :text(65535)
#  Project_Park_2_Address_City        :text(65535)
#  Project_Park_2_Address_State       :text(65535)
#  Project_Park_2_Address_Zip         :integer
#  Project_PercentComplete            :integer
#  Project_IsClosed                   :text(65535)
#  Project_Status                     :integer
#  Project_QuotedTechLabor            :integer
#  Project_QuotedRILabor              :integer
#  Project_QuotedDILabor              :integer
#  Project_QuotedCOLabor              :integer
#  Project_QuotedEngLabor             :integer
#  Project_QuotedPMLabor              :integer
#  Project_UseCase                    :text(65535)
#  Project_QuotedLgstLabor            :integer
#

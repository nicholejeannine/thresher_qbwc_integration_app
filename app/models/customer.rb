class Customer < ApplicationRecord
  include QuickbooksCustomer


  # Limit fields returned for company display page. Note the returned objects are simple arrays, not Customer objects, so fields not included here are not visible.
  def subjobs
    Customer.select([:id, :parent_id, :full_name, :is_active, :name, :full_name, :sublevel, :job_status]).where(:parent_id => self.id).order(:name)
  end
end

# == Schema Information
#
# Table name: customers
#
#  id                                 :string(255)      not null, primary key
#  time_created                       :datetime
#  time_modified                      :datetime
#  edit_sequence                      :string(16)
#  name                               :string(41)
#  full_name                          :string(209)
#  is_active                          :boolean          default(TRUE), not null
#  parent_id                          :string(41)
#  sublevel                           :integer          default(0), not null
#  company_name                       :string(41)
#  salutation                         :string(15)
#  first_name                         :string(25)
#  middle_name                        :string(5)
#  last_name                          :string(25)
#  job_title                          :string(41)
#  bill_address_addr1                 :string(41)
#  bill_address_addr2                 :string(41)
#  bill_address_addr3                 :string(41)
#  bill_address_addr4                 :string(41)
#  bill_address_addr5                 :string(41)
#  bill_address_city                  :string(31)
#  bill_address_state                 :string(21)
#  bill_address_postal_code           :string(13)
#  bill_address_country               :string(31)
#  bill_address_note                  :string(41)
#  bill_address_block_addr1           :string(41)
#  bill_address_block_addr2           :string(41)
#  bill_address_block_addr3           :string(41)
#  bill_address_block_addr4           :string(41)
#  bill_address_block_addr5           :string(41)
#  ship_address_addr1                 :string(41)
#  ship_address_addr2                 :string(41)
#  ship_address_addr3                 :string(41)
#  ship_address_addr4                 :string(41)
#  ship_address_addr5                 :string(41)
#  ship_address_city                  :string(31)
#  ship_address_state                 :string(21)
#  ship_address_postal_code           :string(13)
#  ship_address_country               :string(31)
#  ship_address_note                  :string(41)
#  ship_address_block_addr1           :string(41)
#  ship_address_block_addr2           :string(41)
#  ship_address_block_addr3           :string(41)
#  ship_address_block_addr4           :string(41)
#  ship_address_block_addr5           :string(41)
#  phone                              :string(21)
#  alt_phone                          :string(21)
#  fax                                :string(21)
#  email                              :string(1023)
#  cc                                 :string(1023)
#  contact                            :string(41)
#  alt_contact                        :string(41)
#  customer_type_id                   :string(41)
#  customer_type_full_name            :string(159)
#  terms_id                           :string(41)
#  terms_full_name                    :string(31)
#  sales_rep_id                       :string(41)
#  sales_rep_full_name                :string(5)
#  balance                            :decimal(10, 5)
#  total_balance                      :decimal(10, 5)
#  sales_tax_code_id                  :string(41)
#  sales_tax_code_full_name           :string(3)
#  item_sales_tax_id                  :string(41)
#  item_sales_tax_full_name           :string(31)
#  resale_number                      :string(15)
#  account_number                     :string(99)
#  preferred_payment_method_id        :string(41)
#  preferred_payment_method_full_name :string(31)
#  job_status                         :string(41)
#  job_start_date                     :date
#  job_projected_end_date             :date
#  job_end_date                       :date
#  job_desc                           :string(99)
#  job_type_id                        :string(41)
#  job_type_full_name                 :string(159)
#  preferred_delivery_method          :string(41)
#  price_level_id                     :string(41)
#  price_level_full_name              :string(31)
#  primary_contact                    :string(255)
#  primary_email                      :string(255)
#  primary_phone                      :string(255)
#

class Estimate < ApplicationRecord
 # set optional to true to prevent the database foreign-key checks on quickbooks-created rows
 belongs_to :customer, optional: true
end

# == Schema Information
#
# Table name: estimates
#
#  id                                :string(255)      not null, primary key
#  time_created                      :datetime
#  time_modified                     :datetime
#  edit_sequence                     :string(255)
#  txn_number                        :integer
#  customer_id                       :string(255)
#  customer_full_name                :string(255)
#  template_id                       :string(255)
#  template_full_name                :string(255)
#  txn_date                          :date
#  ref_number                        :string(255)
#  bill_address_addr1                :string(255)
#  bill_address_addr2                :string(255)
#  bill_address_addr3                :string(255)
#  bill_address_addr4                :string(255)
#  bill_address_addr5                :string(255)
#  bill_address_city                 :string(255)
#  bill_address_state                :string(255)
#  bill_address_postal_code          :string(255)
#  bill_address_country              :string(255)
#  bill_address_note                 :string(255)
#  bill_address_block_addr1          :string(255)
#  bill_address_block_addr2          :string(255)
#  bill_address_block_addr3          :string(255)
#  bill_address_block_addr4          :string(255)
#  bill_address_block_addr5          :string(255)
#  ship_address_addr1                :string(255)
#  ship_address_addr2                :string(255)
#  ship_address_addr3                :string(255)
#  ship_address_addr4                :string(255)
#  ship_address_addr5                :string(255)
#  ship_address_city                 :string(255)
#  ship_address_state                :string(255)
#  ship_address_postal_code          :string(255)
#  ship_address_country              :string(255)
#  ship_address_note                 :string(255)
#  ship_address_block_addr1          :string(255)
#  ship_address_block_addr2          :string(255)
#  ship_address_block_addr3          :string(255)
#  ship_address_block_addr4          :string(255)
#  ship_address_block_addr5          :string(255)
#  is_active                         :string(255)
#  po_number                         :string(255)
#  terms_id                          :string(255)
#  terms_full_name                   :string(255)
#  due_date                          :date
#  sales_rep_id                      :string(255)
#  sales_rep_full_name               :string(255)
#  fob                               :string(255)
#  subtotal                          :decimal(15, 2)
#  item_sales_tax_id                 :string(255)
#  item_sales_tax_full_name          :string(255)
#  sales_tax_percentage              :float(24)
#  sales_tax_total                   :decimal(15, 2)
#  total_amount                      :decimal(15, 2)
#  memo                              :text(65535)
#  customer_msg_id                   :string(255)
#  customer_msg_full_name            :string(255)
#  is_to_be_emailed                  :string(255)
#  customer_sales_tax_code_id        :string(255)
#  customer_sales_tax_code_full_name :string(255)
#  linked_txn_id                     :string(255)
#  linked_txn_type                   :string(255)
#  linked_txn_date                   :date
#  linked_txn_ref_number             :string(255)
#  linked_txn_link_type              :string(255)
#  linked_txn_amount                 :decimal(15, 2)
#

class PurchaseOrder < ApplicationRecord
end

# == Schema Information
#
# Table name: purchase_orders
#
#  id                         :string(255)      not null, primary key
#  time_created               :datetime
#  time_modified              :datetime
#  edit_sequence              :string(255)
#  txn_number                 :integer
#  vendor_id                  :string(255)
#  vendor_full_name           :string(255)
#  inventory_site_id          :string(255)
#  inventory_site_full_name   :string(255)
#  ship_to_entity_id          :string(255)
#  ship_to_entity_full_name   :string(255)
#  template_id                :string(255)
#  template_full_name         :string(255)
#  txn_date                   :date
#  ref_number                 :string(255)
#  vendor_address_addr1       :string(255)
#  vendor_address_addr2       :string(255)
#  vendor_address_addr3       :string(255)
#  vendor_address_addr4       :string(255)
#  vendor_address_addr5       :string(255)
#  vendor_address_city        :string(255)
#  vendor_address_state       :string(255)
#  vendor_address_postal_code :string(255)
#  vendor_address_country     :string(255)
#  vendor_address_note        :string(255)
#  vendor_address_block_addr1 :string(255)
#  vendor_address_block_addr2 :string(255)
#  vendor_address_block_addr3 :string(255)
#  vendor_address_block_addr4 :string(255)
#  vendor_address_block_addr5 :string(255)
#  ship_address_addr1         :string(255)
#  ship_address_addr2         :string(255)
#  ship_address_addr3         :string(255)
#  ship_address_addr4         :string(255)
#  ship_address_addr5         :string(255)
#  ship_address_city          :string(255)
#  ship_address_state         :string(255)
#  ship_address_postal_code   :string(255)
#  ship_address_country       :string(255)
#  ship_address_note          :string(255)
#  ship_address_block_addr1   :string(255)
#  ship_address_block_addr2   :string(255)
#  ship_address_block_addr3   :string(255)
#  ship_address_block_addr4   :string(255)
#  ship_address_block_addr5   :string(255)
#  terms_id                   :string(255)
#  terms_full_name            :string(255)
#  due_date                   :date
#  expected_date              :date
#  ship_method_id             :string(255)
#  ship_method_full_name      :string(255)
#  fob                        :string(255)
#  total_amount               :decimal(15, 2)
#  is_manually_closed         :string(255)
#  is_fully_received          :string(255)
#  memo                       :text(65535)
#  vendor_msg                 :string(255)
#  is_to_be_printed           :string(255)
#  is_to_be_emailed           :string(255)
#  linked_txn_id              :string(255)
#  linked_txn_type            :string(255)
#  linked_txn_date            :date
#  linked_txn_ref_number      :string(255)
#  linked_txn_link_type       :string(255)
#  linked_txn_amount          :decimal(15, 2)
#

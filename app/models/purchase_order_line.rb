class PurchaseOrderLine < ApplicationRecord
   # set optional to true to prevent the database foreign-key checks on quickbooks-created rows
   belongs_to :purchase_order, optional: true
end

# == Schema Information
#
# Table name: purchase_order_lines
#
#  id                                :string(255)      not null, primary key
#  purchase_order_id                 :string(255)
#  item_id                           :string(255)
#  item_full_name                    :string(255)
#  manufacturer_part_number          :string(255)
#  desc                              :text(65535)
#  quantity                          :decimal(10, 5)
#  unit_of_measure                   :string(255)
#  override_uom_set_id               :string(255)
#  override_uom_set_full_name        :string(255)
#  rate                              :decimal(15, 2)
#  amount                            :decimal(15, 2)
#  inventory_site_location_id        :string(255)
#  inventory_site_location_full_name :string(255)
#  customer_id                       :string(255)
#  customer_full_name                :string(255)
#  service_date                      :date
#  received_quantity                 :decimal(10, 5)
#  unbilled_quantity                 :decimal(10, 5)
#  is_billed                         :string(255)
#  is_manually_closed                :string(255)
#

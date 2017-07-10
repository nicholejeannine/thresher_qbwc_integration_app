class PurchaseOrderLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :purchase_order, optional: true
  belongs_to :customer
  
  QB_KEYS = %w(txn_line_id item_ref manufacturer_part_number desc quantity unit_of_measure override_uom_set_ref rate amount inventory_site_location_ref customer_ref service_date received_quantity unbilled_quantity is_billed is_manually_closed)

  def self.attributes
    {"purchase_order_id" => nil, "item" => nil, "manufacturer_part_number" => nil, "desc" => nil, "quantity" => nil, "unit_of_measure" => nil, "override_uom_set" => nil, "rate" => nil, "amount" => nil, "inventory_site_location" => nil, "customer_id" => nil, "customer_type" => nil, "service_date" => nil, "received_quantity" => nil, "unbilled_quantity" => nil, "is_billed" => nil, "is_manually_closed" => nil}
  end
end

class PurchaseOrderLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :purchase_order, optional: true
  belongs_to :customer
  
  QB_KEYS = %w(txn_line_id item_ref manufacturer_part_number desc quantity unit_of_measure override_uom_set_ref rate amount inventory_site_location_ref customer_ref service_date received_quantity unbilled_quantity is_billed is_manually_closed)

  def self.attributes
    %w(purchase_order_id item manufacturer_part_number desc quantity unit_of_measure override_uom_set rate amount inventory_site_location customer_id customer_type service_date received_quantity unbilled_quantity is_billed is_manually_closed)
  end
end

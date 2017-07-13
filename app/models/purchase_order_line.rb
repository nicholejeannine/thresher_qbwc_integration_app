class PurchaseOrderLine < ApplicationRecord
  belongs_to :purchase_order

  def self.attributes
    %w(txn_line_id purchase_order_id item manufacturer_part_number desc quantity unit_of_measure override_uom_set rate amount inventory_site_location customer_id customer_type service_date received_quantity unbilled_quantity is_billed is_manually_closed)
  end
end

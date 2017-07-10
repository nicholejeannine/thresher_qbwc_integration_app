class SalesOrderLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :sales_order

  QB_KEYS = %w(txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent amount inventory_site_ref inventory_site_location_ref serial_number lot_number sales_tax_code_ref invoiced is_manually_closed)
  
  def self.attributes
    {"sales_order_id" => nil, "item" => nil, "desc" => nil, "quantity" => nil, "unit_of_measure" => nil, "override_uom_set" => nil, "rate" => nil, "rate_percent" => nil, "amount" => nil, "inventory_site" => nil, "inventory_site_location" => nil, "serial_number" => nil, "lot_number" => nil, "sales_tax_code" => nil, "invoiced" => nil, "is_manually_closed" => nil}
  end
end

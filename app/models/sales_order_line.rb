class SalesOrderLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :sales_order

  def self.qb_id
    "txn_line_id"
  end
  
  def self.attributes
    {"sales_order_id" => nil, "item" => nil, "desc" => nil, "quantity" => nil, "unit_of_measure" => nil, "override_uom_set" => nil, "rate" => nil, "rate_percent" => nil, "amount" => nil, "inventory_site" => nil, "inventory_site_location" => nil, "serial_number" => nil, "lot_number" => nil, "sales_tax_code" => nil, "invoiced" => nil, "is_manually_closed" => nil}
  end
end

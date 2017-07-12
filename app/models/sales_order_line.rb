class SalesOrderLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :sales_order

  QB_KEYS = %w(txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent amount inventory_site_ref inventory_site_location_ref serial_number lot_number sales_tax_code_ref invoiced is_manually_closed)
  
  def self.attributes
    %w(sales_order_id item desc quantity unit_of_measure override_uom_set rate rate_percent amount inventory_site inventory_site_location serial_number lot_number sales_tax_code invoiced is_manually_closed)
  end
end

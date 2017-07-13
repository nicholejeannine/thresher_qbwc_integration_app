class SalesOrderLine < ApplicationRecord
  belongs_to :sales_order

  def self.attributes
    %w(txn_line_id sales_order_id item desc quantity unit_of_measure override_uom_set rate rate_percent amount inventory_site inventory_site_location serial_number lot_number sales_tax_code invoiced is_manually_closed)
  end
end

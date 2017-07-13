class InvoiceLine < ApplicationRecord
  belongs_to :invoice

  def self.attributes
    %w(txn_line_id invoice_id item desc quantity unit_of_measure override_uom_set rate rate_percent amount inventory_site inventory_site_location serial_number lot_number service_date sales_tax_code)
  end
end

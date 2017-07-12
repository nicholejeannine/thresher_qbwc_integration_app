class InvoiceLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :invoice

  QB_KEYS = %w(txn_line_id item_ref desc quantity unit_of_measure override_uom_set_ref rate rate_percent amount inventory_site_ref inventory_site_location_ref serial_number lot_number service_date sales_tax_code_ref)
  
  def self.attributes
    %w(invoice_id item desc quantity unit_of_measure override_uom_set rate rate_percent amount inventory_site inventory_site_location serial_number lot_number service_date sales_tax_code)
  end
end

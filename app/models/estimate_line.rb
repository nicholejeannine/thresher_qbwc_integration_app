class EstimateLine < ApplicationRecord
  belongs_to :estimate
  
  def self.attributes
    %w(txn_line_id estimate_id item desc quantity unit_of_measure override_uom_set rate rate_percent amount inventory_site inventory_site_location sales_tax_code markup_rate markup_rate_percent)
  end
end

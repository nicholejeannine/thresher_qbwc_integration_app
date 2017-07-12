class EstimateLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :estimate
  
  QB_KEYS = %w(item_ref desc quantity unit_of_measure override_UOM_set_ref rate rate_percent amount inventory_site_ref inventory_site_location_ref sales_tax_code_ref markup_rate markup_rate_percent)
  
  def self.attributes
    %w(estimate_id item desc quantity unit_of_measure override_uom_set rate rate_percent amount, inventory_site inventory_site_location sales_tax_code markup_rate markup_rate_percent)
  end
end

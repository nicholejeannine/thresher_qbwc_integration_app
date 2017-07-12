class EstimateLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :estimate
  
  QB_KEYS = %w(item_ref desc quantity unit_of_measure override_UOM_set_ref rate rate_percent amount inventory_site_ref inventory_site_location_ref sales_tax_code_ref markup_rate markup_rate_percent)
  
  def self.attributes
   {"estimate_id" => nil, "item" => nil, "desc" => nil, "quantity" => nil, "unit_of_measure" => nil, "override_uom_set" => nil, "rate" => nil, "rate_percent" => nil, "amount" => 0, "inventory_site" => nil, "inventory_site_location" => nil, "sales_tax_code" => nil, "markup_rate" => nil, "markup_rate_percent" => nil}
  end
end

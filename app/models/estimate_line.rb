class EstimateLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :estimate, optional: true
  
  def self.qb_id
    "txn_line_id"
  end
  
  def self.attributes
   {"estimate_id" => nil, "item" => nil, "desc" => nil, "quantity" => nil, "unit_of_measure" => nil, "override_uom_set" => nil, "rate" => nil, "rate_percent" => nil, "amount" => 0, "inventory_site" => nil, "inventory_site_location" => nil, "sales_tax_code" => nil, "markup_rate" => nil, "markup_rate_percent" => nil}
  end
end

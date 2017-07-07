class Estimate < ApplicationRecord
  include QuickbooksQueryable
  has_many :estimates
  def self.qb_id
    "txn_id"
  end
  
  def self.attributes
  {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "customer_id" => nil, "customer_type" => nil, "template" => nil, "txn_date" => nil, "ref_number" => nil, "bill_addr1" => nil, "bill_addr2" => nil, "bill_addr3" => nil, "bill_addr4" => nil, "bill_addr5" => nil, "bill_city" => nil, "bill_state" => nil, "bill_postal_code" => nil, "bill_country" => nil, "bill_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "is_active" => true, "po_number" => nil, "terms" => nil, "due_date" => nil, "sales_rep" => nil, "fob" => nil, "subtotal" => 0, "item_sales_tax" => 0, "sales_tax_percentage" => 0, "sales_tax_total" => 0, "total_amount" => 0, "memo" => nil, "customer_msg" => nil, "is_to_be_emailed" => nil, "customer_sales_tax_code" => nil}
  end
end

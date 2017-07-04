class SalesOrder < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true
  has_many :sales_order_lines
  before_save :parse_memo

  def self.qb_id
    "txn_id"
  end
  
  def self.attributes
    {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "customer_id" => nil, "customer_type" => nil, "estimate_id" => nil, "template" => nil, "txn_date" => nil, "ref_number" => nil, "bill_addr1" => nil, "bill_addr2" => nil, "bill_addr3" => nil, "bill_addr4" => nil, "bill_addr5" => nil, "bill_city" => nil, "bill_state" => nil, "bill_postal_code" => nil, "bill_country" => nil, "bill_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "po_number" => nil, "terms" => nil, "due_date" => nil, "sales_rep" => nil, "fob" => nil, "ship_date" => nil, "ship_method" => nil, "subtotal" => 0, "item_sales_tax" => nil, "sales_tax_percentage" => nil, "sales_tax_total" => 0, "total_amount" => 0, "is_manually_closed" => nil, "is_fully_invoiced" => nil, "memo" => nil, "customer_msg" => nil, "is_to_be_printed" => nil, "is_to_be_emailed" => nil, "customer_sales_tax_code" => nil}
  end
  def parse_memo
    begin
    if self.estimate_id.nil? && memo&.downcase&.include?("estimate")
      ref = memo.try(:split)[1].remove(":")
      self.estimate_id = Estimate.where(:ref_number => ref)&.first&.id
    end
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Sales Order memo to assign estimate_id: #{e}")
    end
  end
end

class SalesOrder < ApplicationRecord
  include QuickbooksQueryable
  has_many :sales_order_lines
  before_save :parse_memo
  
  QB_KEYS = %w(txn_id time_created time_modified edit_sequence txn_number template_ref txn_date ref_number bill_address ship_address po_number terms_ref due_date sales_rep_ref fob ship_date ship_method_ref subtotal item_sales_tax_ref sales_tax_percentage_ref sales_tax_total total_amount is_manually_closed is_fully_invoiced memo customer_msg_ref is_to_be_printed is_to_be_emailed customer_sales_tax_code_ref sales_order_line_ret)
  
  def self.attributes
    {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "estimate_id" => nil, "template" => nil, "txn_date" => nil, "ref_number" => nil, "bill_addr1" => nil, "bill_addr2" => nil, "bill_addr3" => nil, "bill_addr4" => nil, "bill_addr5" => nil, "bill_city" => nil, "bill_state" => nil, "bill_postal_code" => nil, "bill_country" => nil, "bill_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "po_number" => nil, "terms" => nil, "due_date" => nil, "sales_rep" => nil, "fob" => nil, "ship_date" => nil, "ship_method" => nil, "subtotal" => 0, "item_sales_tax" => nil, "sales_tax_percentage" => nil, "sales_tax_total" => 0, "total_amount" => 0, "is_manually_closed" => nil, "is_fully_invoiced" => nil, "memo" => nil, "customer_msg" => nil, "is_to_be_printed" => nil, "is_to_be_emailed" => nil, "customer_sales_tax_code" => nil}
  end
  
  def parse_memo
    begin
    if self.estimate_id.nil? && memo&.downcase&.include?("estimate")
      ref = memo.try(:split)[1].remove(":")
      self.estimate_id = Estimate.where(:ref_number => ref)&.first&.id
    end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Sales Order memo to assign estimate_id: #{e}")
    end
  end
end

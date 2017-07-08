class Invoice < ApplicationRecord
  include QuickbooksQueryable
  has_many :invoice_lines
  before_save :parse_memo
  
  def self.qb_id
    "txn_id"
  end

  QB_KEYS = %w(txn_id time_created time_modified edit_sequence txn_number customer_ref ar_account_ref template_ref txn_date ref_number bill_address ship_address is_pending is_finance_charge po_number terms_ref due_date sales_rep_ref fob ship_date ship_method_ref subtotal item_sales_tax_ref sales_tax_percentage sales_tax_total applied_amount balance_remaining memo is_paid customer_msg_ref is_to_be_printed is_to_be_emailed customer_sales_tax_code_ref suggested_discount_amount suggested_discount_date linked_txn)
  
  def self.attributes
    {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "customer_id" => nil, "customer_type" => nil, "estimate_id" => nil, "sales_order_id" => nil, "ar_account" => nil, "template" => nil, "txn_date" => nil, "ref_number" => nil, "bill_addr1" => nil, "bill_addr2" => nil, "bill_addr3" => nil, "bill_addr4" => nil, "bill_addr5" => nil, "bill_city" => nil, "bill_state" => nil, "bill_postal_code" => nil, "bill_country" => nil, "bill_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "is_pending" => nil, "is_finance_charge" => nil, "po_number" => nil, "terms" => nil, "due_date" => nil, "sales_rep" => nil, "fob" => nil, "ship_date" => nil, "ship_method" => nil, "subtotal" => nil, "item_sales_tax" => nil, "sales_tax_percentage" => nil, "sales_tax_total" => nil, "applied_amount" => nil, "balance_remaining" => nil, "memo" => nil, "is_paid" => nil, "customer_msg" => nil, "is_to_be_printed" => nil, "is_to_be_emailed" => nil, "customer_sales_tax_code" => nil, "suggested_discount_amount" => nil, "suggested_discount_date" => nil}
  end

  def parse_linked_txn(hash)
    if hash["txn_type"] == "SalesOrder"
      txn_id = hash["txn_id"]
      self.sales_order_id = SalesOrder.find_by("txn_id" => txn_id)&.id
    end
  end

  def parse_memo
    begin
      if self.estimate_id.nil? && memo&.downcase&.include?("estimate")
        i = memo&.downcase&.remove(":")&.split
        ref = i[i.index("estimate") + 1]
        self.estimate_id = Estimate.where(:ref_number => ref).first&.id
      end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Invoice memo to assign estimate_id: #{e}")
    end
  end
end

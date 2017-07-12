class Invoice < ApplicationRecord
  include QuickbooksQueryable
  include QuickbooksLineItemUtils
  has_many :invoice_lines
  before_save :parse_memo

  QB_KEYS = %w(txn_id time_created time_modified edit_sequence txn_number customer_ref ar_account_ref template_ref txn_date ref_number bill_address ship_address is_pending is_finance_charge po_number terms_ref due_date sales_rep_ref fob ship_date ship_method_ref subtotal item_sales_tax_ref sales_tax_percentage sales_tax_total applied_amount balance_remaining memo is_paid customer_msg_ref is_to_be_printed is_to_be_emailed customer_sales_tax_code_ref suggested_discount_amount suggested_discount_date invoice_line_ret linked_txn)
  
  def self.attributes
    %w(txn_id time_created time_modified edit_sequence txn_number customer_id customer_type estimate_id sales_order_id ar_account template txn_date ref_number bill_addr1 bill_addr2 bill_addr3 bill_addr4 bill_addr5 bill_city bill_state bill_postal_code bill_country bill_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note is_pending is_finance_charge po_number terms due_date sales_rep fob ship_date ship_method subtotal item_sales_tax sales_tax_percentage sales_tax_total applied_amount balance_remaining memo is_paid customer_msg is_to_be_printed is_to_be_emailed customer_sales_tax_code suggested_discount_amount suggested_discount_date)
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

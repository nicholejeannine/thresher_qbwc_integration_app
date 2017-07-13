class SalesOrder < ApplicationRecord
  has_many :sales_order_lines
  before_save :parse_memo

  def self.attributes
    %w(txn_id time_created time_modified edit_sequence txn_number estimate_id template txn_date ref_number bill_addr1 bill_addr2 bill_addr3 bill_addr4 bill_addr5 bill_city bill_state bill_postal_code bill_country bill_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note po_number terms due_date sales_rep fob ship_date ship_method subtotal item_sales_tax sales_tax_percentage sales_tax_total total_amount is_manually_closed is_fully_invoiced memo customer_msg is_to_be_printed is_to_be_emailed customer_sales_tax_code)
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

class Estimate < ApplicationRecord
  include QuickbooksQueryable
  include QuickbooksLineItemUtils
  has_many :estimate_lines
  
  # TODO: RE-AD CUSTOMER REF
  
  QB_KEYS = %w(txn_id time_created time_modified edit_sequence txn_number template_ref txn_date ref_number bill_address ship_address is_active po_number terms_ref due_date sales_rep_ref fob subtotal item_sales_tax_ref sales_tax_percentage sales_tax_total total_amount memo customer_msg_ref is_to_be_emailed customer_sales_tax_code_ref)
  
  # FIXME: RE-ADD CUSTOMER REF
  def self.attributes
    %w(txn_id time_created time_modified edit_sequence txn_number template txn_date ref_number bill_addr1 bill_addr2 bill_addr3 bill_addr4 bill_addr5 bill_city bill_state bill_postal_code bill_country bill_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note is_active, po_number terms due_date sales_rep fob subtotal, item_sales_tax, sales_tax_percentage, sales_tax_total, total_amount, memo customer_msg is_to_be_emailed customer_sales_tax_code)
  end
end

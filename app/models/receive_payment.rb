class ReceivePayment < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true

  QB_KEYS = %w(txn_id time_created time_modified edit_sequence txn_number customer_ref ar_account_ref txn_date ref_number total_amount payment_method_ref memo deposit_to_account_ref unused_payment unused_credits applied_to_txn_ret)
  
  def self.attributes
  %w(txn_id time_created time_modified edit_sequence txn_number customer_id customer_type invoice_id ar_account txn_date ref_number total_amount payment_method memo deposit_to_account unused_payment unused_credits)
  end

  def parse_linked_txn(hash)
    if hash["txn_type"] == "Invoice"
      txn_id = hash["txn_id"]
      self.invoice_id = Invoice.find_by("txn_id" => txn_id)&.id
    end
  end
end

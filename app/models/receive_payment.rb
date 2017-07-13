class ReceivePayment < ApplicationRecord

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

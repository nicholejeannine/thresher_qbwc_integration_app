class ReceivePayment < ApplicationRecord

  def parse_linked_txn(hash)
    if hash["txn_type"] == "Invoice"
      txn_id = hash["txn_id"]
      self.invoice_id = Invoice.find_by("txn_id" => txn_id)&.id
    end
  end
end

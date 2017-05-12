class ReceivePayment < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true

  def parse_linked_txn hash
    if hash["txn_type"] == "Invoice"
      self.invoice_id = hash["txn_id"]
    end
  end
end

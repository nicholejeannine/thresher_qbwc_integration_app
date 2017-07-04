class ReceivePayment < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true
  
  def self.qb_id
    "txn_id"
  end

  def parse_linked_txn(hash)
    if hash["txn_type"] == "Invoice"
      self.invoice_id = hash["txn_id"]
    end
  end
end

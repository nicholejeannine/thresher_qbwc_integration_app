class ReceivePayment < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true
  
  def self.qb_id
    "txn_id"
  end
  
  def self.attributes
    {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "customer_id" => nil, "customer_type" => nil, "invoice_id" => nil, "ar_account" => nil, "txn_date" => nil, "ref_number" => nil, "total_amount" => nil, "payment_method" => nil, "memo" => nil, "deposit_to_account" => nil, "unused_payment" => nil, "unused_credits" => nil}
  end

  def parse_linked_txn(hash)
    if hash["txn_type"] == "Invoice"
      self.invoice_id = hash["txn_id"]
    end
  end
end

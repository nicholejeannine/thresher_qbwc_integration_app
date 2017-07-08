class ReceivePayment < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true
  
  def self.qb_id
    "txn_id"
  end
  QB_KEYS = %w(txn_id time_created time_modified edit_sequence txn_number customer_ref ar_account_ref txn_date ref_number total_amount payment_method_ref memo deposit_to_account_ref unused_payment unused_credits applied_to_txn_ret)
  
  def self.attributes
    {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "customer_id" => nil, "customer_type" => nil, "invoice_id" => nil, "ar_account" => nil, "txn_date" => nil, "ref_number" => nil, "total_amount" => nil, "payment_method" => nil, "memo" => nil, "deposit_to_account" => nil, "unused_payment" => nil, "unused_credits" => nil}
  end

  def parse_linked_txn(hash)
    if hash["txn_type"] == "Invoice"
      txn_id = hash["txn_id"]
      self.invoice_id = Invoice.find_by("txn_id" => txn_id)&.id
    end
  end
end

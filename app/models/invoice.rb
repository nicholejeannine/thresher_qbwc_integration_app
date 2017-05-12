class Invoice < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true
  has_many :invoice_lines
  
  def parse_linked_txn hash
    if hash["txn_type"] == "SalesOrder"
      self.sales_order_id = hash["txn_id"]
    end
  end
end

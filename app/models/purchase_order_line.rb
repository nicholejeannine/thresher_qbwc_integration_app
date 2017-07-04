class PurchaseOrderLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :purchase_order, optional: true
  belongs_to :customer, optional: true

  def self.qb_id
    "txn_line_id"
  end
end

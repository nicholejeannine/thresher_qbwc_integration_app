class PurchaseOrderLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :purchase_order, optional: true
  belongs_to :customer, optional: true
end

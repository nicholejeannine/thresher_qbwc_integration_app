class PurchaseOrderLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :purchase_order, optional: true
  belongs_to :customer, optional: true
end

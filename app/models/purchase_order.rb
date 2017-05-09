class PurchaseOrder < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  has_many :purchase_order_lines
end

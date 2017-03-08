class PurchaseOrder < ApplicationRecord
 include QuickbooksQueryable
 has_many :purchase_order_lines
end

class PurchaseOrder < ApplicationRecord
 self.primary_key = :id # In case customer model represents a mysql view
 has_many :purchase_order_lines
end

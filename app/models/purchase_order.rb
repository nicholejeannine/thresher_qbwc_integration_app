class PurchaseOrder < QuickbooksModel
  has_many :purchase_order_lines
end

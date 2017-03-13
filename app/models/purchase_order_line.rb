class PurchaseOrderLine < QuickbooksModel
  belongs_to :purchase_order, optional: true
end

class SalesOrderLine < QuickbooksModel
  belongs_to :sales_order, optional: true
end

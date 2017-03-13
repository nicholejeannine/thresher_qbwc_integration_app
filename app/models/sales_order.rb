class SalesOrder < QuickbooksModel
  belongs_to :customer, optional: true
  has_many :sales_order_lines
end

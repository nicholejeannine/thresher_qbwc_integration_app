class Invoice < QuickbooksModel
  belongs_to :customer, optional: true
  has_many :invoice_lines
end

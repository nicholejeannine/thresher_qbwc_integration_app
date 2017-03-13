class InvoiceLine < QuickbooksModel
  belongs_to :invoice, optional: true
end

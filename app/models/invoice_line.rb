class InvoiceLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :invoice, optional: true
end

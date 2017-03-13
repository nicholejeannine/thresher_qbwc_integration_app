class InvoiceLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :invoice, optional: true
end

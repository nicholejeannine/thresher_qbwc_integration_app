class Invoice < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true
  has_many :invoice_lines
end

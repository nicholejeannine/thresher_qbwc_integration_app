class SalesOrder < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true
  has_many :sales_order_lines
end

class SalesOrder < ApplicationRecord
   self.primary_key = :id # In case customer model represents a mysql view
   # set optional to true to prevent the database foreign-key checks on quickbooks-created rows
   belongs_to :customer, optional: true
   has_many :sales_order_lines
end

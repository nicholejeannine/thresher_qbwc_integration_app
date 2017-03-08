class SalesOrder < ApplicationRecord
   include QuickbooksQueryable
   belongs_to :customer, optional: true
   has_many :sales_order_lines
end

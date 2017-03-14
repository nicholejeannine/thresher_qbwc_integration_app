class SalesOrderLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :sales_order, optional: true
end

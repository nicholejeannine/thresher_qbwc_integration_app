class SalesOrderLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :sales_order, optional: true

  def self.qb_id
    "txn_line_id"
  end
end

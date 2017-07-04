class InvoiceLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :invoice, optional: true

  def self.qb_id
    "txn_line_id"
  end
end

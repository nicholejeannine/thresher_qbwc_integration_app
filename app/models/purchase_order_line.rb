class PurchaseOrderLine < ApplicationRecord
   include QuickbooksQueryable
   belongs_to :purchase_order, optional: true
end

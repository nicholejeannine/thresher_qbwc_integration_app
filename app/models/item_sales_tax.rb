class ItemSalesTax < ApplicationRecord
 self.primary_key = false
 belongs_to :customer
end

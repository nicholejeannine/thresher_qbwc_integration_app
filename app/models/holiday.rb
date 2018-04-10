class Holiday < ActiveRecord::Base
  self.primary_key= :id
  self.table_name = 'view_holidays'
  has_many :timecard_transactions
end
class Employee < ApplicationRecord
  self.primary_key= :id
  has_many :timecard_transactions
end

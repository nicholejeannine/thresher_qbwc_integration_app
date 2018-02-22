# The Employee class is a view of active employees in the Portal
class Employee < ApplicationRecord
  self.primary_key= :id
  has_many :timecard_transactions
end

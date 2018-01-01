# The Employee class is a view and may be redundant (TODO: check to see if qb_employee covers this)
class Employee < ApplicationRecord
  self.primary_key= :id
  has_many :timecard_transactions
end

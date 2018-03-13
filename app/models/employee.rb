# The Employee class is a view of active employees in the Portal
class Employee < ApplicationRecord
  self.primary_key= :id
  self.table_name = 'qb.employees'
  has_many :timecard_transactions
end

class Employee < ApplicationRecord
  has_many :timecard_transactions
end

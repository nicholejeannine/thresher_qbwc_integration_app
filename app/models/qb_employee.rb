# The qb_employees table simply stores the Quickbooks employee_list_id and name of each employee.
class QbEmployee < ApplicationRecord
  has_many :timecard_transactions
end
class EstimateLine < ApplicationRecord
 self.primary_key = :id # In case customer model represents a mysql view
  # set optional to true to prevent database foreign-key checks on quickbooks-created rows
 belongs_to :estimate, optional: true
end


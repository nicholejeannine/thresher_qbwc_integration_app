class EstimateLine < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :estimate, optional: true
end

class EstimateLine < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :estimate, optional: true
end

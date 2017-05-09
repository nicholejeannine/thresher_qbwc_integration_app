class Estimate < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true
  has_many :estimate_lines
end

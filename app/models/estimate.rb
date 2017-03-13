class Estimate < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true
  has_many :estimate_lines
end

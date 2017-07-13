class Estimate < ApplicationRecord
  include QuickbooksLineItemUtils
  has_many :estimate_lines
end

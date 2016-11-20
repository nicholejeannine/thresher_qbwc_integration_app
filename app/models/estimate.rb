class Estimate < ApplicationRecord
 belongs_to :customer
 has_many :estimate_lines
end

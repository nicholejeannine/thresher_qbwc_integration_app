class Estimate < QuickbooksModel
  belongs_to :customer, optional: true
  has_many :estimate_lines
end

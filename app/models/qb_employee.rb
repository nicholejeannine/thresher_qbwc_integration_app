class QbEmployee < ApplicationRecord
  has_many :timecard_transactions
end
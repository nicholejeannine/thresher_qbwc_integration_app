class Ticket < ActiveRecord::Base
  self.primary_key= :id
  has_many :timecard_transactions
end
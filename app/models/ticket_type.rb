class TicketType < ActiveRecord::Base
  self.primary_key= :id
  self.table_name = 'ticket_types'
  has_many :tickets, as: :ticket_type
  has_many :tickets, as: :ticket_subtype1
  has_many :tickets, as: :ticket_subtype2
end
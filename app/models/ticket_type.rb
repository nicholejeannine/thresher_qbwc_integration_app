class TicketType < ActiveRecord::Base
  self.primary_key= :id
  self.table_name = 'ticket_types'
end
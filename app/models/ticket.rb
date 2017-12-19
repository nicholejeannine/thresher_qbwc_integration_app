class Ticket < ActiveRecord::Base
  self.primary_key= :id
  has_many :timecard_transactions
  belongs_to :ticket_type, class_name: "TicketType", foreign_key: "ticket_type_id"
  belongs_to :ticket_subtype1, class_name: "TicketType", foreign_key: "ticket_subtype1_id"
  belongs_to :ticket_subtype2, class_name: "TicketType", foreign_key: "ticket_subtype2_id"
end
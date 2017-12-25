class Ticket < ActiveRecord::Base
  self.primary_key= :id
  has_many :timecard_transactions
  belongs_to :ticket_type, class_name: "TicketType", foreign_key: "ticket_type_id"
  belongs_to :ticket_subtype1, class_name: "TicketType", foreign_key: "ticket_subtype1_id"
  belongs_to :ticket_subtype2, class_name: "TicketType", foreign_key: "ticket_subtype2_id"

  def service_code
    one = self.ticket_type&.service_code || "0"
    two = self.ticket_subtype1&.service_code || "0"
    three = self.ticket_subtype2&.service_code || "0"
    "Video:0#{one}#{two}#{three}"
  end
end
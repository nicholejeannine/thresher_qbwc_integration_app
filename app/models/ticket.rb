class Ticket < ActiveRecord::Base
  self.table_name = 'view_tickets'
  self.primary_key= :id
  has_many :timecard_transactions
  belongs_to :ticket_type, class_name: "TicketType", foreign_key: "ticket_type_id"
  belongs_to :ticket_subtype1, class_name: "TicketType", foreign_key: "ticket_subtype1_id"
  belongs_to :ticket_subtype2, class_name: "TicketType", foreign_key: "ticket_subtype2_id"

  # The service code can be determined by looking at all the ticket type/subtype service codes and chaining them together. "Video:0000" is not a valid service code in Quickbooks, so nil is returned if a valid service code could not be calculated from the ticket.
  def service_code
    one = self.ticket_type&.service_code || "0"
    two = self.ticket_subtype1&.service_code || "0"
    three = self.ticket_subtype2&.service_code || "0"
    service_code = "Video:0#{one}#{two}#{three}"
    if service_code == "Video:0000"
      return nil
    end
    service_code
  end
end
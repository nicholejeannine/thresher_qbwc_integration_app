require 'test_helper'
class TicketTest < ActiveSupport::TestCase

  test "can generate accurate service code" do
    assert_equal("Video:0540", Ticket.find(19399).service_code)
    assert_equal("Video:0130", Ticket.find(19449).service_code)
    assert_equal("Video:0110", Ticket.find(17202).service_code)
    assert_nil(Ticket.find(17173).service_code)
  end

end

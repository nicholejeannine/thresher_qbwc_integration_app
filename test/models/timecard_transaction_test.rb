require 'test_helper'
class TimecardTransactionTest < ActiveSupport::TestCase

  test "can load all models" do
    assert_equal(159408, TimecardTransaction.count, "should have 159408 timecard transactions")
    assert_equal(231, Employee.count, "should equal 231 employees")
    assert_equal(82, Holiday.count, "should equal 82 holidays")
    assert_equal(20801, Ticket.count, "should equal 20801 tickets")
    assert_equal(112, TicketType.count, "should equal 112 ticket types")
  end

  def setup

  end

end

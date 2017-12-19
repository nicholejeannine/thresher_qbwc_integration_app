require 'test_helper'
class TimecardTransactionTest < ActiveSupport::TestCase

  test "can load all models" do
    assert_equal(159408, TimecardTransaction.count, "should have 159408 timecard transactions")
    assert_equal(231, Employee.count, "should equal 231 employees")
    assert_equal(82, Holiday.count, "should equal 82 holidays")
    assert_equal(20801, Ticket.count, "should equal 20801 tickets")
    assert_equal(112, TicketType.count, "should equal 112 ticket types")
  end


  test "between" do
    assert_equal(363, TimecardTransaction.between("2017-12-03", "2017-12-09").count)
    assert_equal(0, TimecardTransaction.between("2017-12-03", "2017-12-09").where(:tc_date => "2017-12-02").count)
  end

  test "lookup_customer_name works for holiday" do
    assert_equal("TCP:Business", TimecardTransaction.find(117878).lookup_customer_name)
  end

  test "lookup_customer_name works for projects" do
    assert_equal("TCP:Logistics:P-916", TimecardTransaction.find(177692).lookup_customer_name)
  end

  test "lookup_customer_name works for jobs" do
    assert_equal("Facebook:Construction:1055 B1", TimecardTransaction.find(467).lookup_customer_name)
  end

  test "lookup customer name works for clients" do
    assert_equal("LLESD", TimecardTransaction.find(164864).lookup_customer_name)
  end

  test "qb_duration" do
    assert_equal("PT2H0M", TimecardTransaction.find(164864).qb_duration)
    assert_equal("PT8H30M", TimecardTransaction.find(179588).qb_duration)
    assert_equal("PT0H45M", TimecardTransaction.find(179699).qb_duration)
    assert_equal("PT10H15M", TimecardTransaction.find(178407).qb_duration)
  end

  test "qb_notes should return holiday name, ticket #, or blank" do
    assert_equal("Christmas", TimecardTransaction.find(179352).qb_notes)
    assert_equal("22648", TimecardTransaction.find(179772).qb_notes)
    assert_equal("", TimecardTransaction.find(179702).qb_notes)
  end

end

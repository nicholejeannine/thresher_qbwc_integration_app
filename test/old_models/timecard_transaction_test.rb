require 'test_helper'

class TimecardTransactionTest < ActiveSupport::TestCase

  
  test "holiday? returns true if it's a holiday, false if not" do
    assert_equal(true, TimecardTransaction.find(179936).holiday?)
    assert_equal(false, TimecardTransaction.find(7).holiday?)
  end
  
  test "been grab all timecards between a specified start and end date" do
    assert_equal(363, TimecardTransaction.between("2017-12-03", "2017-12-09").count)
    assert_equal(0, TimecardTransaction.between("2017-12-03", "2017-12-09").where(:tc_date => "2017-12-02").count)
  end
  
  test "customer_full_name returns TCP:Business on holidays" do
    assert_equal("TCP:Business", TimecardTransaction.find(117878).customer_full_name)
  end

  
  test "customer_full_name returns TCP:Business on holidays with holiday=0 (bug in portal code)" do
    assert_equal("TCP:Business", TimecardTransaction.find(179936).customer_full_name)
  end
  
  test "customer_full_name returns the Quickbooks customer full name if there's a match" do
    assert_equal("General Assembly:Construction:P-659", TimecardTransaction.find(98686).customer_full_name)
  end
  
  test "customer_full_name returns empty if no match" do
    assert_equal("", TimecardTransaction.find(181023).customer_full_name)
  end
  
  test "valid_customer? method determines whether customer_full_name is blank" do
    assert_equal(false, TimecardTransaction.find(181023).valid_customer?)
    assert_equal(true, TimecardTransaction.find(98686).valid_customer?)
  end
  
  test "employee_name returns employee's name" do
    assert_equal("Castillo, Juan", TimecardTransaction.find(98686).employee_name)
  end
  
  test "qb_duration returns a string formatted to Quickbooks-friendy duration format" do
    assert_equal("PT2H0M", TimecardTransaction.find(164864).qb_duration)
    assert_equal("PT8H30M", TimecardTransaction.find(179588).qb_duration)
    assert_equal("PT0H45M", TimecardTransaction.find(179699).qb_duration)
    assert_equal("PT10H15M", TimecardTransaction.find(178407).qb_duration)
  end
  
  test "qb_notes should return holiday name if holiday" do
    assert_equal("Christmas", TimecardTransaction.find(179352).qb_notes)
  end
  
  test "qb_notes should return ticket id if hours are logged against a ticket" do
    assert_equal("22648", TimecardTransaction.find(179772).qb_notes)
  end
  
  test "qb_notes shoud return empty if not a holiday or ticket" do
    assert_equal("", TimecardTransaction.find(179702).qb_notes)
  end
  
  test "qb_notes should return holiday name, even when holiday_id is 0" do
    assert_equal("New Year&#039;s Day", TimecardTransaction.find(177681).qb_notes)
  end
  
  
  test "TimecardTransaction#service_code should be based on ticket type" do
    assert_equal("Video:0100", TimecardTransaction.find(179753).service_code)
    assert_equal("Video:0120", TimecardTransaction.find(175126).service_code)
  end
  
  test "qb_payroll_ref returns the rate string" do
    assert_equal("Hourly Holiday Rate", TimecardTransaction.find(179753).qb_payroll_ref)
    assert_equal("Hourly PTO Rate", TimecardTransaction.find(179540).qb_payroll_ref)
    assert_equal("Hourly TWOP Rate", TimecardTransaction.find(178825).qb_payroll_ref)
    # An hourly person should return "Hourly Level 1"
    assert_equal("Hourly Level 1", TimecardTransaction.find(160995).qb_payroll_ref)
    assert_equal("Salary Level 1", TimecardTransaction.find(18906).qb_payroll_ref)
  end
  
  test "build request for PTO, regular, and holiday types" do
    assert_equal({:time_tracking_add_rq=> {:time_tracking_add=> {:txn_date=>"2017-06-01", :entity_ref=>{:list_id=>"80000B99-1397871128"}, :customer_ref=>{:full_name=>"TCP:PTO:P-914"}, :item_service_ref=>{:full_name=>"Video:0100"}, :duration=>"PT8H0M", :payroll_item_wage_ref=>{:full_name=>"Hourly PTO Rate"}, :notes=>"", :billable_status=>"NotBillable"}}}, TimecardTransaction.find(158765).build_request)
    assert_equal({:time_tracking_add_rq=> {:time_tracking_add=> {:txn_date=>"2017-06-01", :entity_ref=>{:list_id=>"80001440-1460409806"}, :customer_ref=>{:full_name=>"TCP:IT:P-903"}, :item_service_ref=>{:full_name=>"Video:0100"}, :duration=>"PT8H0M", :payroll_item_wage_ref=>{:full_name=>"Hourly Level 1"}, :notes=>"", :billable_status=>"NotBillable"}}}, TimecardTransaction.find(167697).build_request)
    assert_equal({:time_tracking_add_rq=> {:time_tracking_add=> {:txn_date=>"2017-09-04", :entity_ref=>{:list_id=>"800007EF-1303964767"}, :customer_ref=>{:full_name=>"TCP:Business"}, :item_service_ref=>{:full_name=>"Video:0100"}, :duration=>"PT8H0M",  :payroll_item_wage_ref=>{:full_name=>"Hourly Holiday Rate"}, :notes=>"Labor Day", :billable_status=>"NotBillable"}}}, TimecardTransaction.find(170346).build_request)
  end

  def setup
    QbwcTimecardError.destroy_all
    QbwcError.destroy_all
  end

end

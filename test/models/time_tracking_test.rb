require 'test_helper'
require 'fixtures/time_tracking_hash'

class TimeTrackingTest < ActiveSupport::TestCase
  include TimeTrackingHash

  test "can parse a simple hash" do
    assert_equal(1, TimeTracking.count, "should equal 100")
  end

  test "handles ref types" do
    assert_equal("Apikelis, Roland", TimeTracking.first.employee_full_name)
    assert_equal("Google:Construction", TimeTracking.first.customer_full_name)
    assert_equal("Video:0100", TimeTracking.first.item_service)
    assert_equal("PT8H0M", TimeTracking.first.duration)
    assert_equal("Hourly Level 1", TimeTracking.first.payroll_item_wage)
    assert_equal("V/C Upgrades", TimeTracking.first.notes)
    assert_equal("NotBillable", TimeTracking.first.billable_status)
  end

  test "updates existing hash" do
    hash =  {"xml_attributes"=>{}, "txn_id"=>"5CA94-1183243364", "time_created"=>"2007-06-30T15:42:44-08:00", "time_modified"=>"2007-06-30T15:42:44-08:00", "edit_sequence"=>"1183243364", "txn_number"=>0, "txn_date"=>"2017-06-11", "entity_ref"=>{"xml_attributes"=>{}, "list_id"=>"5150000-1173314561", "full_name"=>"Joe Bean"}, "customer_ref"=>{"xml_attributes"=>{}, "list_id"=>"49B0000-1133993641", "full_name"=>"Google:Construction:Rooftop:P-11"}, "item_service_ref"=>{"xml_attributes"=>{}, "list_id"=>"31A0000-989981084", "full_name"=>"Video:0100"}, "duration"=>"PT7H30M", "class_ref"=>{"xml_attributes"=>{}, "list_id"=>"200000-991719211", "full_name"=>"Video:Cabling Mgmt"}, "payroll_item_wage_ref"=>{"xml_attributes"=>{}, "list_id"=>"E0000-875338868", "full_name"=>"Hourly Level 1"}, "notes"=>"Ticket 10", "billable_status"=>"NotBillable"}
    TimeTracking.parse_qb_response(hash)
    assert_equal(1, TimeTracking.count)
    assert_equal("2017-06-11T00:00:00-07:00", TimeTracking.first.txn_date.iso8601)
    assert_equal("Joe Bean", TimeTracking.first.employee_full_name)
    assert_equal("Google:Construction:Rooftop:P-11", TimeTracking.first.customer_full_name)
    assert_equal("PT7H30M", TimeTracking.first.duration)
    assert_equal("Ticket 10", TimeTracking.first.notes)
  end

  def setup
    TimeTracking.destroy_all
    TimeTracking.parse_qb_response(qb_hash)
  end

end

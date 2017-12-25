require 'test_helper'
ENV['RAILS_ENV'] = 'development'
class TimeTrackingTest < ActiveSupport::TestCase

  test "between - run in console" do
    assert_not_equal(0, TimeTracking.between("2017-11-03", "2017-12-09").count)
    assert_equal(0, TimeTracking.between("2017-12-03", "2017-12-09").where(:txn_date => "2017-12-02").count)
  end

  test "from_qb_duration - run in console" do
    assert_equal(8.0, TimeTracking.first.from_qb_duration)
    assert_equal(7.5, TimeTracking.find(260).from_qb_duration)
    assert_equal(2.25, TimeTracking.find(88).from_qb_duration)
  end

  test "tc_date - run in console" do
    assert_equal("2013-01-21", TimeTracking.first.tc_date)
    assert_equal("2016-12-28", TimeTracking.find(260).tc_date)
    assert_equal("2017-01-18", TimeTracking.find(1500).tc_date)
  end

end

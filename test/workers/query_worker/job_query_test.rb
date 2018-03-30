require 'test_helper'
require 'workers/query_worker/fixtures/job_hash'

class JobQueryTest < ActiveSupport::TestCase
  include JobHash
  
  
  # after sending a test pass of "silly data", grab the customer where the full name matches, and assert that all of the fields names were correctly updated
  test "Customer.parse_customer_response matches on list_id and updates the appropriate record" do
    # first assert we have one client in the database, that our sql method in "setup" worked
    assert_equal(1, Job.count)
    Customer.parse_customer_response(qb_hash)
    assert_equal(1, Job.count)
    j = Job.first
    # assert that the ship to address is the fake value we assigned it, BEFORE we run the update, so then we can assert that it becomes nil afterward.
    # Reassign the value c and check the fields were all updated
    assert_equal("NAME", j.Job_QB_JobName)
    assert_equal("COMPANYNAME", j.Job_Company)
    assert_equal("SA", j.Job_NameSalutation)
    assert_equal("FIRST", j.Job_NameFirst)
    assert_equal("M", j.Job_NameMiddle	)
    assert_equal("LAST", j.Job_NameLast)
    assert_equal("999-999-9999", j.Job_PhoneOffice)
    assert_equal("EMAIL@EMAIL.COM", j.Job_EmailTo)
    assert_equal("999-999-9999", j.Job_PhoneAlt)
    assert_equal("EMAIL@EMAIL.COM", j.Job_EmailCC)
    assert_equal("999-999-9999", j.mobile)
    assert_equal("999-999-9999", j.Job_PhoneFax)
    assert_equal("ADDR1", j.bill_addr1)
    assert_equal("ADDR2", j.bill_addr2)
    assert_equal("ADDR3", j.bill_addr3)
    assert_equal("ADDR4", j.bill_addr4)
    assert_equal("CITY", j.bill_city)
    assert_equal("AA", j.bill_state)
    assert_equal("99999", j.bill_postal_code)
    assert_equal("ADDR1", j.ship_addr1)
    assert_equal("ADDR2", j.ship_addr2)
    assert_equal("ADDR3", j.ship_addr3)
    assert_nil(j.ship_addr4)
    assert_equal("CITY", j.ship_city)
    assert_equal("AA", j.ship_state)
    assert_equal("99999", j.ship_postal_code)
    assert_equal("X", j.Job_InactiveFlag)
    assert_equal("AAA", j.sales_rep)
    assert_equal("Job", j.Job_Status)
    assert_equal("1982-12-30", j.Job_DateStartActual.to_s)
    assert_equal("1982-12-30", j.Job_DateEndProjected.to_s)
    assert_equal("1982-12-30", j.Job_DateEndActual.to_s)
    assert_equal("800006BC-1257534763", j.list_id)
    assert_equal("Some Description", j.Job_Description_Short)
  end

  test "Customer.parse_customer_response creates a new record when the list id is not found" do
    Job.destroy_all
    Customer.parse_customer_response(qb_hash)
    Customer.parse_customer_response(no_matching_name)
    assert_equal(2, Job.count)
  end
  
  def setup
    Client.destroy_all
    Job.destroy_all
    QbwcError.destroy_all
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `Cust_CompanyAbr`) VALUES (13, 'Facebook')"
    ActiveRecord::Base.connection.execute(sql)
    sql = "INSERT INTO `Jobs` (`list_id`, `Jobs_PKEY`, `Job_QB_JobName`, `full_name`) VALUES ('800006BC-1257534763', 2, 'Construction', 'Facebook:Construction');"
    ActiveRecord::Base.connection.execute(sql)
  end
end
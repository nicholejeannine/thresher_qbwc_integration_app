require 'test_helper'
require 'fixtures/job_hash'

class JobQueryTest < ActiveSupport::TestCase
  include JobHash
  
  
  # after sending a test pass of "silly data", grab the customer where the full name matches, and assert that all of the fields names were correctly updated
  test "when processing the query request, it updates the correct fields" do
    # first assert we have one client in the database, that our sql method in "setup" worked
    assert_equal(1, Job.count)
    j = Job.where("full_name" => "Facebook:Construction").first
    # assert that the ship to address is the fake value we assigned it, BEFORE we run the update, so then we can assert that it becomes nil afterward.
    # Reassign the value c and check the fields were all updated
    assert_equal("NAME", j.Job_QB_JobName)
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
    assert_equal(99999, j.bill_postal_code)
    assert_equal("ADDR1", j.ship_addr1)
    assert_equal("ADDR2", j.ship_addr2)
    assert_equal("ADDR3", j.ship_addr3)
    assert_nil(j.ship_addr4)
    assert_equal("CITY", j.ship_city)
    assert_equal("AA", j.ship_state)
    assert_equal(99999, j.ship_postal_code)
    assert_equal("X", j.Job_InactiveFlag)
    assert_equal("AAA", j.sales_rep)
    assert_equal("Job", j.Job_Status)
    assert_equal("1982-12-30", j.Job_DateStartActual)
    assert_equal("1982-12-30", j.Job_DateEndProjected)
    assert_equal("1982-12-30", j.Job_DateEndActual)
    assert_equal("800006BC-1257534763", j.list_id)
  end
  
  test "sending a nonmatching client name writes another customer" do
    Job.destroy_all
    Customer.parse_customer_response(qb_hash)
    Customer.parse_customer_response(no_matching_name)
    assert_equal(2, Job.count)
  end
  
  def setup
    Job.destroy_all
    sql = "INSERT INTO `Jobs` (`Jobs_PKEY`, `CreationTimeStamp`, `CreationUser`, `LastModificationTimeStamp`, `LastModificationUser`, `FK_JobID_Parent`, `FK_Customers_PKEY`, `Job_Company`, `Job_CompanyAbr`, `Job_Contact`, `Job_ContactAlt`, `Job_DateEndActual`, `Job_DateEndProjected`, `Job_DateStartActual`, `Job_DateStartProjected`, `Job_Description_Long`, `Job_Description_Short`, `Job_EmailCC`, `Job_EmailTo`, `Job_InactiveFlag`, `Job_NameFirst`, `Job_NameLast`, `Job_NameMiddle`, `Job_NameSalutation`, `Job_PhoneAlt`, `Job_PhoneFax`, `Job_PhoneOffice`, `Job_QB_JobName`, `Job_Status`, `list_id`, `full_name`, `mobile`, `bill_addr1`, `bill_addr2`, `bill_addr3`, `bill_addr4`, `bill_city`, `bill_state`, `bill_postal_code`, `ship_addr1`, `ship_addr2`, `ship_addr3`, `ship_addr4`, `ship_city`, `ship_state`, `ship_postal_code`, `sales_rep`) VALUES
(41, '2010-03-02 21:20:01', 'user', '2018-03-02 21:53:54', NULL, 6, 2, 'Google, Inj.', 'Google', 'Mr. John Sheldon ', '', '2000-01-01', '2000-01-01', '2000-01-01', '2000-01-01', 'Charleston 2000Moutain View,  CA', 'Charleston 2000', '', 'sheldonj@google.com', '', 'John', 'Sheldon', '', 'Mr.', '', '', '', 'Charleston 2000', 'In Progress', '', 'Facebook:Construction', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');"
    ActiveRecord::Base.connection.execute(sql)
    QbwcError.destroy_all
    Customer.parse_customer_response(qb_hash)
  end
end
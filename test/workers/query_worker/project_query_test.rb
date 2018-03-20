require 'test_helper'
require 'workers/query_worker/fixtures/project_hash'

class ProjectQueryTest < ActiveSupport::TestCase
  include ProjectHash
  
  # after sending a test pass of "silly data", grab the project where the full name matches, and assert that all of the fields names were correctly updated
  test "Customer.parse_customer_response matches on list_id and updates the appropriate record" do
    # first assert we have one client in the database, that our sql method in "setup" worked
    assert_equal(1, Project.count)
    Project.parse_customer_response(qb_hash)
    assert_equal(1, Project.count)
    p = Project.first
    # assert that the ship to address is the fake value we assigned it, BEFORE we run the update, so then we can assert that it becomes nil afterward.
    # Reassign the value c and check the fields were all updated
    assert_equal("1234-1234", p.list_id)
    assert_equal("Client:Job:P-1234", p.full_name)
    assert_equal("1982-12-30", p.Project_DateStartActual.to_s)
    assert_equal("1982-12-30", p.Project_DateEndEstimated.to_s)
    assert_equal("1982-12-30", p.Project_DateEndActual.to_s)
    assert_equal("SA", p.Project_NameSalutation)
    assert_equal("FIRST", p.Project_NameFirst)
    assert_equal("M", p.Project_NameMiddle)
    assert_equal("LAST", p.Project_NameLast)
    assert_equal("999-999-9999", p.Project_PhoneMain)
    assert_equal("EMAIL@EMAIL.COM", p.Project_EmailMain)
    assert_equal("999-999-9999", p.Project_PhoneAlternate)
    assert_equal("EMAIL@EMAIL.COM", p.Project_EmailCC)
    assert_equal("999-999-9999", p.Project_PhoneCell)
    assert_equal("999-999-9999", p.Project_PhoneFax)
    assert_equal("ADDR1", p.bill_addr1)
    assert_equal("ADDR2", p.bill_addr2)
    assert_equal("ADDR3", p.bill_addr3)
    assert_equal("ADDR4", p.bill_addr4)
    assert_equal("CITY", p.bill_city)
    assert_equal("AA", p.bill_state)
    assert_equal("99999", p.bill_postal_code)
    assert_equal("ADDR1", p.Project_Address1)
    assert_equal("ADDR2", p.Project_Address2)
    assert_equal("ADDR3", p.ship_addr3)
    assert_nil(p.ship_addr4)
    assert_equal("CITY", p.Project_City)
    assert_equal("AA", p.Project_State)
    assert_equal("99999", p.Project_Zip)
    assert_equal(1, p.is_active)
    assert_equal("AAA", p.sales_rep)
  end
  
  test "Customer.parse_customer_response creates a new record when the list id is not found" do
    Project.destroy_all
    Customer.parse_customer_response(qb_hash)
    Customer.parse_customer_response(new_project_record)
    assert_equal(2, Project.count)
  end
  
  def setup
    Client.destroy_all
    Job.destroy_all
    Project.destroy_all
    QbwcError.destroy_all
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `Cust_CompanyAbr`, `list_id`) VALUES (1, 'Client')"
    ActiveRecord::Base.connection.execute(sql)
    sql = "INSERT INTO `Jobs` (`list_id`, `Jobs_PKEY`, `Job_QB_JobName`, `full_name`) VALUES ('800006BC-1257534763', 2, 'Construction', 'Client:Job');"
    ActiveRecord::Base.connection.execute(sql)
    sql = "INSERT INTO `Project` (`list_id`, `Project_PKEY`, `full_name`) VALUES ('800006BC-1257534768', 3333, 'Client:Job:P-3333');"
    ActiveRecord::Base.connection.execute(sql)
  end
  
end
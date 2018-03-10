require 'test_helper'
require 'workers/query_worker/fixtures/client_hash'

class ClientQueryTest < ActiveSupport::TestCase
  include ClientHash

  def setup
    Client.destroy_all
    QbwcError.destroy_all
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `Cust_CompanyAbr`, `list_id`) VALUES (238, 'Different Name', '80000FB1-1428953665');"
    ActiveRecord::Base.connection.execute(sql)
  end
  
  test "Customer.parse_customer_response matches on list_id and updates the appropriate record" do
    Customer.parse_customer_response(qb_hash)
    assert_equal(1, Client.count)
    c = Client.first
    assert_nil(c.CreationUser)
    assert_nil(c.CreationTimeStamp)
    assert_equal("QB", c.LastModificationUser)
    assert_equal("Slack", c.Cust_CompanyAbr) # The full name value should have changed to that in the hash passed in, not still be "Different Name"
    assert_equal("COMPANYNAME", c.Cust_Company)
    assert_equal("SA", c.Cust_NameSalutation)
    assert_equal("FIRST", c.Cust_NameFirst)
    assert_equal("M", c.Cust_NameMiddle)
    assert_equal("LAST", c.Cust_NameLast)
    assert_equal("999-999-9999", c.Cust_PhoneOffice)
    assert_equal("EMAIL@EMAIL.COM", c.Cust_EmailTo)
    assert_equal("999-999-9999", c.Cust_PhoneAlt)
    assert_equal("999-999-9999", c.Cust_PhoneCell)
    assert_equal("999-999-9999", c.Cust_PhoneFax)
    assert_equal("ADDR1", c.Cust_BillTo_Company)
    assert_equal("ADDR2", c.Cust_BillTo_Name)
    assert_equal("ADDR3", c.Cust_BillTo_Address1)
    assert_equal("ADDR4", c.Cust_BillTo_Address2)
    assert_equal("CITY", c.Cust_BillTo_City)
    assert_equal("AA", c.Cust_BillTo_State)
    assert_equal(99999, c.Cust_BillTo_Zip)
    assert_equal("ADDR1", c.Cust_ShipTo_Company)
    assert_equal("ADDR2", c.Cust_ShipTo_Name)
    assert_equal("ADDR3", c.Cust_ShipTo_Address1)
    assert_nil(c.Cust_ShipTo_Address2)
    assert_equal("CITY", c.Cust_ShipTo_City)
    assert_equal("AA", c.Cust_ShipTo_State)
    assert_equal(99999, c.Cust_ShipTo_Zip)
    assert_equal("X", c.Cust_InactiveFlag)
    assert_equal("CONTACT", c.site_contact)
    assert_equal("EMAIL@EMAIL.COM", c.site_email)
    assert_equal("999-999-9999", c.site_phone)
    assert_equal("AAA", c.sales_rep)
    assert_equal(0, QbwcError.count)
  end

  test "Customer.parse_customer_response creates a new record when the list id is not found" do
    Customer.parse_customer_response(qb_hash)
    Customer.parse_customer_response(no_matching_name)
    assert_equal(2, Client.count)
    assert_equal(no_matching_name['list_id'], Client.last.list_id)
    assert_equal(0, QbwcError.count) # make sure there are no errors
  end



end
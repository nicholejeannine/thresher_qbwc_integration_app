require 'test_helper'
require 'fixtures/client_hash'

class ClientQueryTest < ActiveSupport::TestCase
  include ClientHash


  # after sending a test pass of "silly data", grab the customer where the full name matches, and assert that all of the fields names were correctly updated
  test "when processing the query request, it updates the correct fields" do
    # first assert we have one client in the database, that our sql method in "setup" worked
    assert_equal(1, Client.count)
    c = Client.where("Cust_CompanyAbr" => "Slack").first
    # assert that the ship to address is the fake value we assigned it, BEFORE we run the update, so then we can assert that it becomes nil afterward.
    assert_equal("This is an address", c.Cust_ShipTo_Address2)
    Customer.parse_customer_response(qb_hash)
    # Reassign the value c and check the fields were all updated
    c = Client.where("Cust_CompanyAbr" => "Slack").first
    assert_equal("Slack", c.Cust_CompanyAbr)
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
  end
  
  test "sending a nonmatching client name writes another customer" do
    Customer.parse_customer_response(qb_hash)
    Customer.parse_customer_response(no_matching_name)
    assert_equal(2, Client.count)
  end
  
  def setup
    Client.destroy_all
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `CreationTimeStamp`, `CreationUser`, `LastModificationTimeStamp`, `LastModificationUser`, `Cust_BillTo_Address1`, `Cust_BillTo_Address2`, `Cust_BillTo_City`, `Cust_BillTo_Company`, `Cust_BillTo_Email`, `Cust_BillTo_Name`, `Cust_AP_Name`, `Cust_BillTo_Phone`, `Cust_BillTo_State`, `Cust_BillTo_Zip`, `Cust_Company`, `Cust_CompanyAbr`, `Cust_EmailCC`, `Cust_EmailTo`, `Cust_InactiveFlag`, `Cust_NameFirst`, `Cust_NameLast`, `Cust_NameMiddle`, `Cust_NameSalutation`, `Cust_PhoneAlt`, `Cust_PhoneCell`, `Cust_PhoneFax`, `Cust_PhoneOffice`, `sales_rep`, `Cust_ShipTo_Address1`, `Cust_ShipTo_Address2`, `Cust_ShipTo_City`, `Cust_ShipTo_Company`, `Cust_ShipTo_Name`, `Cust_ShipTo_State`, `Cust_ShipTo_Zip`, `site_contact`, `site_email`, `site_phone`)
VALUES
	(238, '2015-04-13 12:25:16', 'ikang', '2015-11-16 09:18:05', 'jsavage', '155 5th Street', '', 'San Francisco', 'Slack', NULL, '', '', '', 'CA', 0, 'Slack', 'Slack', '', 'dana@slack-corp.com', '', 'Dana', 'Campbell', '', 'Mr.', '', '', '', '650-452-8298', '', '155 5th Street', 'This is an address', 'San Francisco', 'Slack', 'Justin Wilson', 'CA', 0, '', '', '');"
    ActiveRecord::Base.connection.execute(sql)
    QbwcError.destroy_all
  end


  ## TODO:
  # Test that fields NOT specified to be modified by Web Connector are NOT be modified
  # Figure out mismatching names situation - now they should error log, later they will be new entries
  


end
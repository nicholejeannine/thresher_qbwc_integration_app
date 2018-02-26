require 'test_helper'
require 'fixtures/client_hash'

class ClientQueryTest < ActiveSupport::TestCase
  include ClientHash


  test "when processing the query request, it updates the correct fields" do
    assert_equal(1, Client.count)
    c = Client.where("Cust_CompanyAbr" => "Slack").first
    assert_equal("Slack", c.Cust_CompanyAbr)
    # assert_equals(customer.Cust_Company, "COMPANYNAME")
    # customer.Cust_NameSalutation = qb['salutation']
    # customer.Cust_NameFirst = qb['first_name']
    # customer.Cust_NameMiddle = qb['middle_name']
    # customer.Cust_NameLast = qb['last_name']
    # customer.Cust_PhoneOffice = qb['phone']
    # customer.Cust_EmailTo = qb['email']
    # customer.Cust_PhoneAlt = qb['alt_phone']
    # customer.Cust_EmailCC = qb['cc']
    # # customer.Cust_PhoneCell = qb['']
    # customer.Cust_PhoneFax = qb['fax']
    # customer.Cust_BillTo_Company = qb['bill_addr1']
    # customer.Cust_BillTo_Name = qb['bill_addr2']
    # customer.Cust_BillTo_Address1 = qb['bill_addr3']
    # customer.Cust_BillTo_Address2 = qb['bill_addr4']
    # customer.Cust_BillTo_City = qb['bill_city']
    # customer.Cust_BillTo_State = qb['bill_state']
    # customer.Cust_BillTo_Zip	 = qb['bill_postal_code']
    # customer.Cust_ShipTo_Company = qb['ship_addr1']
    # customer.Cust_ShipTo_Name = qb['ship_addr2']
    # customer.Cust_ShipTo_Address1 = qb['ship_addr3']
    # customer.Cust_ShipTo_Address2 = qb['ship_addr4']
    # customer.Cust_ShipTo_City = qb['ship_city']
    # customer.Cust_ShipTo_State = qb['ship_state']
    # customer.Cust_ShipTo_Zip = qb['ship_postal_code']
    
  end
  
  def setup
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `CreationTimeStamp`, `CreationUser`, `LastModificationTimeStamp`, `LastModificationUser`, `Cust_BillTo_Address1`, `Cust_BillTo_Address2`, `Cust_BillTo_City`, `Cust_BillTo_Company`, `Cust_BillTo_Email`, `Cust_BillTo_Name`, `Cust_AP_Name`, `Cust_BillTo_Phone`, `Cust_BillTo_State`, `Cust_BillTo_Zip`, `Cust_Company`, `Cust_CompanyAbr`, `Cust_EmailCC`, `Cust_EmailTo`, `Cust_InactiveFlag`, `Cust_NameFirst`, `Cust_NameLast`, `Cust_NameMiddle`, `Cust_NameSalutation`, `Cust_PhoneAlt`, `Cust_PhoneCell`, `Cust_PhoneFax`, `Cust_PhoneOffice`, `sales_rep`, `Cust_ShipTo_Address1`, `Cust_ShipTo_Address2`, `Cust_ShipTo_City`, `Cust_ShipTo_Company`, `Cust_ShipTo_Name`, `Cust_ShipTo_State`, `Cust_ShipTo_Zip`, `site_contact`, `site_email`, `site_phone`)
VALUES
	(238, '2015-04-13 12:25:16', 'ikang', '2015-11-16 09:18:05', 'jsavage', '155 5th Street', '', 'San Francisco', 'Slack', NULL, '', '', '', 'CA', 0, 'Slack', 'Slack', '', 'dana@slack-corp.com', '', 'Dana', 'Campbell', '', 'Mr.', '', '', '', '650-452-8298', NULL, '155 5th Street', '', 'San Francisco', 'Slack', 'Justin Wilson', 'CA', 0, NULL, NULL, NULL);"
    ActiveRecord::Base.connection.execute(sql)
    Customer.parse_customer_response(qb_hash)
  end


  


end
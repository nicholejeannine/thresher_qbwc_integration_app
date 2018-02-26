class Client < ApplicationRecord
  self.table_name = "Customers"
  self.primary_key = "Customers_PKEY"
  
  def self.save_to_portal qb
    customer = Client.where(:Cust_CompanyAbr => qb['full_name'])&.first
    if customer.nil?
      self.handle_error qb
    else
      customer.Cust_Company = qb['company_name']
      customer.Cust_NameSalutation = qb['salutation']
      customer.Cust_NameFirst = qb['first_name']
      customer.Cust_NameMiddle = qb['middle_name']
      customer.Cust_NameLast = qb['last_name']
      customer.Cust_PhoneOffice = qb['phone']
      customer.Cust_EmailTo = qb['email']
      customer.Cust_PhoneAlt = qb['alt_phone']
      customer.Cust_EmailCC = qb['cc']
      # customer.Cust_PhoneCell = qb['']
      customer.Cust_PhoneFax = qb['fax']
      customer.Cust_BillTo_Company = qb['bill_address']['bill_addr1']
      customer.Cust_BillTo_Name = qb['bill_address']['bill_addr2']
      customer.Cust_BillTo_Address1 = qb['bill_address']['bill_addr3']
      customer.Cust_BillTo_Address2 = qb['bill_address']['bill_addr4']
      customer.Cust_BillTo_City = qb['bill_address']['bill_city']
      customer.Cust_BillTo_State = qb['bill_address']['bill_state']
      customer.Cust_BillTo_Zip	 = qb['bill_address']['bill_postal_code']
      customer.Cust_ShipTo_Company = qb['ship_address']['ship_addr1']
      customer.Cust_ShipTo_Name = qb['ship_address']['ship_addr2']
      customer.Cust_ShipTo_Address1 = qb['ship_address']['ship_addr3']
      customer.Cust_ShipTo_Address2 = qb['ship_address']['ship_addr4']
      customer.Cust_ShipTo_City = qb['ship_address']['ship_city']
      customer.Cust_ShipTo_State = qb['ship_address']['ship_state']
      customer.Cust_ShipTo_Zip = qb['ship_address']['ship_postal_code']
      customer.save
    end
    #   if qb['is_active'] == 1
    #       customer.Cust_InactiveFlag = ""
    #   else
    #       customer.Cust_InactiveFlag = "X"
    #   end
    # end
    #   # customer.site_contact = qb['data_ext_ret']['data_ext_name']
    #   # customer.site_phone =  qb['data_ext_ret']['data_ext_name']
    #   # customer.site_email =  qb['data_ext_ret']['data_ext_name']
    #   customer.sales_rep = qb['sales_rep_ref']['full_name']
    #
    #   customer
    end
    
    # If customer if found, save the qb fields to their corresponding Thresher fields.
    
    # IF CUSTOMER IS NOT FOUND, handle it. (This part of the code will change - we may write the customer to an error table, but later when people can NO LONGER enter new clients into the portal, we need to quickly switch to a method that permits new records to be saved to the table. We can simply swap out the "error handler" here.)
    #
  
  def self.handle_error qb
    
  end
    
end

class Client < ApplicationRecord
  
  # FIELD_MAP = {
  #   :Cust_Company => 'company_name',
  #   :Cust_NameSalutation => 'salutation'
  # }
  self.table_name = "Customers"
  self.primary_key = "Customers_PKEY"
  
  # TODO: HAVE TO HANDLE NULL INDEXES (e.g., places where is no "bill address")
  def self.save_to_portal qb
    customer = Client.where(:Cust_CompanyAbr => qb['full_name'])&.first

    # If customer if found, save the qb fields to their corresponding Thresher fields.
    # IF CUSTOMER IS NOT FOUND, handle it. (This part of the code will change - we may write the customer to an error table, but later when people can NO LONGER enter new clients into the portal, we need to quickly switch to a method that permits new records to be saved to the table. We can simply swap out the "error handler" here.)
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
      if qb.has_key?("additional_contact_ref")
        ref = qb["additional_contact_ref"]
        if ref.pluck("contact_name").include?("Mobile")
          customer.Cust_PhoneCell =  ref.find_all { |e| e['contact_name'] == 'Mobile'}.pluck("contact_value")[0]
        end
      end
      customer.Cust_PhoneFax = qb['fax']
      if qb.has_key?("bill_address")
        customer.Cust_BillTo_Company = qb["bill_address"]["addr1"]
        customer.Cust_BillTo_Name = qb['bill_address']['addr2']
        customer.Cust_BillTo_Address1 = qb['bill_address']['addr3']
        customer.Cust_BillTo_Address2 = qb['bill_address']['addr4']
        customer.Cust_BillTo_City = qb['bill_address']['city']
        customer.Cust_BillTo_State = qb['bill_address']['state']
        customer.Cust_BillTo_Zip	 = qb['bill_address']['postal_code']
      end
      if qb.has_key?("ship_address")
        customer.Cust_ShipTo_Company = qb['ship_address']['addr1']
        customer.Cust_ShipTo_Name = qb['ship_address']['addr2']
        customer.Cust_ShipTo_Address1 = qb['ship_address']['addr3']
        customer.Cust_ShipTo_Address2 = qb['ship_address']['addr4']
        customer.Cust_ShipTo_City = qb['ship_address']['city']
        customer.Cust_ShipTo_State = qb['ship_address']['state']
        customer.Cust_ShipTo_Zip = qb['ship_address']['postal_code']
        customer.sales_rep = qb['sales_rep_ref']['full_name']
      end
      if qb['is_active'] == 1
          customer.Cust_InactiveFlag = ""
      else
          customer.Cust_InactiveFlag = "X"
      end
      unless qb.has_key?("data_ext_ret")
        customer.site_contact = ""
        customer.site_email = ""
        customer.site_phone = ""
      end
      if qb.has_key?("data_ext_ret")
        data = qb['data_ext_ret']
        if data.pluck("data_ext_name").include?("Site Contact")
          customer.site_contact = data.find_all { |x| x['data_ext_name'] == 'Site Contact'}.pluck("data_ext_value")[0]
        else
          customer.site_contact = ""
        end
        if data.pluck("data_ext_name").include?("Site Email")
          customer.site_email = data.find_all { |x| x['data_ext_name'] == 'Site Email'}.pluck("data_ext_value")[0]
        else
          customer.site_email = ""
        end
        if data.pluck("data_ext_name").include?("Site Phone")
          customer.site_phone = data.find_all { |x| x['data_ext_name'] == 'Site Phone'}.pluck("data_ext_value")[0]
        else
          customer.site_phone = ""
        end
      end
      customer.save
    end
    # end
    #   #  = qb['data_ext_ret']['data_ext_name']
    #   # customer. =  qb['data_ext_ret']['data_ext_name']
    #   # customer.site_email =  qb['data_ext_ret']['data_ext_name']
    #
    #   customer
    end
    
   
  
  def self.handle_error qb
    QbwcError.create(:worker_class => "Thresher.Customers - name not found", :error_message => "#{qb['full_name']}")
  end
  
  
    
end

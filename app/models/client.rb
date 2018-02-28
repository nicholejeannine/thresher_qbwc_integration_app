class Client < ApplicationRecord
  
  BILL_ADDRESS_CAST = Proc.new {|field|Hash.new("bill_address").pluck(field)}
  
  FIELDS = %w(Cust_Company Cust_NameSalutation Cust_NameFirst Cust_NameMiddle Cust_NameLast Cust_PhoneOffice Cust_EmailTo Cust_PhoneAlt Cust_EmailCC Cust_PhoneCell Cust_PhoneFax Cust_BillTo_Company Cust_BillTo_Name Cust_BillTo_Address1 Cust_BillTo_Address2 Cust_BillTo_City Cust_BillTo_State Cust_BillTo_Zip Cust_ShipTo_Company Cust_ShipTo_Name Cust_ShipTo_Address1 Cust_ShipTo_Address2 Cust_ShipTo_City Cust_ShipTo_State Cust_ShipTo_Zip Cust_InactiveFlag site_contact site_email site_phone sales_rep)
  
  FIELD_MAP = {
      :Cust_Company => 'company_name',
      :Cust_NameSalutation => 'salutation',
      :Cust_NameFirst => 'first_name',
      :Cust_NameMiddle => 'middle_name',
      :Cust_NameLast => 'last_name',
      :Cust_PhoneOffice => 'phone',
      :Cust_EmailTo => 'email',
      :Cust_PhoneAlt => 'alt_phone',
      :Cust_EmailCC => 'cc',
      :Cust_PhoneFax => 'fax',
      :Cust_BillTo_Company => {"bill_address" => "addr1"},
      :Cust_BillTo_Name => {"bill_address" => "addr2"},
      :Cust_BillTo_Address1 => {"bill_address" => "addr3"},
      :Cust_BillTo_Address2 => {"bill_address" => "addr4"},
      :Cust_BillTo_City => {"bill_address" => "city"},
      :Cust_BillTo_State => {"bill_address" => "state"},
      :Cust_BillTo_Zip => {"bill_address" => "postal_code"},
      :Cust_ShipTo_Company => {"ship_address" => "addr1"},
      :Cust_ShipTo_Name => {"ship_address" => "addr2"},
      :Cust_ShipTo_Address1 => {"ship_address" => "addr3"},
      :Cust_ShipTo_Address2 => {"ship_address" => "addr4"},
      :Cust_ShipTo_City => {"ship_address" => "city"},
      :Cust_ShipTo_State => {"ship_address" => "state"},
      :Cust_ShipTo_Zip => {"ship_address" => "postal_code"},
      # :sales_rep => {:sales_rep_ref => "full_name"}
  }
  
  self.table_name = "Customers"
  self.primary_key = "Customers_PKEY"
  
  def self.save_to_portal qb
    begin
      customer = Client.where(:Cust_CompanyAbr => qb['full_name'])&.first
      # If customer if found, save the qb fields to their corresponding Thresher fields.
      # IF CUSTOMER IS NOT FOUND, handle it. (This part of the code will change - we may write the customer to an error table, but later when people can NO LONGER enter new clients into the portal, we need to quickly switch to a method that permits new records to be saved to the table. We can simply swap out the "error handler" here.)
      if customer.nil?
        self.handle_error qb
        # customer = Client.new
        # customer.Cust_CompanyAbr = qb['full_name']
      else # SET ALL FIELDS TO DEFAULT VALUES
        Client::FIELDS.each {|x| customer[x] = ""}
        Client::FIELD_MAP.each do |k, v|
          if v.is_a?(Hash)
            v.each do |key, value|
              if qb.has_key?(key)
                customer[k] = qb[key][value]
              end
            end
          elsif v.is_a?(String)
            customer[k] = qb[v]
          end
        end
        # customer.Cust_Company = qb['company_name']
        # customer.Cust_NameSalutation = qb['salutation']
        # customer.Cust_NameFirst = qb['first_name']
        # customer.Cust_NameMiddle = qb['middle_name']
        # customer.Cust_NameLast = qb['last_name']
        # customer.Cust_PhoneOffice = qb['phone']
        # customer.Cust_EmailTo = qb['email']
        # customer.Cust_PhoneAlt = qb['alt_phone']
        # customer.Cust_EmailCC = qb['cc']
        if qb.has_key?("additional_contact_ref")
          ref = qb["additional_contact_ref"]
          if ref.pluck("contact_name").include?("Mobile")
            customer.Cust_PhoneCell = ref.find_all {|e| e['contact_name'] == 'Mobile'}.pluck("contact_value")[0]
          end
        end
        if qb.has_key?("sales_rep_ref")
          customer.sales_rep = qb['sales_rep_ref']['full_name']
        end
        customer.Cust_InactiveFlag = "X" if qb['is_active'] == false
        if qb.has_key?("data_ext_ret")
          data = qb['data_ext_ret']
          if data.pluck("data_ext_name").include?("Site Contact")
            customer.site_contact = data.find_all {|x| x['data_ext_name'] == 'Site Contact'}.pluck("data_ext_value")[0]
          end
          if data.pluck("data_ext_name").include?("Site Email")
            customer.site_email = data.find_all {|x| x['data_ext_name'] == 'Site Email'}.pluck("data_ext_value")[0]
          end
          if data.pluck("data_ext_name").include?("Site Phone")
            customer.site_phone = data.find_all {|x| x['data_ext_name'] == 'Site Phone'}.pluck("data_ext_value")[0]
          end
        end
        customer.save
      end
    rescue StandardError => e
      QbwcError.create(:worker_class => "Client.save_to_portal", :model_id => "#{qb['full_name']}", :error_message => "#{qb}")
    end
  end
  
  
  def self.handle_error qb
    QbwcError.create(:worker_class => "Thresher.Customers - name not found", :model_id => "#{qb['full_name']}", :error_message => "Client not found")
  end


end

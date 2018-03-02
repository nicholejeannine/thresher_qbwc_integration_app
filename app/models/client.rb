class Client < ApplicationRecord
  
  BILL_ADDRESS_CAST = Proc.new {|field|Hash.new("bill_address").pluck(field)}
  
  FIELDS = %w(Cust_Company Cust_NameSalutation Cust_NameFirst Cust_NameMiddle Cust_NameLast Cust_PhoneOffice Cust_EmailTo Cust_PhoneAlt Cust_EmailCC Cust_PhoneCell Cust_PhoneFax Cust_BillTo_Company Cust_BillTo_Name Cust_BillTo_Address1 Cust_BillTo_Address2 Cust_BillTo_City Cust_BillTo_State Cust_BillTo_Zip Cust_ShipTo_Company Cust_ShipTo_Name Cust_ShipTo_Address1 Cust_ShipTo_Address2 Cust_ShipTo_City Cust_ShipTo_State Cust_ShipTo_Zip Cust_InactiveFlag site_contact site_email site_phone sales_rep)
  
  FIELD_MAP = {
      :list_id => "list_id",
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
      :sales_rep => {"sales_rep_ref" => "full_name"}
  }
  
  self.table_name = "Customers"
  self.primary_key = "Customers_PKEY"
  
  def self.save_to_portal qb
    begin
      # Look for customer by list id first. If not found, search by full name. If not found, create a new one.
      customer = Client.find_by("list_id" => qb['list_id'])
      if customer.nil?
        customer = Client.find_or_create_by(:Cust_CompanyAbr => qb['full_name'])
      end
      # If customer if found, save the qb fields to their corresponding Thresher fields.
      Client::FIELDS.each {|x| customer[x] = ""}
      Client::FIELD_MAP.each do |k, v|
        if v.is_a?(Hash)
          v.each do |key, value|
            if qb.has_key?(key)
              if value.is_a?(String)
                customer[k] = qb[key][value]
                # elsif value.is_a(Array)
                #  ref = qb[key]
              end
            end
          end
        elsif v.is_a?(String)
          customer[k] = qb[v]
        end
      end
      if qb.has_key?("additional_contact_ref")
        ref = qb["additional_contact_ref"]
        if ref.pluck("contact_name").include?("Mobile")
          customer.Cust_PhoneCell = ref.find_all {|e| e['contact_name'] == 'Mobile'}.pluck("contact_value")[0]
        end
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
  rescue StandardError => e
    QbwcError.create(:worker_class => "Client.save_to_portal", :model_id => "#{qb['full_name']}", :error_message => "#{e}")
  end
  end
  
  
end
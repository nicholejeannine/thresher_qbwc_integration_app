class Client < Customer
  
  self.table_name = "Customers"
  self.primary_key = "Customers_PKEY"
  alias_attribute :full_name, :Cust_CompanyAbr
  
  FIELD_MAP = {
      :list_id => "list_id",
      :Cust_CompanyAbr => 'full_name',
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
      :sales_rep => {"sales_rep_ref" => "full_name"},
      :site_contact => {"data_ext_ret" => SITE_CONTACT_CAST},
      :site_phone => {"data_ext_ret" => SITE_PHONE_CAST},
      :site_email => {"data_ext_ret" => SITE_EMAIL_CAST},
      :Cust_PhoneCell => {"additional_contact_ref" => MOBILE_CAST},
      :Cust_InactiveFlag => {"is_active" => INACTIVE_FLAG_CAST},
      :total_balance => "total_balance"
  }
  
  
end
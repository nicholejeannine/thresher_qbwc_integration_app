require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :edit_sequence => "Edit Sequence",
        :name => "Name",
        :full_name => "Full Name",
        :is_active => "Is Active",
        :parent_id => "Parent",
        :sublevel => 2,
        :company_name => "Company Name",
        :salutation => "Salutation",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :job_title => "Job Title",
        :bill_address_addr1 => "Bill Address Addr1",
        :bill_address_addr2 => "Bill Address Addr2",
        :bill_address_addr3 => "Bill Address Addr3",
        :bill_address_addr4 => "Bill Address Addr4",
        :bill_address_addr5 => "Bill Address Addr5",
        :bill_address_city => "Bill Address City",
        :bill_address_state => "Bill Address State",
        :bill_address_postal_code => "Bill Address Postal Code",
        :bill_address_country => "Bill Address Country",
        :bill_address_note => "Bill Address Note",
        :bill_address_block_addr1 => "Bill Address Block Addr1",
        :bill_address_block_addr2 => "Bill Address Block Addr2",
        :bill_address_block_addr3 => "Bill Address Block Addr3",
        :bill_address_block_addr4 => "Bill Address Block Addr4",
        :bill_address_block_addr5 => "Bill Address Block Addr5",
        :ship_address_addr1 => "Ship Address Addr1",
        :ship_address_addr2 => "Ship Address Addr2",
        :ship_address_addr3 => "Ship Address Addr3",
        :ship_address_addr4 => "Ship Address Addr4",
        :ship_address_addr5 => "Ship Address Addr5",
        :ship_address_city => "Ship Address City",
        :ship_address_state => "Ship Address State",
        :ship_address_postal_code => "Ship Address Postal Code",
        :ship_address_country => "Ship Address Country",
        :ship_address_note => "Ship Address Note",
        :ship_address_block_addr1 => "Ship Address Block Addr1",
        :ship_address_block_addr2 => "Ship Address Block Addr2",
        :ship_address_block_addr3 => "Ship Address Block Addr3",
        :ship_address_block_addr4 => "Ship Address Block Addr4",
        :ship_address_block_addr5 => "Ship Address Block Addr5",
        :phone => "Phone",
        :alt_phone => "Alt Phone",
        :fax => "Fax",
        :email => "Email",
        :cc => "Cc",
        :contact => "Contact",
        :alt_contact => "Alt Contact",
        :customer_type_id => "Customer Type",
        :customer_type_full_name => "Customer Type Full Name",
        :terms_id => "Terms",
        :terms_full_name => "Terms Full Name",
        :sales_rep_id => "Sales Rep",
        :sales_rep_full_name => "Sales Rep Full Name",
        :balance => "9.99",
        :total_balance => "9.99",
        :sales_tax_code_id => "Sales Tax Code",
        :sales_tax_code_full_name => "Sales Tax Code Full Name",
        :item_sales_tax_id => "Item Sales Tax",
        :item_sales_tax_full_name => "Item Sales Tax Full Name",
        :resale_number => "Resale Number",
        :account_number => "Account Number",
        :preferred_payment_method_id => "Preferred Payment Method",
        :preferred_payment_method_full_name => "Preferred Payment Method Full Name",
        :job_status => "Job Status",
        :job_desc => "Job Desc",
        :job_type_id => "Job Type",
        :job_type_full_name => "Job Type Full Name",
        :preferred_delivery_method => "Preferred Delivery Method",
        :price_level_id => "Price Level",
        :price_level_full_name => "Price Level Full Name",
        :primary_contact => "Primary Contact",
        :primary_email => "Primary Email",
        :primary_phone => "Primary Phone",
        :Project_PKEY => 3,
        :CreationUser => "MyText",
        :LastModificationUser => "MyText",
        :FK_Customers_PKEY => 4,
        :FK_Jobs_PKEY => 5,
        :FK_ProgMan_Employees_PKEY => 6,
        :FK_ProjMan_Employees_PKEY => 7,
        :FK_TechLead_Employees_PKEY => 8,
        :FK_Foreman_Employees_PKEY => 9,
        :FK_TechForeman_Employees_PKEY => 10,
        :Project_Name => "MyText",
        :Project_Type => "MyText",
        :Project_ScopeText => "MyText",
        :Project_NameSalutation => "MyText",
        :Project_NameFirst => "MyText",
        :Project_NameMiddle => "MyText",
        :Project_NameLast => "MyText",
        :Project_PhoneMain => "MyText",
        :Project_EmailMain => "MyText",
        :Project_PhoneAlternate => "MyText",
        :Project_EmailCC => "MyText",
        :Project_PhoneCell => "MyText",
        :Project_PhoneFax => "MyText",
        :Project_Address1 => "MyText",
        :Project_Address2 => "MyText",
        :Project_Address_Parking1 => "MyText",
        :Project_Address_Parking2 => "MyText",
        :Project_City => "MyText",
        :Project_State => "MyText",
        :Project_Zip => "MyText",
        :Project_Park_1_Address => "MyText",
        :Project_Park_1_Address_City => "MyText",
        :Project_Park_1_Address_State => "MyText",
        :Project_Park_1_Address_Zip => 11,
        :Project_Park_2_Address => "MyText",
        :Project_Park_2_Address_City => "MyText",
        :Project_Park_2_Address_State => "MyText",
        :Project_Park_2_Address_Zip => 12,
        :Project_PercentComplete => 13,
        :Project_IsClosed => "MyText",
        :Project_Status => 14,
        :Project_QuotedTechLabor => 15,
        :Project_QuotedRILabor => 16,
        :Project_QuotedDILabor => 17,
        :Project_QuotedCOLabor => 18,
        :Project_QuotedEngLabor => 19,
        :Project_QuotedPMLabor => 20,
        :Project_UseCase => "MyText",
        :Project_QuotedLgstLabor => 21
      ),
      Project.create!(
        :edit_sequence => "Edit Sequence",
        :name => "Name",
        :full_name => "Full Name",
        :is_active => "Is Active",
        :parent_id => "Parent",
        :sublevel => 2,
        :company_name => "Company Name",
        :salutation => "Salutation",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :job_title => "Job Title",
        :bill_address_addr1 => "Bill Address Addr1",
        :bill_address_addr2 => "Bill Address Addr2",
        :bill_address_addr3 => "Bill Address Addr3",
        :bill_address_addr4 => "Bill Address Addr4",
        :bill_address_addr5 => "Bill Address Addr5",
        :bill_address_city => "Bill Address City",
        :bill_address_state => "Bill Address State",
        :bill_address_postal_code => "Bill Address Postal Code",
        :bill_address_country => "Bill Address Country",
        :bill_address_note => "Bill Address Note",
        :bill_address_block_addr1 => "Bill Address Block Addr1",
        :bill_address_block_addr2 => "Bill Address Block Addr2",
        :bill_address_block_addr3 => "Bill Address Block Addr3",
        :bill_address_block_addr4 => "Bill Address Block Addr4",
        :bill_address_block_addr5 => "Bill Address Block Addr5",
        :ship_address_addr1 => "Ship Address Addr1",
        :ship_address_addr2 => "Ship Address Addr2",
        :ship_address_addr3 => "Ship Address Addr3",
        :ship_address_addr4 => "Ship Address Addr4",
        :ship_address_addr5 => "Ship Address Addr5",
        :ship_address_city => "Ship Address City",
        :ship_address_state => "Ship Address State",
        :ship_address_postal_code => "Ship Address Postal Code",
        :ship_address_country => "Ship Address Country",
        :ship_address_note => "Ship Address Note",
        :ship_address_block_addr1 => "Ship Address Block Addr1",
        :ship_address_block_addr2 => "Ship Address Block Addr2",
        :ship_address_block_addr3 => "Ship Address Block Addr3",
        :ship_address_block_addr4 => "Ship Address Block Addr4",
        :ship_address_block_addr5 => "Ship Address Block Addr5",
        :phone => "Phone",
        :alt_phone => "Alt Phone",
        :fax => "Fax",
        :email => "Email",
        :cc => "Cc",
        :contact => "Contact",
        :alt_contact => "Alt Contact",
        :customer_type_id => "Customer Type",
        :customer_type_full_name => "Customer Type Full Name",
        :terms_id => "Terms",
        :terms_full_name => "Terms Full Name",
        :sales_rep_id => "Sales Rep",
        :sales_rep_full_name => "Sales Rep Full Name",
        :balance => "9.99",
        :total_balance => "9.99",
        :sales_tax_code_id => "Sales Tax Code",
        :sales_tax_code_full_name => "Sales Tax Code Full Name",
        :item_sales_tax_id => "Item Sales Tax",
        :item_sales_tax_full_name => "Item Sales Tax Full Name",
        :resale_number => "Resale Number",
        :account_number => "Account Number",
        :preferred_payment_method_id => "Preferred Payment Method",
        :preferred_payment_method_full_name => "Preferred Payment Method Full Name",
        :job_status => "Job Status",
        :job_desc => "Job Desc",
        :job_type_id => "Job Type",
        :job_type_full_name => "Job Type Full Name",
        :preferred_delivery_method => "Preferred Delivery Method",
        :price_level_id => "Price Level",
        :price_level_full_name => "Price Level Full Name",
        :primary_contact => "Primary Contact",
        :primary_email => "Primary Email",
        :primary_phone => "Primary Phone",
        :Project_PKEY => 3,
        :CreationUser => "MyText",
        :LastModificationUser => "MyText",
        :FK_Customers_PKEY => 4,
        :FK_Jobs_PKEY => 5,
        :FK_ProgMan_Employees_PKEY => 6,
        :FK_ProjMan_Employees_PKEY => 7,
        :FK_TechLead_Employees_PKEY => 8,
        :FK_Foreman_Employees_PKEY => 9,
        :FK_TechForeman_Employees_PKEY => 10,
        :Project_Name => "MyText",
        :Project_Type => "MyText",
        :Project_ScopeText => "MyText",
        :Project_NameSalutation => "MyText",
        :Project_NameFirst => "MyText",
        :Project_NameMiddle => "MyText",
        :Project_NameLast => "MyText",
        :Project_PhoneMain => "MyText",
        :Project_EmailMain => "MyText",
        :Project_PhoneAlternate => "MyText",
        :Project_EmailCC => "MyText",
        :Project_PhoneCell => "MyText",
        :Project_PhoneFax => "MyText",
        :Project_Address1 => "MyText",
        :Project_Address2 => "MyText",
        :Project_Address_Parking1 => "MyText",
        :Project_Address_Parking2 => "MyText",
        :Project_City => "MyText",
        :Project_State => "MyText",
        :Project_Zip => "MyText",
        :Project_Park_1_Address => "MyText",
        :Project_Park_1_Address_City => "MyText",
        :Project_Park_1_Address_State => "MyText",
        :Project_Park_1_Address_Zip => 11,
        :Project_Park_2_Address => "MyText",
        :Project_Park_2_Address_City => "MyText",
        :Project_Park_2_Address_State => "MyText",
        :Project_Park_2_Address_Zip => 12,
        :Project_PercentComplete => 13,
        :Project_IsClosed => "MyText",
        :Project_Status => 14,
        :Project_QuotedTechLabor => 15,
        :Project_QuotedRILabor => 16,
        :Project_QuotedDILabor => 17,
        :Project_QuotedCOLabor => 18,
        :Project_QuotedEngLabor => 19,
        :Project_QuotedPMLabor => 20,
        :Project_UseCase => "MyText",
        :Project_QuotedLgstLabor => 21
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Edit Sequence".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Is Active".to_s, :count => 2
    assert_select "tr>td", :text => "Parent".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Salutation".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Addr1".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Addr2".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Addr3".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Addr4".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Addr5".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address City".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address State".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Country".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Note".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Block Addr1".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Block Addr2".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Block Addr3".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Block Addr4".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address Block Addr5".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Addr1".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Addr2".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Addr3".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Addr4".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Addr5".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address City".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address State".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Country".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Note".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Block Addr1".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Block Addr2".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Block Addr3".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Block Addr4".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address Block Addr5".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Alt Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Cc".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Alt Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Type".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Type Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Terms".to_s, :count => 2
    assert_select "tr>td", :text => "Terms Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Rep".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Rep Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Tax Code".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Tax Code Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Item Sales Tax".to_s, :count => 2
    assert_select "tr>td", :text => "Item Sales Tax Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Resale Number".to_s, :count => 2
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Payment Method".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Payment Method Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Job Status".to_s, :count => 2
    assert_select "tr>td", :text => "Job Desc".to_s, :count => 2
    assert_select "tr>td", :text => "Job Type".to_s, :count => 2
    assert_select "tr>td", :text => "Job Type Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Delivery Method".to_s, :count => 2
    assert_select "tr>td", :text => "Price Level".to_s, :count => 2
    assert_select "tr>td", :text => "Price Level Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Primary Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Primary Email".to_s, :count => 2
    assert_select "tr>td", :text => "Primary Phone".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => 16.to_s, :count => 2
    assert_select "tr>td", :text => 17.to_s, :count => 2
    assert_select "tr>td", :text => 18.to_s, :count => 2
    assert_select "tr>td", :text => 19.to_s, :count => 2
    assert_select "tr>td", :text => 20.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 21.to_s, :count => 2
  end
end

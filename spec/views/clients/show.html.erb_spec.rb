require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :id => "Id",
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
      :Customers_PKEY => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id/)
    expect(rendered).to match(/Edit Sequence/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Is Active/)
    expect(rendered).to match(/Parent/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Salutation/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Job Title/)
    expect(rendered).to match(/Bill Address Addr1/)
    expect(rendered).to match(/Bill Address Addr2/)
    expect(rendered).to match(/Bill Address Addr3/)
    expect(rendered).to match(/Bill Address Addr4/)
    expect(rendered).to match(/Bill Address Addr5/)
    expect(rendered).to match(/Bill Address City/)
    expect(rendered).to match(/Bill Address State/)
    expect(rendered).to match(/Bill Address Postal Code/)
    expect(rendered).to match(/Bill Address Country/)
    expect(rendered).to match(/Bill Address Note/)
    expect(rendered).to match(/Bill Address Block Addr1/)
    expect(rendered).to match(/Bill Address Block Addr2/)
    expect(rendered).to match(/Bill Address Block Addr3/)
    expect(rendered).to match(/Bill Address Block Addr4/)
    expect(rendered).to match(/Bill Address Block Addr5/)
    expect(rendered).to match(/Ship Address Addr1/)
    expect(rendered).to match(/Ship Address Addr2/)
    expect(rendered).to match(/Ship Address Addr3/)
    expect(rendered).to match(/Ship Address Addr4/)
    expect(rendered).to match(/Ship Address Addr5/)
    expect(rendered).to match(/Ship Address City/)
    expect(rendered).to match(/Ship Address State/)
    expect(rendered).to match(/Ship Address Postal Code/)
    expect(rendered).to match(/Ship Address Country/)
    expect(rendered).to match(/Ship Address Note/)
    expect(rendered).to match(/Ship Address Block Addr1/)
    expect(rendered).to match(/Ship Address Block Addr2/)
    expect(rendered).to match(/Ship Address Block Addr3/)
    expect(rendered).to match(/Ship Address Block Addr4/)
    expect(rendered).to match(/Ship Address Block Addr5/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Alt Phone/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Cc/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Alt Contact/)
    expect(rendered).to match(/Customer Type/)
    expect(rendered).to match(/Customer Type Full Name/)
    expect(rendered).to match(/Terms/)
    expect(rendered).to match(/Terms Full Name/)
    expect(rendered).to match(/Sales Rep/)
    expect(rendered).to match(/Sales Rep Full Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Sales Tax Code/)
    expect(rendered).to match(/Sales Tax Code Full Name/)
    expect(rendered).to match(/Item Sales Tax/)
    expect(rendered).to match(/Item Sales Tax Full Name/)
    expect(rendered).to match(/Resale Number/)
    expect(rendered).to match(/Account Number/)
    expect(rendered).to match(/Preferred Payment Method/)
    expect(rendered).to match(/Preferred Payment Method Full Name/)
    expect(rendered).to match(/Job Status/)
    expect(rendered).to match(/Job Desc/)
    expect(rendered).to match(/Job Type/)
    expect(rendered).to match(/Job Type Full Name/)
    expect(rendered).to match(/Preferred Delivery Method/)
    expect(rendered).to match(/Price Level/)
    expect(rendered).to match(/Price Level Full Name/)
    expect(rendered).to match(/Primary Contact/)
    expect(rendered).to match(/Primary Email/)
    expect(rendered).to match(/Primary Phone/)
    expect(rendered).to match(/3/)
  end
end

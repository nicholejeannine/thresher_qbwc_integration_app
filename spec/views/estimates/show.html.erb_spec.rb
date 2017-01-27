require 'rails_helper'

RSpec.describe "estimates/show", type: :view do
  before(:each) do
    @estimate = assign(:estimate, Estimate.create!(
      :id => "Id",
      :edit_sequence => "Edit Sequence",
      :txn_number => 2,
      :customer_id => "Customer",
      :customer_full_name => "Customer Full Name",
      :template_id => "Template",
      :template_full_name => "Template Full Name",
      :ref_number => "Ref Number",
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
      :is_active => "Is Active",
      :po_number => "Po Number",
      :terms_id => "Terms",
      :terms_full_name => "Terms Full Name",
      :sales_rep_id => "Sales Rep",
      :sales_rep_full_name => "Sales Rep Full Name",
      :fob => "Fob",
      :subtotal => "9.99",
      :item_sales_tax_id => "Item Sales Tax",
      :item_sales_tax_full_name => "Item Sales Tax Full Name",
      :sales_tax_percentage => 3.5,
      :sales_tax_total => "9.99",
      :total_amount => "9.99",
      :memo => "MyText",
      :customer_msg_id => "Customer Msg",
      :customer_msg_full_name => "Customer Msg Full Name",
      :is_to_be_emailed => "Is To Be Emailed",
      :customer_sales_tax_code_id => "Customer Sales Tax Code",
      :customer_sales_tax_code_full_name => "Customer Sales Tax Code Full Name",
      :linked_txn_id => "Linked Txn",
      :linked_txn_type => "Linked Txn Type",
      :linked_txn_ref_number => "Linked Txn Ref Number",
      :linked_txn_link_type => "Linked Txn Link Type",
      :linked_txn_amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id/)
    expect(rendered).to match(/Edit Sequence/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Customer/)
    expect(rendered).to match(/Customer Full Name/)
    expect(rendered).to match(/Template/)
    expect(rendered).to match(/Template Full Name/)
    expect(rendered).to match(/Ref Number/)
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
    expect(rendered).to match(/Is Active/)
    expect(rendered).to match(/Po Number/)
    expect(rendered).to match(/Terms/)
    expect(rendered).to match(/Terms Full Name/)
    expect(rendered).to match(/Sales Rep/)
    expect(rendered).to match(/Sales Rep Full Name/)
    expect(rendered).to match(/Fob/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Item Sales Tax/)
    expect(rendered).to match(/Item Sales Tax Full Name/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Customer Msg/)
    expect(rendered).to match(/Customer Msg Full Name/)
    expect(rendered).to match(/Is To Be Emailed/)
    expect(rendered).to match(/Customer Sales Tax Code/)
    expect(rendered).to match(/Customer Sales Tax Code Full Name/)
    expect(rendered).to match(/Linked Txn/)
    expect(rendered).to match(/Linked Txn Type/)
    expect(rendered).to match(/Linked Txn Ref Number/)
    expect(rendered).to match(/Linked Txn Link Type/)
    expect(rendered).to match(/9.99/)
  end
end

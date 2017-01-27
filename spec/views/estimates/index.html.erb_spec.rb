require 'rails_helper'

RSpec.describe "estimates/index", type: :view do
  before(:each) do
    assign(:estimates, [
      Estimate.create!(
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
      ),
      Estimate.create!(
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
      )
    ])
  end

  it "renders a list of estimates" do
    render
    assert_select "tr>td", :text => "Id".to_s, :count => 2
    assert_select "tr>td", :text => "Edit Sequence".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Template".to_s, :count => 2
    assert_select "tr>td", :text => "Template Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ref Number".to_s, :count => 2
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
    assert_select "tr>td", :text => "Is Active".to_s, :count => 2
    assert_select "tr>td", :text => "Po Number".to_s, :count => 2
    assert_select "tr>td", :text => "Terms".to_s, :count => 2
    assert_select "tr>td", :text => "Terms Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Rep".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Rep Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Fob".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Item Sales Tax".to_s, :count => 2
    assert_select "tr>td", :text => "Item Sales Tax Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Msg".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Msg Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Is To Be Emailed".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Sales Tax Code".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Sales Tax Code Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn Type".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn Ref Number".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn Link Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

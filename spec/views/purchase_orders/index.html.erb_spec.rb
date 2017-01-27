require 'rails_helper'

RSpec.describe "purchase_orders/index", type: :view do
  before(:each) do
    assign(:purchase_orders, [
      PurchaseOrder.create!(
        :id => "Id",
        :edit_sequence => "Edit Sequence",
        :txn_number => 2,
        :vendor_id => "Vendor",
        :vendor_full_name => "Vendor Full Name",
        :inventory_site_id => "Inventory Site",
        :inventory_site_full_name => "Inventory Site Full Name",
        :ship_to_entity_id => "Ship To Entity",
        :ship_to_entity_full_name => "Ship To Entity Full Name",
        :template_id => "Template",
        :template_full_name => "Template Full Name",
        :ref_number => "Ref Number",
        :vendor_address_addr1 => "Vendor Address Addr1",
        :vendor_address_addr2 => "Vendor Address Addr2",
        :vendor_address_addr3 => "Vendor Address Addr3",
        :vendor_address_addr4 => "Vendor Address Addr4",
        :vendor_address_addr5 => "Vendor Address Addr5",
        :vendor_address_city => "Vendor Address City",
        :vendor_address_state => "Vendor Address State",
        :vendor_address_postal_code => "Vendor Address Postal Code",
        :vendor_address_country => "Vendor Address Country",
        :vendor_address_note => "Vendor Address Note",
        :vendor_address_block_addr1 => "Vendor Address Block Addr1",
        :vendor_address_block_addr2 => "Vendor Address Block Addr2",
        :vendor_address_block_addr3 => "Vendor Address Block Addr3",
        :vendor_address_block_addr4 => "Vendor Address Block Addr4",
        :vendor_address_block_addr5 => "Vendor Address Block Addr5",
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
        :terms_id => "Terms",
        :terms_full_name => "Terms Full Name",
        :ship_method_id => "Ship Method",
        :ship_method_full_name => "Ship Method Full Name",
        :fob => "Fob",
        :total_amount => "9.99",
        :is_manually_closed => "Is Manually Closed",
        :is_fully_received => "Is Fully Received",
        :memo => "MyText",
        :vendor_msg => "Vendor Msg",
        :is_to_be_printed => "Is To Be Printed",
        :is_to_be_emailed => "Is To Be Emailed",
        :linked_txn_id => "Linked Txn",
        :linked_txn_type => "Linked Txn Type",
        :linked_txn_ref_number => "Linked Txn Ref Number",
        :linked_txn_link_type => "Linked Txn Link Type",
        :linked_txn_amount => "9.99"
      ),
      PurchaseOrder.create!(
        :id => "Id",
        :edit_sequence => "Edit Sequence",
        :txn_number => 2,
        :vendor_id => "Vendor",
        :vendor_full_name => "Vendor Full Name",
        :inventory_site_id => "Inventory Site",
        :inventory_site_full_name => "Inventory Site Full Name",
        :ship_to_entity_id => "Ship To Entity",
        :ship_to_entity_full_name => "Ship To Entity Full Name",
        :template_id => "Template",
        :template_full_name => "Template Full Name",
        :ref_number => "Ref Number",
        :vendor_address_addr1 => "Vendor Address Addr1",
        :vendor_address_addr2 => "Vendor Address Addr2",
        :vendor_address_addr3 => "Vendor Address Addr3",
        :vendor_address_addr4 => "Vendor Address Addr4",
        :vendor_address_addr5 => "Vendor Address Addr5",
        :vendor_address_city => "Vendor Address City",
        :vendor_address_state => "Vendor Address State",
        :vendor_address_postal_code => "Vendor Address Postal Code",
        :vendor_address_country => "Vendor Address Country",
        :vendor_address_note => "Vendor Address Note",
        :vendor_address_block_addr1 => "Vendor Address Block Addr1",
        :vendor_address_block_addr2 => "Vendor Address Block Addr2",
        :vendor_address_block_addr3 => "Vendor Address Block Addr3",
        :vendor_address_block_addr4 => "Vendor Address Block Addr4",
        :vendor_address_block_addr5 => "Vendor Address Block Addr5",
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
        :terms_id => "Terms",
        :terms_full_name => "Terms Full Name",
        :ship_method_id => "Ship Method",
        :ship_method_full_name => "Ship Method Full Name",
        :fob => "Fob",
        :total_amount => "9.99",
        :is_manually_closed => "Is Manually Closed",
        :is_fully_received => "Is Fully Received",
        :memo => "MyText",
        :vendor_msg => "Vendor Msg",
        :is_to_be_printed => "Is To Be Printed",
        :is_to_be_emailed => "Is To Be Emailed",
        :linked_txn_id => "Linked Txn",
        :linked_txn_type => "Linked Txn Type",
        :linked_txn_ref_number => "Linked Txn Ref Number",
        :linked_txn_link_type => "Linked Txn Link Type",
        :linked_txn_amount => "9.99"
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    assert_select "tr>td", :text => "Id".to_s, :count => 2
    assert_select "tr>td", :text => "Edit Sequence".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Vendor".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ship To Entity".to_s, :count => 2
    assert_select "tr>td", :text => "Ship To Entity Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Template".to_s, :count => 2
    assert_select "tr>td", :text => "Template Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ref Number".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Addr1".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Addr2".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Addr3".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Addr4".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Addr5".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address City".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address State".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Country".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Note".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Block Addr1".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Block Addr2".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Block Addr3".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Block Addr4".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Address Block Addr5".to_s, :count => 2
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
    assert_select "tr>td", :text => "Terms".to_s, :count => 2
    assert_select "tr>td", :text => "Terms Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Method".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Method Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Fob".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Is Manually Closed".to_s, :count => 2
    assert_select "tr>td", :text => "Is Fully Received".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor Msg".to_s, :count => 2
    assert_select "tr>td", :text => "Is To Be Printed".to_s, :count => 2
    assert_select "tr>td", :text => "Is To Be Emailed".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn Type".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn Ref Number".to_s, :count => 2
    assert_select "tr>td", :text => "Linked Txn Link Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

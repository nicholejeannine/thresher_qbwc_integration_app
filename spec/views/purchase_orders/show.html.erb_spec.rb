require 'rails_helper'

RSpec.describe "purchase_orders/show", type: :view do
  before(:each) do
    @purchase_order = assign(:purchase_order, PurchaseOrder.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id/)
    expect(rendered).to match(/Edit Sequence/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Vendor/)
    expect(rendered).to match(/Vendor Full Name/)
    expect(rendered).to match(/Inventory Site/)
    expect(rendered).to match(/Inventory Site Full Name/)
    expect(rendered).to match(/Ship To Entity/)
    expect(rendered).to match(/Ship To Entity Full Name/)
    expect(rendered).to match(/Template/)
    expect(rendered).to match(/Template Full Name/)
    expect(rendered).to match(/Ref Number/)
    expect(rendered).to match(/Vendor Address Addr1/)
    expect(rendered).to match(/Vendor Address Addr2/)
    expect(rendered).to match(/Vendor Address Addr3/)
    expect(rendered).to match(/Vendor Address Addr4/)
    expect(rendered).to match(/Vendor Address Addr5/)
    expect(rendered).to match(/Vendor Address City/)
    expect(rendered).to match(/Vendor Address State/)
    expect(rendered).to match(/Vendor Address Postal Code/)
    expect(rendered).to match(/Vendor Address Country/)
    expect(rendered).to match(/Vendor Address Note/)
    expect(rendered).to match(/Vendor Address Block Addr1/)
    expect(rendered).to match(/Vendor Address Block Addr2/)
    expect(rendered).to match(/Vendor Address Block Addr3/)
    expect(rendered).to match(/Vendor Address Block Addr4/)
    expect(rendered).to match(/Vendor Address Block Addr5/)
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
    expect(rendered).to match(/Terms/)
    expect(rendered).to match(/Terms Full Name/)
    expect(rendered).to match(/Ship Method/)
    expect(rendered).to match(/Ship Method Full Name/)
    expect(rendered).to match(/Fob/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Is Manually Closed/)
    expect(rendered).to match(/Is Fully Received/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Vendor Msg/)
    expect(rendered).to match(/Is To Be Printed/)
    expect(rendered).to match(/Is To Be Emailed/)
    expect(rendered).to match(/Linked Txn/)
    expect(rendered).to match(/Linked Txn Type/)
    expect(rendered).to match(/Linked Txn Ref Number/)
    expect(rendered).to match(/Linked Txn Link Type/)
    expect(rendered).to match(/9.99/)
  end
end

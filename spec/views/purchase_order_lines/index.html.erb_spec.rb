require 'rails_helper'

RSpec.describe "purchase_order_lines/index", type: :view do
  before(:each) do
    assign(:purchase_order_lines, [
      PurchaseOrderLine.create!(
        :purchase_order_id => "Purchase Order",
        :item_id => "Item",
        :item_full_name => "Item Full Name",
        :manufacturer_part_number => "Manufacturer Part Number",
        :desc => "MyText",
        :quantity => "9.99",
        :unit_of_measure => "Unit Of Measure",
        :override_uom_set_id => "Override Uom Set",
        :override_uom_set_full_name => "Override Uom Set Full Name",
        :rate => "9.99",
        :amount => "9.99",
        :inventory_site_location_id => "Inventory Site Location",
        :inventory_site_location_full_name => "Inventory Site Location Full Name",
        :customer_id => "Customer",
        :customer_full_name => "Customer Full Name",
        :received_quantity => "9.99",
        :unbilled_quantity => "9.99",
        :is_billed => "Is Billed",
        :is_manually_closed => "Is Manually Closed"
      ),
      PurchaseOrderLine.create!(
        :purchase_order_id => "Purchase Order",
        :item_id => "Item",
        :item_full_name => "Item Full Name",
        :manufacturer_part_number => "Manufacturer Part Number",
        :desc => "MyText",
        :quantity => "9.99",
        :unit_of_measure => "Unit Of Measure",
        :override_uom_set_id => "Override Uom Set",
        :override_uom_set_full_name => "Override Uom Set Full Name",
        :rate => "9.99",
        :amount => "9.99",
        :inventory_site_location_id => "Inventory Site Location",
        :inventory_site_location_full_name => "Inventory Site Location Full Name",
        :customer_id => "Customer",
        :customer_full_name => "Customer Full Name",
        :received_quantity => "9.99",
        :unbilled_quantity => "9.99",
        :is_billed => "Is Billed",
        :is_manually_closed => "Is Manually Closed"
      )
    ])
  end

  it "renders a list of purchase_order_lines" do
    render
    assert_select "tr>td", :text => "Purchase Order".to_s, :count => 2
    assert_select "tr>td", :text => "Item".to_s, :count => 2
    assert_select "tr>td", :text => "Item Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer Part Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unit Of Measure".to_s, :count => 2
    assert_select "tr>td", :text => "Override Uom Set".to_s, :count => 2
    assert_select "tr>td", :text => "Override Uom Set Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site Location".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site Location Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Is Billed".to_s, :count => 2
    assert_select "tr>td", :text => "Is Manually Closed".to_s, :count => 2
  end
end

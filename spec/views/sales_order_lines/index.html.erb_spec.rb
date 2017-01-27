require 'rails_helper'

RSpec.describe "sales_order_lines/index", type: :view do
  before(:each) do
    assign(:sales_order_lines, [
      SalesOrderLine.create!(
        :sales_order_id => "Sales Order",
        :item_id => "Item",
        :item_full_name => "Item Full Name",
        :desc => "MyText",
        :quantity => "9.99",
        :unit_of_measure => "Unit Of Measure",
        :override_uom_set_id => "Override Uom Set",
        :override_uom_set_full_name => "Override Uom Set Full Name",
        :rate => "9.99",
        :rate_percent => 2.5,
        :amount => "9.99",
        :inventory_site_id => "Inventory Site",
        :inventory_site_full_name => "Inventory Site Full Name",
        :inventory_site_location_id => "Inventory Site Location",
        :inventory_site_location_full_name => "Inventory Site Location Full Name",
        :serial_number => "Serial Number",
        :lot_number => "Lot Number",
        :sales_tax_code_id => "Sales Tax Code",
        :sales_tax_code_full_name => "Sales Tax Code Full Name",
        :invoiced => "9.99",
        :is_manually_closed => "Is Manually Closed"
      ),
      SalesOrderLine.create!(
        :sales_order_id => "Sales Order",
        :item_id => "Item",
        :item_full_name => "Item Full Name",
        :desc => "MyText",
        :quantity => "9.99",
        :unit_of_measure => "Unit Of Measure",
        :override_uom_set_id => "Override Uom Set",
        :override_uom_set_full_name => "Override Uom Set Full Name",
        :rate => "9.99",
        :rate_percent => 2.5,
        :amount => "9.99",
        :inventory_site_id => "Inventory Site",
        :inventory_site_full_name => "Inventory Site Full Name",
        :inventory_site_location_id => "Inventory Site Location",
        :inventory_site_location_full_name => "Inventory Site Location Full Name",
        :serial_number => "Serial Number",
        :lot_number => "Lot Number",
        :sales_tax_code_id => "Sales Tax Code",
        :sales_tax_code_full_name => "Sales Tax Code Full Name",
        :invoiced => "9.99",
        :is_manually_closed => "Is Manually Closed"
      )
    ])
  end

  it "renders a list of sales_order_lines" do
    render
    assert_select "tr>td", :text => "Sales Order".to_s, :count => 2
    assert_select "tr>td", :text => "Item".to_s, :count => 2
    assert_select "tr>td", :text => "Item Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unit Of Measure".to_s, :count => 2
    assert_select "tr>td", :text => "Override Uom Set".to_s, :count => 2
    assert_select "tr>td", :text => "Override Uom Set Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site Location".to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Site Location Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Serial Number".to_s, :count => 2
    assert_select "tr>td", :text => "Lot Number".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Tax Code".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Tax Code Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Is Manually Closed".to_s, :count => 2
  end
end

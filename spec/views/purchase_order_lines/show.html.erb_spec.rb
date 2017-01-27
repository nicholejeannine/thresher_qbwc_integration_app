require 'rails_helper'

RSpec.describe "purchase_order_lines/show", type: :view do
  before(:each) do
    @purchase_order_line = assign(:purchase_order_line, PurchaseOrderLine.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Purchase Order/)
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/Item Full Name/)
    expect(rendered).to match(/Manufacturer Part Number/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Unit Of Measure/)
    expect(rendered).to match(/Override Uom Set/)
    expect(rendered).to match(/Override Uom Set Full Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Inventory Site Location/)
    expect(rendered).to match(/Inventory Site Location Full Name/)
    expect(rendered).to match(/Customer/)
    expect(rendered).to match(/Customer Full Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Is Billed/)
    expect(rendered).to match(/Is Manually Closed/)
  end
end

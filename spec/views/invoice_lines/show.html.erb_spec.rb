require 'rails_helper'

RSpec.describe "invoice_lines/show", type: :view do
  before(:each) do
    @invoice_line = assign(:invoice_line, InvoiceLine.create!(
      :invoice_id => "Invoice",
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
      :sales_tax_code_full_name => "Sales Tax Code Full Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Invoice/)
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/Item Full Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Unit Of Measure/)
    expect(rendered).to match(/Override Uom Set/)
    expect(rendered).to match(/Override Uom Set Full Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Inventory Site/)
    expect(rendered).to match(/Inventory Site Full Name/)
    expect(rendered).to match(/Inventory Site Location/)
    expect(rendered).to match(/Inventory Site Location Full Name/)
    expect(rendered).to match(/Serial Number/)
    expect(rendered).to match(/Lot Number/)
    expect(rendered).to match(/Sales Tax Code/)
    expect(rendered).to match(/Sales Tax Code Full Name/)
  end
end

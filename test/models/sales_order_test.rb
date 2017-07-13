require 'test_helper'

class SalesOrderTest < ActiveSupport::TestCase
  
  test "can parse a simple hash" do
    assert_equal(1, SalesOrder.count, "Should equal one")
    assert_equal(10, SalesOrderLine.count, "Should parse sales order lines")
  end

  test "can save billing address" do
    assert_equal("Square, Inc.", SalesOrder.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    assert_equal("1455 Market St. 6th floor", SalesOrder.first.ship_addr3, "Ship Address should parse")
  end

  test "handles ref types" do
    assert_equal("Sales Order with Rep", SalesOrder.first.template)
    assert_equal("ARJ", SalesOrder.first.sales_rep)
    assert_equal("SF/CA", SalesOrder.first.item_sales_tax)
    assert_equal("Tax", SalesOrder.first.customer_sales_tax_code)
  end

  test "updates existing hash" do
    hash = {"txn_id" => "53DFA4-1498058332","txn_number" => 19, "txn_date" => "2018-06-19", "ref_number" => "10634a", "po_number" => "Ryan", "due_date" => "2019-06-19","ship_date" => "2011-01-01", "sales_tax_percentage" => 19.0, "sales_tax_total" => 100.00, "total_amount" => 101.00, "is_manually_closed" => true, "is_fully_invoiced" => true, "memo" => "Estimate 10644a:", "is_to_be_printed" => false, "is_to_be_emailed" => true, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "AAA"}}
    SalesOrder.parse_qb_response(hash)
    assert_equal(1, SalesOrder.count)
    assert_equal(19, SalesOrder.first.txn_number)
    assert_equal("2018-06-19", SalesOrder.first.txn_date.iso8601)
    assert_equal("10634a", SalesOrder.first.ref_number)
    assert_equal("Ryan", SalesOrder.first.po_number)
    assert_equal("2019-06-19", SalesOrder.first.due_date.iso8601)
    assert_equal("2011-01-01", SalesOrder.first.ship_date.iso8601)
    assert_equal(19.0, SalesOrder.first.sales_tax_percentage)
    assert_equal(100.00, SalesOrder.first.sales_tax_total.to_f)
    assert_equal(101.00, SalesOrder.first.total_amount.to_f)
    assert_equal(true, SalesOrder.first.is_manually_closed)
    assert_equal(true, SalesOrder.first.is_fully_invoiced)
    assert_equal("Estimate 10644a:", SalesOrder.first.memo)
    assert_equal(false, SalesOrder.first.is_to_be_printed)
    assert_equal(true, SalesOrder.first.is_to_be_emailed)
    assert_equal("AAA", SalesOrder.first.customer_sales_tax_code)
  end
  
  def setup
    SalesOrderLine.destroy_all
    SalesOrder.destroy_all
    qb_hash = {"xml_attributes" => {}, "txn_id" => "53DFA4-1498058332", "time_created" => "2017-06-21T08:18:52-08:00", "time_modified" => "2017-06-21T08:18:52-08:00", "edit_sequence" => "1498058332", "txn_number" => 184031, "customer_ref" => {"xml_attributes" => {}, "list_id" => "80001A64-1497556200", "full_name" => "Square:Construction:P-3030"}, "template_ref" => {"xml_attributes" => {}, "list_id" => "8000001A-1205018374", "full_name" => "Sales Order with Rep"}, "txn_date" => "2017-06-21", "ref_number" => "5681", "bill_address" => {"xml_attributes" => {}, "addr1" => "Square, Inc.", "addr2" => "Attn: Ryan Knupfer", "addr3" => "1455 Market St. 6th floor", "city" => "San Francisco", "state" => "CA", "postal_code" => "94104"}, "bill_address_block" => {"xml_attributes" => {}, "addr1" => "Square, Inc.", "addr2" => "Attn: Ryan Knupfer", "addr3" => "1455 Market St. 6th floor", "addr4" => "San Francisco, CA 94104"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Square, Inc.", "addr2" => "Attn:  Ryan Knupfer", "addr3" => "1455 Market St. 6th floor", "city" => "San Francisco", "state" => "CA", "postal_code" => "94104"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Square, Inc.", "addr2" => "Attn:  Ryan Knupfer", "addr3" => "1455 Market St. 6th floor", "addr4" => "San Francisco, CA 94104"}, "po_number" => "Ryan Approved", "due_date" => "2017-06-21", "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "8000000E-1398458241", "full_name" => "ARJ"}, "ship_date" => "2017-06-21", "subtotal" => 40181.96, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10E0000-875338870", "full_name" => "SF/CA"}, "sales_tax_percentage" => 8.5, "sales_tax_total" => 3410.36, "total_amount" => 43592.32, "is_manually_closed" => false, "is_fully_invoiced" => false, "memo" => "Estimate 10644:", "is_to_be_printed" => true, "is_to_be_emailed" => false, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "other" => "L19 Displays", "sales_order_line_ret" => [{"xml_attributes" => {}, "txn_line_id" => "53DFA6-1498058332", "desc" => "L19 Displays", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFA7-1498058332", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFA8-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "80003187-1496963408", "full_name" => "Sony:FWD49X900E"}, "desc" => "Sony - 49\" BRAVIA 4K HDR Professional Display", "quantity" => "#<BigDecimal:7fb1185a2910,'0.4E1',9(18)>", "rate" => 1265.6, "amount" => 5062.4, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "invoiced" => "#<BigDecimal:7fb11857fd48,'0.0',9(18)>", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFA9-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "80003144-1495672109", "full_name" => "Sony:FWD65X750D"}, "desc" => "Sony - 65\" 4K Pro Bravia Display", "quantity" => "#<BigDecimal:7fb118558c70,'0.2E1',9(18)>", "rate" => 1675.52, "amount" => 3351.04, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "invoiced" => "#<BigDecimal:7fb1185585e0,'0.0',9(18)>", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFAA-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "80003188-1496963813", "full_name" => "Sony:FWD75X900E"}, "desc" => "Sony - 75\" BRAVIA 4K HDR Professional Display", "quantity" => "#<BigDecimal:7fb118534c58,'0.4E1',9(18)>", "rate" => 4362.4, "amount" => 17449.6, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "invoiced" => "#<BigDecimal:7fb118511ff0,'0.0',9(18)>", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFAB-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "80003186-1496963243", "full_name" => "Sony:FWD85X850D"}, "desc" => "Sony FWD85X850D - 85\" Pro LED Display with Tuner. 4K and Edge Lit", "quantity" => "#<BigDecimal:7fb1184ee460,'0.2E1',9(18)>", "rate" => 6896.96, "amount" => 13793.92, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "invoiced" => "#<BigDecimal:7fb1184cbe38,'0.0',9(18)>", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFAC-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "80001487-1299567988", "full_name" => "EWR:EWR>35"}, "desc" => "EWR Fee for displays greater than 35\"", "quantity" => "#<BigDecimal:7fb1184a4428,'0.12E2',9(18)>", "rate" => 5.0, "amount" => 60.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "20000-1009221895", "full_name" => "Non"}, "invoiced" => "#<BigDecimal:7fb1184a4540,'0.0',9(18)>", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFAD-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "80000E2C-1218667550", "full_name" => "Subtotal"}, "amount" => 39716.96, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFAE-1498058332", "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "53DFAF-1498058332", "item_ref" => {"xml_attributes" => {}, "list_id" => "A10001-875338869", "full_name" => "Shipping"}, "desc" => "Shipping charges", "quantity" => "#<BigDecimal:7fb118454450,'0.1E1',9(18)>", "rate" => 465.0, "amount" => 465.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "invoiced" => "#<BigDecimal:7fb1184316f8,'0.0',9(18)>", "is_manually_closed" => false}]}
    SalesOrder.parse_qb_response(qb_hash)
  end

end

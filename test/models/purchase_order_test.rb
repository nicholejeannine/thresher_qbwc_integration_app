require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    assert_equal(1, PurchaseOrder.count, "should equal one")
    assert_equal(3, PurchaseOrderLine.count, "should parse lines")
  end

  test "can save billing address" do
    assert_equal("Box HQ", PurchaseOrder.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    assert_equal("900 Jefferson Road", PurchaseOrder.first.ship_addr1, "Ship Address should parse")
  end

  test "handles ref types" do
    assert_equal("ARJ", PurchaseOrder.first.sales_rep)
    assert_equal("SM/CA", PurchaseOrder.first.item_sales_tax)
    assert_equal("Tax", PurchaseOrder.first.customer_sales_tax_code)
  end

  test "updates existing hash" do
    hash = {"txn_id" => "53D7E5-1497890620", "txn_date" => "2018-06-19", "ref_number" => "10634a",  "is_active" => false, "due_date" => "2019-06-19", "sales_tax_percentage" => 19.0, "sales_tax_total" => 100.00, "total_amount" => 100.00, "is_to_be_emailed" => true, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "AAA"}}
    PurchaseOrder.parse_qb_response(hash)
    assert_equal(1, PurchaseOrder.count)
    assert_equal("2018-06-19", PurchaseOrder.first.txn_date.iso8601)
    assert_equal("10634a", PurchaseOrder.first.ref_number)
    assert_equal(false, PurchaseOrder.first.is_active)
    assert_equal("2019-06-19", PurchaseOrder.first.due_date.iso8601)
    assert_equal(19.0, PurchaseOrder.first.sales_tax_percentage)
    assert_equal(100.00, PurchaseOrder.first.sales_tax_total.to_f)
    assert_equal(true, PurchaseOrder.first.is_to_be_emailed)
    assert_equal("AAA", PurchaseOrder.first.customer_sales_tax_code)
  end
  
  def setup
    PurchaseOrderLine.destroy_all
    PurchaseOrder.destroy_all
    qb_hash = {"xml_attributes" => {}, "txn_id" => "507918-1488813535", "time_created" => "2017-03-06T07:18:55-08:00", "time_modified" => "2017-06-02T08:22:31-08:00", "edit_sequence" => "1488813535", "txn_number" => 178517, "vendor_ref" => {"xml_attributes" => {}, "list_id" => "800007BF-1299525249", "full_name" => "Shure"}, "template_ref" => {"xml_attributes" => {}, "list_id" => "B0000-1049402869", "full_name" => "Normal Purchase Order"}, "txn_date" => "2017-03-06", "ref_number" => "20253", "vendor_address" => {"xml_attributes" => {}, "addr1" => "Shure, Inc.", "addr2" => "5800 West Touhy Ave.", "city" => "Niles", "state" => "IL", "postal_code" => "60714-4608"}, "vendor_address_block" => {"xml_attributes" => {}, "addr1" => "Shure, Inc.", "addr2" => "5800 West Touhy Ave.", "addr3" => "Niles, IL 60714-4608"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Thresher Communication & Productivity, I", "addr2" => "Attn:  Logistics", "addr3" => "234 E. Caribbean Drive", "city" => "Sunnyvale", "state" => "CA", "postal_code" => "94089"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Thresher Communication & Productivity, I", "addr2" => "Attn:  Logistics", "addr3" => "234 E. Caribbean Drive", "addr4" => "Sunnyvale,  CA  94089"}, "terms_ref" => {"xml_attributes" => {}, "list_id" => "80000015-1461343613", "full_name" => "4% 20 Net 30"}, "due_date" => "2017-04-05", "expected_date" => "2017-03-06", "total_amount" => 790.0, "is_manually_closed" => false, "is_fully_received" => true, "memo" => "Sales Order 5454: Estimate 10087:", "is_to_be_printed" => false, "is_to_be_emailed" => false, "purchase_order_line_ret" => [{"xml_attributes" => {}, "txn_line_id" => "50791A-1488813535", "item_ref" => {"xml_attributes" => {}, "list_id" => "800028AB-1428335323", "full_name" => "Shure:MXW2/SM58"}, "manufacturer_part_number" => "MCW2/SM58", "desc" => "Shure - Handheld Transmitter with SM58® Microphone (Includes one SB902 Battery)", "quantity" => "#<BigDecimal:7fb1172c6b48,'0.2E1',9(18)>", "rate" => 395.0, "amount" => 790.0, "customer_ref" => {"xml_attributes" => {}, "list_id" => "800018C4-1486501430", "full_name" => "CZI:Construction:Palo Alto:P-2803"}, "received_quantity" => "#<BigDecimal:7fb11729e1c0,'0.2E1',9(18)>", "unbilled_quantity" => "#<BigDecimal:7fb11729d680,'0.0',9(18)>", "is_billed" => true, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "50791B-1488813535", "is_billed" => false, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "50791C-1488813535", "desc" => "Needed by 3/17", "is_billed" => false, "is_manually_closed" => false}]}
    qb_hash = {"xml_attributes" => {}, "txn_id" => "507918-1488813535", "time_created" => "2017-03-06T07:18:55-08:00", "time_modified" => "2017-06-02T08:22:31-08:00", "edit_sequence" => "1488813535", "txn_number" => 178517, "vendor_ref" => {"xml_attributes" => {}, "list_id" => "800007BF-1299525249", "full_name" => "Shure"}, "template_ref" => {"xml_attributes" => {}, "list_id" => "B0000-1049402869", "full_name" => "Normal Purchase Order"}, "txn_date" => "2017-03-06", "ref_number" => "20253", "vendor_address" => {"xml_attributes" => {}, "addr1" => "Shure, Inc.", "addr2" => "5800 West Touhy Ave.", "city" => "Niles", "state" => "IL", "postal_code" => "60714-4608"}, "vendor_address_block" => {"xml_attributes" => {}, "addr1" => "Shure, Inc.", "addr2" => "5800 West Touhy Ave.", "addr3" => "Niles, IL 60714-4608"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Thresher Communication & Productivity, I", "addr2" => "Attn:  Logistics", "addr3" => "234 E. Caribbean Drive", "city" => "Sunnyvale", "state" => "CA", "postal_code" => "94089"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Thresher Communication & Productivity, I", "addr2" => "Attn:  Logistics", "addr3" => "234 E. Caribbean Drive", "addr4" => "Sunnyvale,  CA  94089"}, "terms_ref" => {"xml_attributes" => {}, "list_id" => "80000015-1461343613", "full_name" => "4% 20 Net 30"}, "due_date" => "2017-04-05", "expected_date" => "2017-03-06", "total_amount" => 790.0, "is_manually_closed" => false, "is_fully_received" => true, "memo" => "Sales Order 5454: Estimate 10087:", "is_to_be_printed" => false, "is_to_be_emailed" => false, "purchase_order_line_ret" => [{"xml_attributes" => {}, "txn_line_id" => "50791A-1488813535", "item_ref" => {"xml_attributes" => {}, "list_id" => "800028AB-1428335323", "full_name" => "Shure:MXW2/SM58"}, "manufacturer_part_number" => "MCW2/SM58", "desc" => "Shure - Handheld Transmitter with SM58® Microphone (Includes one SB902 Battery)", "quantity" => "#<BigDecimal:7fb1172c6b48,'0.2E1',9(18)>", "rate" => 395.0, "amount" => 790.0, "customer_ref" => {"xml_attributes" => {}, "list_id" => "800018C4-1486501430", "full_name" => "CZI:Construction:Palo Alto:P-2803"}, "received_quantity" => "#<BigDecimal:7fb11729e1c0,'0.2E1',9(18)>", "unbilled_quantity" => "#<BigDecimal:7fb11729d680,'0.0',9(18)>", "is_billed" => true, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "50791B-1488813535", "is_billed" => false, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "50791C-1488813535", "desc" => "Needed by 3/17", "is_billed" => false, "is_manually_closed" => false}]}
    PurchaseOrder.parse_qb_response(qb_hash)
  end

end

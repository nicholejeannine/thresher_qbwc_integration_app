require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    assert_equal(1, PurchaseOrder.count, "should equal one")
    assert_equal(3, PurchaseOrderLine.count, "should parse lines")
  end

  test "can save vendor address" do
    assert_equal("Shure, Inc.", PurchaseOrder.first.vendor_addr1, "Vendor Address should parse")
  end

  test "can save ship address" do
    assert_equal("Thresher Communication & Productivity, I", PurchaseOrder.first.ship_addr1, "Ship Address should parse")
  end

  test "handles ref types" do
    assert_equal("Normal Purchase Order", PurchaseOrder.first.template)
    assert_equal("4% 20 Net 30", PurchaseOrder.first.terms)
  end

  test "updates existing hash" do
    hash = {"txn_id" => "507918-1488813535", "txn_number" => 22222, "txn_date" => "2019-06-19", "ref_number" => "10634a", "due_date" => "2017-02-17", "expected_date" => "2019-02-17", "total_amount" => 18.00, "is_manually_closed" => true, "is_fully_received" => false, "memo" => "Test", "is_to_be_printed" => true, "is_to_be_emailed" => true}
    PurchaseOrder.parse_qb_response(hash)
    assert_equal(1, PurchaseOrder.count)
    assert_equal(22222, PurchaseOrder.first.txn_number)
    assert_equal("2019-06-19", PurchaseOrder.first.txn_date.iso8601)
    assert_equal("10634a", PurchaseOrder.first.ref_number)
    assert_equal("2017-02-17", PurchaseOrder.first.due_date.iso8601)
    assert_equal("2019-02-17", PurchaseOrder.first.expected_date.iso8601)
    assert_equal(18.00, PurchaseOrder.first.total_amount.to_f)
    assert_equal(true, PurchaseOrder.first.is_manually_closed)
    assert_equal(false, PurchaseOrder.first.is_fully_received)
    assert_equal("Test", PurchaseOrder.first.memo)
    assert_equal(true, PurchaseOrder.first.is_to_be_printed)
    assert_equal(true, PurchaseOrder.first.is_to_be_emailed)
  end

  test "saves vendor id" do
    assert_equal(1, Vendor.count)
    assert_equal(Vendor.first.id, PurchaseOrder.first.vendor_id)
  end

  test "line items have correct foreign key" do
    ids = PurchaseOrderLine.pluck("purchase_order_id").compact
    assert_equal(PurchaseOrderLine.count, ids.count)
    assert_not_nil(PurchaseOrderLine.first.purchase_order_id)
    assert_equal(PurchaseOrderLine.first.purchase_order_id, PurchaseOrder.first.id)
  end

  test "purchase order parses the sales order id" do
    assert_not_nil(PurchaseOrder.first.sales_order_id)
    assert_equal(SalesOrder.first.id, PurchaseOrder.first.sales_order_id)
  end
  
  def setup
    SalesOrder.destroy_all
    SalesOrder.create!({"txn_id" => "133283", "ref_number" => "5454"})
    Vendor.destroy_all
    Vendor.create!({"list_id" => "800007BF-1299525249", "name" => "Shure"})
    PurchaseOrderLine.destroy_all
    PurchaseOrder.destroy_all
    qb_hash = {"xml_attributes" => {}, "txn_id" => "507918-1488813535", "time_created" => "2017-03-06T07:18:55-08:00", "time_modified" => "2017-06-02T08:22:31-08:00", "edit_sequence" => "1488813535", "txn_number" => 178517, "vendor_ref" => {"xml_attributes" => {}, "list_id" => "800007BF-1299525249", "full_name" => "Shure"}, "template_ref" => {"xml_attributes" => {}, "list_id" => "B0000-1049402869", "full_name" => "Normal Purchase Order"}, "txn_date" => "2017-03-06", "ref_number" => "20253", "vendor_address" => {"xml_attributes" => {}, "addr1" => "Shure, Inc.", "addr2" => "5800 West Touhy Ave.", "city" => "Niles", "state" => "IL", "postal_code" => "60714-4608"}, "vendor_address_block" => {"xml_attributes" => {}, "addr1" => "Shure, Inc.", "addr2" => "5800 West Touhy Ave.", "addr3" => "Niles, IL 60714-4608"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Thresher Communication & Productivity, I", "addr2" => "Attn:  Logistics", "addr3" => "234 E. Caribbean Drive", "city" => "Sunnyvale", "state" => "CA", "postal_code" => "94089"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Thresher Communication & Productivity, I", "addr2" => "Attn:  Logistics", "addr3" => "234 E. Caribbean Drive", "addr4" => "Sunnyvale,  CA  94089"}, "terms_ref" => {"xml_attributes" => {}, "list_id" => "80000015-1461343613", "full_name" => "4% 20 Net 30"}, "due_date" => "2017-04-05", "expected_date" => "2017-03-06", "total_amount" => 790.0, "is_manually_closed" => false, "is_fully_received" => true, "memo" => "Sales Order 5454: Estimate 10087:", "is_to_be_printed" => false, "is_to_be_emailed" => false, "purchase_order_line_ret" => [{"xml_attributes" => {}, "txn_line_id" => "50791A-1488813535", "item_ref" => {"xml_attributes" => {}, "list_id" => "800028AB-1428335323", "full_name" => "Shure:MXW2/SM58"}, "manufacturer_part_number" => "MCW2/SM58", "desc" => "Shure - Handheld Transmitter with SM58® Microphone (Includes one SB902 Battery)", "quantity" => "#<BigDecimal:7fb1172c6b48,'0.2E1',9(18)>", "rate" => 395.0, "amount" => 790.0, "customer_ref" => {"xml_attributes" => {}, "list_id" => "800018C4-1486501430", "full_name" => "CZI:Construction:Palo Alto:P-2803"}, "received_quantity" => "#<BigDecimal:7fb11729e1c0,'0.2E1',9(18)>", "unbilled_quantity" => "#<BigDecimal:7fb11729d680,'0.0',9(18)>", "is_billed" => true, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "50791B-1488813535", "is_billed" => false, "is_manually_closed" => false}, {"xml_attributes" => {}, "txn_line_id" => "50791C-1488813535", "desc" => "Needed by 3/17", "is_billed" => false, "is_manually_closed" => false}]}
    PurchaseOrder.parse_qb_response(qb_hash)
  end

end

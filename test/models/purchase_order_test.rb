require 'test_helper'
require 'fixtures/purchase_order_hash'

class PurchaseOrderTest < ActiveSupport::TestCase
  include PurchaseOrderHash

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
    PurchaseOrder.parse_qb_response(qb_hash)
  end

end

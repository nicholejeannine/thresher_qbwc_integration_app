require 'test_helper'
require 'fixtures/sales_order_hash'

class SalesOrderTest < ActiveSupport::TestCase
  include SalesOrderHash

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

  test "line items have correct foreign key" do
    ids = SalesOrderLine.pluck("sales_order_id").compact
    assert_equal(SalesOrderLine.count, ids.count)
    assert_not_nil(SalesOrderLine.first.sales_order_id)
    assert_equal(SalesOrderLine.first.sales_order_id, SalesOrder.first.id)
  end

  test "sales order parses the estimate id" do
    assert_not_nil(SalesOrder.first.estimate_id)
    assert_equal(Estimate.first.id, SalesOrder.first.estimate_id)
  end

  test "parses customer reference" do
    assert_equal("Square:Construction:P-3030", SalesOrder.first.customer)
  end
  
  def setup
    Estimate.destroy_all
    Estimate.create!({"txn_id" => "324t8", "ref_number" => "10644"})
    SalesOrderLine.destroy_all
    SalesOrder.destroy_all
    SalesOrder.parse_qb_response(qb_hash)
  end

end

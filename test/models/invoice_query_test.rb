require 'test_helper'
require 'fixtures/invoice_hash'

class InvoiceTest < ActiveSupport::TestCase
  include InvoiceHash

  test "can parse a simple hash" do
    assert_equal(1, Invoice.count, "should equal one")
    assert_equal(7, InvoiceLine.count, "should parse lines")
  end

  test "can save billing address" do
    assert_equal("Peninsula Innovation Partners, ", Invoice.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    assert_equal("LLC", Invoice.first.ship_addr2, "Ship Address should parse")
  end

  test "handles ref types" do
    assert_equal("ThresherStandard Invoice", Invoice.first.template)
    assert_equal("Net 30", Invoice.first.terms)
    assert_equal("GJM", Invoice.first.sales_rep)
    assert_equal("SM/CA", Invoice.first.item_sales_tax)
    assert_equal("Main Phone:408.780.3066  \naccountsreceivable@alopias.com", Invoice.first.customer_msg)
    assert_equal("Tax", Invoice.first.customer_sales_tax_code)
  end

  test "updates existing hash" do
    hash = {"txn_id" => "53D53B-1497636612", "txn_number" => 2, "txn_date" => "2019-06-16", "ref_number" => "12", "bill_address" => {"xml_attributes" => {}, "addr1" => "Pen"}, "is_pending" => true, "is_finance_charge" => true, "po_number" => "99", "ship_date" => "2019-01-16", "subtotal" => 7.77, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10D0000-875338870", "full_name" => "CA/CA"}, "sales_tax_percentage" => 1.11, "sales_tax_total" => 17.17, "applied_amount" => 10.0, "balance_remaining" => 12.12, "memo" => "Estimate 10544a:", "is_paid" => true, "customer_msg_ref" => {"xml_attributes" => {}, "list_id" => "80000015-1391724709", "full_name" => "DONE"}, "is_to_be_printed" => true, "is_to_be_emailed" => true}
    Invoice.parse_qb_response(hash)
    assert_equal(1, Invoice.count)
    assert_equal(2, Invoice.first.txn_number)
    assert_equal("2019-06-16", Invoice.first.txn_date.iso8601)
    assert_equal("12", Invoice.first.ref_number)
    assert_equal("Pen", Invoice.first.bill_addr1)
    assert_equal("99", Invoice.first.po_number)
    assert_equal("2019-01-16", Invoice.first.ship_date.iso8601)
    assert_equal(7.77, Invoice.first.subtotal.to_f)
    assert_equal("CA/CA", Invoice.first.item_sales_tax)
    assert_equal(1.11, Invoice.first.sales_tax_percentage)
    assert_equal(17.17, Invoice.first.sales_tax_total)
    assert_equal(10.0, Invoice.first.applied_amount)
    assert_equal(12.12, Invoice.first.balance_remaining)
    assert_equal("Estimate 10544a:", Invoice.first.memo)
    assert_equal(true, Invoice.first.is_paid)
    assert_equal("DONE", Invoice.first.customer_msg)
    assert_equal(true, Invoice.first.is_to_be_printed)
    assert_equal(true, Invoice.first.is_to_be_emailed)
  end

  test "line items have correct foreign key" do
    ids = InvoiceLine.pluck("invoice_id").compact
    assert_equal(InvoiceLine.count, ids.count)
    assert_not_nil(InvoiceLine.first.invoice_id)
    assert_equal(InvoiceLine.first.invoice_id, Invoice.first.id)
  end

  test "invoice parses the sales order id" do
    assert_not_nil(Invoice.first.sales_order_id)
    assert_equal(SalesOrder.first.id, Invoice.first.sales_order_id)
  end

  test "parses customer reference" do
    assert_equal("Facebook:Construction:Menlo Park Campus:Bld 59:P-2872", Invoice.first.customer_full_name)
  end

  def setup
    Estimate.destroy_all
    Estimate.create!({"txn_id" => "1234567", "ref_number" => "10544"})
    SalesOrder.destroy_all
    SalesOrder.create!({"txn_id" => "53D529-1497631698"})
    InvoiceLine.destroy_all
    Invoice.destroy_all
    Invoice.parse_qb_response(qb_hash)
  end

end

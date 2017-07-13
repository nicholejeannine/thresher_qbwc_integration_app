require 'test_helper'

class ReceivePaymentTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    assert_equal(1, ReceivePayment.count, "should equal one")
  end

  test "can save billing address" do
    assert_equal("Box HQ", ReceivePayment.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    assert_equal("900 Jefferson Road", ReceivePayment.first.ship_addr1, "Ship Address should parse")
  end

  test "handles ref types" do
    assert_equal("ARJ", ReceivePayment.first.sales_rep)
    assert_equal("Custom ReceivePayment", ReceivePayment.first.template)
    assert_equal("SM/CA", ReceivePayment.first.item_sales_tax)
    assert_equal("Tax", ReceivePayment.first.customer_sales_tax_code)
  end

  test "updates existing hash" do
    hash = {"txn_id" => "53D7E5-1497890620", "txn_date" => "2018-06-19", "ref_number" => "10634a",  "is_active" => false, "due_date" => "2019-06-19", "sales_tax_percentage" => 19.0, "sales_tax_total" => 100.00, "total_amount" => 100.00, "is_to_be_emailed" => true, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "AAA"}}
    ReceivePayment.parse_qb_response(hash)
    assert_equal(1, ReceivePayment.count)
    assert_equal("2018-06-19", ReceivePayment.first.txn_date.iso8601)
    assert_equal("10634a", ReceivePayment.first.ref_number)
    assert_equal(false, ReceivePayment.first.is_active)
    assert_equal("2019-06-19", ReceivePayment.first.due_date.iso8601)
    assert_equal(19.0, ReceivePayment.first.sales_tax_percentage)
    assert_equal(100.00, ReceivePayment.first.sales_tax_total.to_f)
    assert_equal(true, ReceivePayment.first.is_to_be_emailed)
    assert_equal("AAA", ReceivePayment.first.customer_sales_tax_code)
  end

  def setup
    ReceivePayment.destroy_all
    qb_hash = {"xml_attributes" => {}, "txn_id" => "53D8CC-1497894805", "time_created" => "2017-06-19T10:53:25-08:00", "time_modified" => "2017-06-19T10:53:26-08:00", "edit_sequence" => "1497894805", "txn_number" => 183946, "customer_ref" => {"xml_attributes" => {}, "list_id" => "80000A86-1376973674", "full_name" => "Qualcomm"}, "ar_account_ref" => {"xml_attributes" => {}, "list_id" => "380000-875338868", "full_name" => "Accounts Receivable"}, "txn_date" => "2017-06-19", "ref_number" => "39011606", "total_amount" => 129786.9, "payment_method_ref" => {"xml_attributes" => {}, "list_id" => "30000-875338872", "full_name" => "Check"}, "deposit_to_account_ref" => {"xml_attributes" => {}, "list_id" => "20000-875338868", "full_name" => "Citi Checking"}, "unused_payment" => 0.0, "unused_credits" => 0.0, "applied_to_txn_ret" => [{"xml_attributes" => {}, "txn_id" => "4F88EC-1485382201", "txn_type" => "Invoice", "txn_date" => "2017-01-25", "ref_number" => "17976", "balance_remaining" => 0.0, "amount" => 30092.13, "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "4D649F-1480583144", "txn_type" => "SalesOrder", "txn_date" => "2016-12-01", "ref_number" => "5224", "link_type" => "AMTTYPE", "amount" => -30092.13}]}, {"xml_attributes" => {}, "txn_id" => "5077E7-1488586662", "txn_type" => "Invoice", "txn_date" => "2017-03-03", "ref_number" => "18089", "balance_remaining" => 0.0, "amount" => 13587.5, "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "4D649F-1480583144", "txn_type" => "SalesOrder", "txn_date" => "2016-12-01", "ref_number" => "5224", "link_type" => "AMTTYPE", "amount" => -13587.5}]}, {"xml_attributes" => {}, "txn_id" => "525DCD-1494132430", "txn_type" => "Invoice", "txn_date" => "2017-05-06", "ref_number" => "18263", "balance_remaining" => 0.0, "amount" => 13582.27, "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "4D649F-1480583144", "txn_type" => "SalesOrder", "txn_date" => "2016-12-01", "ref_number" => "5224", "link_type" => "AMTTYPE", "amount" => -13582.27}]}, {"xml_attributes" => {}, "txn_id" => "525F13-1494133027", "txn_type" => "Invoice", "txn_date" => "2017-05-06", "ref_number" => "18264", "balance_remaining" => 0.0, "amount" => 29105.0, "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "4D64DB-1480583319", "txn_type" => "SalesOrder", "txn_date" => "2016-12-01", "ref_number" => "5225", "link_type" => "AMTTYPE", "amount" => -29105.0}]}, {"xml_attributes" => {}, "txn_id" => "525FF7-1494133488", "txn_type" => "Invoice", "txn_date" => "2017-05-06", "ref_number" => "18265", "balance_remaining" => 0.0, "amount" => 20920.0, "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "4D650D-1480583513", "txn_type" => "SalesOrder", "txn_date" => "2016-12-01", "ref_number" => "5226", "link_type" => "AMTTYPE", "amount" => -20920.0}]}, {"xml_attributes" => {}, "txn_id" => "5260D6-1494133876", "txn_type" => "Invoice", "txn_date" => "2017-05-06", "ref_number" => "18266", "balance_remaining" => 0.0, "amount" => 22500.0, "linked_txn" => [{"xml_attributes" => {}, "txn_id" => "4D653E-1480583668", "txn_type" => "SalesOrder", "txn_date" => "2016-12-01", "ref_number" => "5227", "link_type" => "AMTTYPE", "amount" => -22500.0}]}]}
    ReceivePayment.parse_qb_response(qb_hash)
  end

end

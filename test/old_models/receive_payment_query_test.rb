require 'test_helper'
require 'fixtures/receive_payment_hash'

class ReceivePaymentQueryTest < ActiveSupport::TestCase
  include ReceivePaymentHash

  test "can parse a simple hash" do
    assert_equal(1, ReceivePayment.count, "should equal one")
  end

  test "handles ref types" do
    assert_equal("Check", ReceivePayment.first.payment_method)
    assert_equal("Citi Checking", ReceivePayment.first.deposit_to_account)
  end

  test "updates existing hash" do
    hash = {"txn_id" => "53D8CC-1497894805", "txn_number" => 33, "txn_date" => "2018-06-19", "ref_number" => "10634a",  "total_amount" => 88.99, "memo" => "MEMO", "unused_payment" => 11.11, "unused_credits" => 17.17}
    ReceivePayment.parse_qb_response(hash)
    assert_equal(1, ReceivePayment.count)
    assert_equal(33, ReceivePayment.first.txn_number)
    assert_equal("2018-06-19", ReceivePayment.first.txn_date.iso8601)
    assert_equal("10634a", ReceivePayment.first.ref_number)
    assert_equal(88.99, ReceivePayment.first.total_amount.to_f)
    assert_equal("MEMO", ReceivePayment.first.memo)
    assert_equal(11.11, ReceivePayment.first.unused_payment.to_f)
    assert_equal(17.17, ReceivePayment.first.unused_credits.to_f)
  end

  test "invoices and payments get saved in join table" do
    ids = InvoicesReceivePayment.pluck("receive_payment_id")
    ids.each do |id|
      assert_equal(id, ReceivePayment.first.id)
    end
    assert_equal(6, InvoicesReceivePayment.count)
  end

  test "parses customer reference" do
    assert_equal("Qualcomm", ReceivePayment.first.customer_full_name)
  end

  def setup
    Invoice.destroy_all
    Invoice.create!([{"txn_id" => "4F88EC-1485382201"}, {"txn_id" =>"5077E7-1488586662"}, {"txn_id" => "525DCD-1494132430"}, {"txn_id" => "525F13-1494133027"}, {"txn_id" => "525FF7-1494133488"}, {"txn_id" => "5260D6-1494133876"}])
    ReceivePayment.destroy_all
    ReceivePayment.parse_qb_response(qb_hash)
  end

end

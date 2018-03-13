require 'test_helper'
require 'fixtures/estimate_hash'

class EstimateQueryTest < ActiveSupport::TestCase
  include EstimateHash

  test "can parse a simple hash" do
    assert_equal(1, Estimate.count, "should equal one")
    assert_equal(29, EstimateLine.count, "should parse estimate lines")
  end

  test "can save billing address" do
    assert_equal("Box HQ", Estimate.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    assert_equal("900 Jefferson Road", Estimate.first.ship_addr1, "Ship Address should parse")
  end

  test "handles ref types" do
    assert_equal("ARJ", Estimate.first.sales_rep)
    assert_equal("Custom Estimate", Estimate.first.template)
    assert_equal("SM/CA", Estimate.first.item_sales_tax)
    assert_equal("Tax", Estimate.first.customer_sales_tax_code)
  end
  
  test "updates existing hash" do
    hash = {"txn_id" => "53D7E5-1497890620", "txn_date" => "2018-06-19", "ref_number" => "10634a",  "is_active" => false, "due_date" => "2019-06-19", "sales_tax_percentage" => 19.0, "sales_tax_total" => 100.00, "total_amount" => 100.00, "is_to_be_emailed" => true, "customer_sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "AAA"}}
    Estimate.parse_qb_response(hash)
    assert_equal(1, Estimate.count)
    assert_equal("2018-06-19", Estimate.first.txn_date.iso8601)
    assert_equal("10634a", Estimate.first.ref_number)
    assert_equal(false, Estimate.first.is_active)
    assert_equal("2019-06-19", Estimate.first.due_date.iso8601)
    assert_equal(19.0, Estimate.first.sales_tax_percentage)
    assert_equal(100.00, Estimate.first.sales_tax_total.to_f)
    assert_equal(true, Estimate.first.is_to_be_emailed)
    assert_equal("AAA", Estimate.first.customer_sales_tax_code)
  end

  test "line items have correct foreign key" do
    ids = EstimateLine.pluck("estimate_id").compact
    assert_equal(EstimateLine.count, ids.count)
    assert_not_nil(EstimateLine.first.estimate_id)
    assert_equal(EstimateLine.first.estimate_id, Estimate.first.id)
  end

  test "parses customer reference" do
    assert_equal("Box:Construction:Redwood City", Estimate.first.customer_full_name)
  end
  
  def setup
    Job.destroy_all
    Job.create!({"id" => 2, "list_id" => "80000F95-1427944431", "full_name" => "Box:Construction:Redwood City"})
    EstimateLine.destroy_all
    Estimate.destroy_all
    Estimate.parse_qb_response(qb_hash)
  end

end

require 'test_helper'

class EstimateTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    e = prep({"txn_id" => '222'
             })
    assert_equal(1, Estimate.count, "should equal one")
  end
  
  # TODO
  test "saves customer id" do
    e = prep({"txn_id" => '222',
              "customer_ref" => {
                  "list_id" => "1111",
                  "full_name" => "Test:Testing:P-2"
              }
             })
    assert_equal("1111", e.customer_id, "Estimate should parse customer_ref['list_id'] as customer_id")
  end
  test "saves a bill address with estimate id" do
    BillAddress.destroy_all
    e = prep({"txn_id" => '333',
              "bill_address" => {
                  "xml_attributes" => "some crap",
                  "addr1" => "333 Street"
              }})
    assert_equal("333", BillAddress.first.id, "Bill Address id should match id of estimate hash")
  end
  test "saves a ship address with estimate id" do
    skip
  end
  test "saves an estimate line that is passed in as a Qbsml Hash" do
    skip
  end
  test "saves all estimate lines passed in as an array" do
    skip
  end
  test "estimate ignores ignored types" do
    skip
  end
  test "estimate handles ref type" do
    skip
  end
  test "estimate lines handle ref type" do
    skip
  end
  def prep(hash)
    Estimate.destroy_all
    id = hash["txn_id"]
    e = Estimate.new(:id => id)
    e.parse_hash(hash)
    e.save
    e
  end
end

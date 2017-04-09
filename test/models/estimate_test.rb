require 'test_helper'

class EstimateTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    e = prep({"txn_id" => '222'
             })
    assert_equal(1, Estimate.count, "should equal one")
  end
  
  # TODO
  test "saves customer id" do
    skip
  end
  test "saves a bill address with estimate id" do
    skip
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

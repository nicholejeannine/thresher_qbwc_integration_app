require 'test_helper'

class EstimateTest < ActiveSupport::TestCase
  test "can parse a simple hash" do
    e = prep({"txn_id" => '222',
              "is_active" => 1
             })
    assert_equal(1, Estimate.count, "should equal one")
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

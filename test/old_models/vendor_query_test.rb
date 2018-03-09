require 'test_helper'
require 'fixtures/vendor_hash'

class VendorQueryTest < ActiveSupport::TestCase
  include VendorHash

  test "can parse simple qb response" do
    assert_equal(1, Vendor.count, "should equal one")
    assert_equal("80000C47-1409351820", Vendor.first.list_id)
  end

  test "updates a model when the list id already exists in the database" do
    hash = {"list_id" => "80000C47-1409351820", "name" => "Innovations", "is_active" => 0}
    Vendor.parse_qb_response(hash)
    assert_equal(1, Vendor.count)
    assert_equal("Innovations", Vendor.first.name)
    assert_equal(false, Vendor.first.is_active)
  end
  
  test "Adds a second model when list id does not exist" do
    hash =  {"list_id" => "8", "name" => "Innovations", "is_active" => 1}
    Vendor.parse_qb_response(hash)
    assert_equal(2, Vendor.count)
  end
  
  test "Can parse ref types" do
    assert_equal(1, Vendor.count)
    assert_equal("9715-B Burnet Road, Suite 400", Vendor.first.vendor_addr2)
    assert_equal("Austin", Vendor.first.ship_city)
    assert_equal("Manufacturer", Vendor.first.vendor_type)
    assert_equal("Net 30", Vendor.first.terms)
  end
  
  def setup
    Vendor.destroy_all
    Vendor.parse_qb_response(qb_hash)
  end
end

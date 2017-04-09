require 'test_helper'
class CustomerTest < ActiveSupport::TestCase
  test "customer responds to parse qb response" do
    assert_respond_to Customer, :parse_qb_response
  end
  
  test "can parse simple qb response" do
      Customer.destroy_all
      c = Customer.new(:id => '222')
      c.parse_hash({"list_id" => '222',
                    "is_active" => 1,
                    "sublevel" => 0,
                    "parent_id" => nil,
                    "name" => "Frankie",
                    "full_name" => "Frankie"
                   })
      c.save
    assert_equal(1, Customer.count, "should equal one")
  end
  
  test "can save billing address" do
    Customer.destroy_all
    hash = {"list_id" => '333',
            "bill_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "333 Street"
            }
    }
    c = Customer.new(:id => '333')
    c.parse_hash(hash)
    c.save
    assert_equal("333", BillAddress.first.id, "Bill Address id should match id of customer hash")
  end

  test "can save ship address" do
    Customer.destroy_all
    hash = {"list_id" => '444',
            "ship_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "444 Street"
            }
    }
    c = Customer.new(:id => '444')
    c.parse_hash(hash)
    c.save
    assert_equal("444", ShipAddress.first.id, "Bill Address id should match id of customer hash")
  end
end


# "data_ext_ret"=> [
# {'data_ext_name' => 'Site Contact',
#  'data_ext_value' => 'Frankie Jones'
# },{'data_ext_name' => 'Site Phone',
#    'data_ext_value' => '555=555=5555'
# }, {'data_ext_name' => 'Site Email',
#     'data_ext_value' => 'email.com'
# }]})
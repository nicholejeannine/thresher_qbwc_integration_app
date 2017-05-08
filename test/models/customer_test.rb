require 'test_helper'
class CustomerTest < ActiveSupport::TestCase
  test "customer responds to parse qb response" do
    assert_respond_to Customer, :parse_qb_response
  end
  
  test "can parse simple qb response" do
      c = prep({"list_id" => '222',
                    "is_active" => 1,
                    "sublevel" => 0,
                    "parent_id" => nil,
                    "name" => "Frankie",
                    "full_name" => "Frankie"
                   })
    assert_equal(1, Customer.count, "should equal one")
  end
  
  test "can save billing address" do
    BillAddress.destroy_all
    c = prep({"list_id" => '333',
            "bill_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "333 Street"
            }})
    assert_equal("333", BillAddress.first.id, "Bill Address id should match id of customer hash")
  end

  test "can save ship address" do
    ShipAddress.destroy_all
    c = prep({"list_id" => '444',
            "ship_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "444 Street"
            }})
    assert_equal("444", ShipAddress.first.id, "Bill Address id should match id of customer hash")
    assert_equal("444 Street", ShipAddress.first.addr1, "Bill Address row value should match that of customer hash")
  end
  
  test "can save contact info" do
    Contact.destroy_all
    c = prep({"list_id" => '555',
           "salutation" => "Joe"})
    assert_equal("555", Contact.first.id, "Contact id should match id of customer hash")
    assert_equal("Joe", Contact.first.salutation, "Contact salutation should match salutation value of customer hash")
  end
  
  # TODO
  test "can parse data extensions" do
    c = prep({"list_id" => '33331',
    "data_ext_ret"=> [
      {'data_ext_name' => 'Site Contact',
   'data_ext_value' => 'Frankie Jones'
    },{'data_ext_name' => 'Site Phone',
     'data_ext_value' => '555=555=5555'
    }, {'data_ext_name' => 'Site Email',
    'data_ext_value' => 'email.com'
    }]})
    assert_equal("555=555=5555", Contact.first.site_phone, "Contact phone should be parsed via data extension")
  end

  test "nullifies data extension values when not explicitly defined" do
    Contact.destroy_all
    c = Customer.new(:id => '3331hnjd')
    Contact.create!(:id => '3331hnjd', 'site_contact' => 'not null', 'site_phone' => '33')
    c.parse_hash(:name => 'no data extensions')
    c.save
    assert_nil(Contact.first.site_phone, "Should nullify custom data types that aren't declared")
  end
  
  test "skips skipped types on associated models" do
    skip
  end
  test "handles ref types" do
    skip
  end
  test "handles associated customer/parent object" do
    skip
  end
  
  def prep(hash)
    Customer.destroy_all
    id = hash["list_id"]
    c = Customer.new(:id => id)
    c.parse_hash(hash)
    c.save
    c
  end
end



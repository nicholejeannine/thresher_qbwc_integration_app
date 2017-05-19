require 'test_helper'
class ClientTest < ActiveSupport::TestCase
  test "client responds to parse qb response" do
    assert_respond_to Customer, :parse_customer_response
  end
  
  test "can parse simple qb response" do
      c = prep({"list_id" => '222',
                    "is_active" => 1,
                    "sublevel" => 0,
                    "parent_id" => nil,
                    "full_name" => "Frankie",
                    "salutation" => "Joe"
                   })
    assert_equal(1, Client.count, "should equal one")
  end
  
  test "can save billing address" do
    c = prep({"list_id" => '333',
            "bill_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "333 Street"
            }})
    assert_equal("333 Street", Client.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    c = prep({"list_id" => '444',
            "ship_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "444 Street"
            }})
    assert_equal("444 Street", Client.first.ship_addr1, "Bill Address row value should match that of client hash")
  end
  
  test "can parse data extensions" do
    c = prep({"list_id" => '33331',
    "data_ext_ret"=> [
      {'data_ext_name' => 'Site Contact',
   'data_ext_value' => 'Frankie Jones'
    },{'data_ext_name' => 'Site Phone',
     'data_ext_value' => '555-555-5555'
    }, {'data_ext_name' => 'Site Email',
    'data_ext_value' => 'email.com'
    }]})
    assert_equal("555-555-5555", Client.first.site_phone, "Site phone should be parsed via data extension")
  end

  test "nullifies data extension values when not explicitly defined" do
    c = Client.new(:id => '3331hnjd')
    Client.create!(:id => '3331hnjd', 'site_contact' => 'not null', 'site_phone' => '33')
    c = Client.parse_qb_response(:id => '331hnjd', :full_name => 'no data extensions')
    assert_nil(Client.first.site_phone, "Should nullify custom data types that aren't declared")
  end
  
  test "skips skipped types on associated models" do
    skip
  end
  test "handles ref types" do
    skip
  end
  
  def prep(hash)
    Client.destroy_all
    Client.parse_qb_response(hash)
  end
end



require 'test_helper'
class ClientTest < ActiveSupport::TestCase
  
  test "customer responds to parse customer response" do
    assert_respond_to Customer, :parse_customer_response
  end
  
  test "can parse simple qb response" do
    assert_equal(1, Client.count, "should equal one")
  end
  
  test "can save billing address" do
    assert_equal("333 Street", Client.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do
    assert_equal("444 Street", Client.first.ship_addr1, "Bill Address row value should match that of client hash")
  end
  
  test "can parse data extensions" do
    assert_equal("555-555-5555", Client.first.site_phone, "Site phone should be parsed via data extension")
  end

  test "nullifies data extension values when not explicitly defined" do
    Customer.parse_customer_response({'list_id' => '111-111', 'sublevel' => 0, 'name' => 'Frankie', 'full_name' => 'Frankie'})
    assert_nil(Client.first.site_phone, "Should nullify custom data types that aren't declared")
  end
  
  test "updates a model when the id already exists in the database" do
    Customer.parse_customer_response({'list_id' => '111-111', 'is_active' => 0, 'sublevel' => 0, 'name' => 'FrankieDude', 'full_name' => 'FrankieDude'})
    assert_equal("FrankieDude", Client.first.full_name)
  end
  
  test "inserts a new record when the id is not found" do
    Customer.parse_customer_response({'list_id' => '222-222', 'sublevel' => 0, 'name' => 'another', 'full_name' => 'another'})
    assert_equal(2, Client.count)
  end
  
  test "handles ref types" do
    skip
  end

  private
  # run before every single test.
  setup do
    Client.destroy_all
    qb_customer_hash = {
            "list_id" => '111-111',
            "is_active" => 1,
            "sublevel" => 0,
            "parent_id" => nil,
            "name" => "Frankie",
            "full_name" => "Frankie",
            "salutation" => "Joe",
            "bill_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "333 Street"
            },
            "ship_address" => {
                "xml_attributes" => "some crap",
                "addr1" => "444 Street"
            },
            "data_ext_ret"=> [
                {'data_ext_name' => 'Site Contact',
                 'data_ext_value' => 'Frankie Jones'
                },{'data_ext_name' => 'Site Phone',
                   'data_ext_value' => '555-555-5555'
                }, {'data_ext_name' => 'Site Email',
                    'data_ext_value' => 'email.com'
                }]
          }
    Customer.parse_customer_response(qb_customer_hash)
  end
end



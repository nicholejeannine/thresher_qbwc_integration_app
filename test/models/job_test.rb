require 'test_helper'
class JobTest < ActiveSupport::TestCase
  
  test "job responds to parse customer response" do
    assert_respond_to Customer, :parse_customer_response
  end
  
  test "can parse simple qb response" do
    assert_equal(1, Job.count, "should equal one")
  end
  
  test "can save billing address" do
    assert_equal("333 Street", Job.first.bill_addr1, "Bill Address should parse")
  end
  
  test "can save ship address" do
    assert_equal("444 Street", Job.first.ship_addr1, "Ship Address row value should match that of job hash")
  end
  
  # Test to make sure custom fields are properly parsed and stored.
  test "can parse data extensions" do
    assert_equal("555-555-5555", Job.first.site_phone, "Site phone should be parsed via data extension")
  end
  
  # When a user changes a custom field to a blank value, Quickbooks doesn't send the field to the Web Connector at all (it doesn't even show up as null, it's just not there). Our code should therefore treat NO value as a null value, and update the record in the database.
  test "nullifies data extension values when not explicitly defined" do
    Customer.parse_customer_response({'list_id' => '111-111', 'sublevel' => 1, 'name' => 'Frankie', 'full_name' => 'Frankie'})
    assert_nil(Job.first.site_phone, "Should nullify custom data types that aren't declared")
  end
  
  test "updates a model when the id already exists in the database" do
    Customer.parse_customer_response({'list_id' => '111-111', 'is_active' => 0, 'sublevel' => 1, 'name' => 'FrankieDude', 'full_name' => 'BloobleYank:FrankieDude'})
    assert_equal("BloobleYank:FrankieDude", Job.first.full_name)
  end
  
  test "inserts a new record when the id is not found" do
    Customer.parse_customer_response({'list_id' => '222-222', 'sublevel' => 1, 'name' => 'thing', 'full_name' => 'another:thing'})
    assert_equal(2, Job.count)
  end
  
  # Make sure "reference types" are handled appropriately
  test "handles ref types" do
    assert_equal("Corporate", Job.first.customer_type)
    assert_equal("Net 30", Job.first.terms)
    assert_equal("NJK", Job.first.sales_rep)
    assert_equal("Tax", Job.first.sales_tax_code)
    assert_equal("SC/CA", Job.first.item_sales_tax)
  end
  
  private
  # run before every single test.
  setup do
    Job.destroy_all
    qb_customer_hash = {"list_id" => '111-111', "is_active" => 1, "sublevel" => 1, "name" => "Construction", "full_name" => "BoobleYank:Construction", "salutation" => "Joe", "bill_address" => {"xml_attributes" => "some crap", "addr1" => "333 Street"}, "ship_address" => {"xml_attributes" => "some crap", "addr1" => "444 Street"}, "customer_type_ref" => {"list_id" => 'xxx-33333', "full_name" => "Corporate"}, "terms_ref" => {"list_id" => "897219-87981", "full_name" => "Net 30"}, "sales_rep_ref" => {"list_id" => "yyyy-yyyy", "full_name" => "NJK"}, "sales_tax_code_ref" => {"list_id" => "ihkjkj", "full_name" => "Tax"}, "item_sales_tax_ref" => {"list_id" => "87879-3882", "full_name" => "SC/CA"}, "data_ext_ret"=> [{'data_ext_name' => 'Site Contact', 'data_ext_value' => 'Frankie Jones'}, {'data_ext_name' => 'Site Phone', 'data_ext_value' => '555-555-5555'}, {'data_ext_name' => 'Site Email', 'data_ext_value' => 'email.com'}]}
    Customer.parse_customer_response(qb_customer_hash)
  end
end
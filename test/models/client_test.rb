require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
  test "client responds to parse customer response" do assert_respond_to Customer, :parse_customer_response
  end
  
  test "can parse simple qb response" do assert_equal(1, Client.count, "should equal one")
  end
  
  test "can save billing address" do assert_equal("333 Street", Client.first.bill_addr1, "Bill Address should parse")
  end
  
  test "can save ship address" do assert_equal("444 Street", Client.first.ship_addr1, "Ship Address row value should match that of client hash")
  end
  
  # Test to make sure custom fields are properly parsed and stored.
  test "can parse data extensions" do assert_equal("555-555-5555", Client.first.site_phone, "Site phone should be parsed via data extension")
  end
  
  # When a user changes a custom field to a blank value, Quickbooks doesn't send the field to the Web Connector at all (it doesn't even show up as null, it's just not there). Our code should therefore treat NO value as a null value, and update the record in the database.
  test "nullifies data extension values when not explicitly defined" do
    Customer.parse_customer_response({"xml_attributes" => {}, "list_id" => "80000FB1-1428953665", "time_created" => "2015-04-13T12:34:25-08:00", "time_modified" => "2017-05-04T10:52:21-08:00", "edit_sequence" => "1493920341", "name" => "Slack", "full_name" => "Slack", "is_active" => true, "sublevel" => 0, "company_name" => "Slack", "bill_address" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103"}, "bill_address_block" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "addr4" => "San Francisco, CA 94103"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "addr4" => "San Francisco, CA 94103"}, "ship_to_address" => [{"xml_attributes" => {}, "name" => "Ship To 1", "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103", "default_ship_to" => true}, {"xml_attributes" => {}, "name" => "NYC", "addr1" => "Slack", "addr2" => "428 Broadway", "city" => "New York", "state" => "NY", "postal_code" => "10013", "default_ship_to" => false}], "email" => "payables@slack-corp.com", "additional_contact_ref" => [{"xml_attributes" => {}, "contact_name" => "Main Email", "contact_value" => "payables@slack-corp.com"}], "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "80000014-1468255134", "full_name" => "JCC"}, "balance" => 0.0, "total_balance" => 0.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10E0000-875338870", "full_name" => "SF/CA"}, "job_status" => "None", "preferred_delivery_method" => "None"})
  assert_nil(Client.first.site_phone, "Should nullify custom data types that aren't declared")
  end
  
  test "updates a model when the id already exists in the database" do Customer.parse_customer_response({'list_id' => '111-111', 'is_active' => 0, 'sublevel' => 0, 'name' => 'FrankieDude', 'full_name' => 'FrankieDude'})
  assert_equal("FrankieDude", Client.first.full_name)
  end
  
  test "inserts a new record when the id is not found" do Customer.parse_customer_response({'list_id' => '222-222', 'sublevel' => 0, 'name' => 'another', 'full_name' => 'another'})
  assert_equal(2, Client.count)
  end
  
  # Make sure "reference types" are handled appropriately
  test "handles ref types" do assert_equal("Corporate", Client.first.customer_type)
  assert_equal("Net 30", Client.first.terms)
  assert_equal("NJK", Client.first.sales_rep)
  assert_equal("Tax", Client.first.sales_tax_code)
  assert_equal("SC/CA", Client.first.item_sales_tax)
  end
  
  
  def setup
    Client.destroy_all
    qb_hash = {"xml_attributes" => {}, "list_id" => "80000FB1-1428953665", "time_created" => "2015-04-13T12:34:25-08:00", "time_modified" => "2017-05-04T10:52:21-08:00", "edit_sequence" => "1493920341", "name" => "Slack", "full_name" => "Slack", "is_active" => true, "sublevel" => 0, "company_name" => "Slack", "bill_address" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103"}, "bill_address_block" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "addr4" => "San Francisco, CA 94103"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "addr4" => "San Francisco, CA 94103"}, "ship_to_address" => [{"xml_attributes" => {}, "name" => "Ship To 1", "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103", "default_ship_to" => true}, {"xml_attributes" => {}, "name" => "NYC", "addr1" => "Slack", "addr2" => "428 Broadway", "city" => "New York", "state" => "NY", "postal_code" => "10013", "default_ship_to" => false}], "email" => "payables@slack-corp.com", "additional_contact_ref" => [{"xml_attributes" => {}, "contact_name" => "Main Email", "contact_value" => "payables@slack-corp.com"}], "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "80000014-1468255134", "full_name" => "JCC"}, "balance" => 0.0, "total_balance" => 0.0, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "Tax"}, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10E0000-875338870", "full_name" => "SF/CA"}, "job_status" => "None", "preferred_delivery_method" => "None", "data_ext_ret" => [{"xml_attributes" => {}, "owner_id" => "0", "data_ext_name" => "Site Contact", "data_ext_type" => "STR255TYPE", "data_ext_value" => "Justin Wilson"}, {"xml_attributes" => {}, "owner_id" => "0", "data_ext_name" => "Site Email", "data_ext_type" => "STR255TYPE", "data_ext_value" => "justin@slack-corp.com"}, {"xml_attributes" => {}, "owner_id" => "0", "data_ext_name" => "Site Phone", "data_ext_type" => "STR255TYPE", "data_ext_value" => "650-452-8298"}]}
    Customer.parse_customer_response(qb_hash)
  end
  
  def teardown
    # Do nothing
  end

end
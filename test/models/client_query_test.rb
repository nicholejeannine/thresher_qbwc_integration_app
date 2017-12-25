require 'test_helper'
require 'fixtures/client_hash'

class ClientTest < ActiveSupport::TestCase
  include ClientHash

  test "can parse simple qb response" do
    assert_equal(1, Client.count, "should equal one")
  end
  
  test "can save billing address" do
    assert_equal("Slack", Client.first.bill_addr1, "Bill Address should parse")
  end
  
  test "can save ship address" do
    assert_equal("Slack", Client.first.ship_addr1, "Ship Address row value should match that of client hash")
  end
  
  # Test to make sure custom fields are properly parsed and stored.
  test "can parse data extensions" do
    assert_equal("Justin Wilson", Client.first.site_contact, "Site contact should be parsed via data extension")
    assert_equal("650-452-8298", Client.first.site_phone, "Site phone should be parsed via data extension")
    assert_equal("justin@slack-corp.com", Client.first.site_email, "Site email should be parsed via data extension")
  end
  
  # When a user changes a custom field to a blank value, Quickbooks doesn't send the field to the Web Connector at all (it doesn't even show up as null, it's just not there). Our code should therefore treat NO value as an empty string, and update the record in the database.
  test "nullifies data extension values when not explicitly defined" do
    c = second_client_hash
    Customer.parse_customer_response(c)
    assert_nil(Client.first.site_contact, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_contact.)")
    assert_nil(Client.first.site_phone, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_phone.)")
    assert_nil(Client.first.site_email, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_email.)")
  end
  
  test "updates a model when the full name already exists in the database" do
    c = second_client_hash
    Customer.parse_customer_response(c)
    assert_equal("Slack", Client.first.full_name)
    assert_equal(false, Client.first.is_active)
    assert_equal("AAA", Client.first.sales_rep)
  end
  
  test "inserts a new record when the full name is not found" do
    c = new_client_record
    Customer.parse_customer_response(c)
    assert_equal(2, Client.count)
  end
  
  # Make sure "reference types" are handled appropriately
  test "handles ref types" do
    assert_equal("JCC", Client.first.sales_rep)
    assert_equal("Tax", Client.first.sales_tax_code)
    assert_equal("SF/CA", Client.first.item_sales_tax)
  end
  
  def setup
    Client.destroy_all
    Customer.parse_customer_response(qb_hash)
  end


  


end
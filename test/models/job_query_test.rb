require 'test_helper'
require 'fixtures/job_hash'

class JobQueryTest < ActiveSupport::TestCase
  include JobHash

  test "can parse simple qb response" do
    assert_equal(1, Job.count, "should equal one")
  end
  
  test "can save billing address" do
    assert_equal("1601 Willow Rd", Job.first.bill_addr2, "Bill Address should parse")
  end
  
  test "can save ship address" do
    assert_equal("1105 Hamilton Court", Job.first.ship_addr2, "Ship Address row value should match that of job hash")
  end
  
  # Test to make sure custom fields are properly parsed and stored.
  test "can parse data extensions" do
    assert_equal("Nazareth Vartanian", Job.first.site_contact, "Site contact should be parsed via data extension")
    assert_equal("650-796-2415", Job.first.site_phone, "Site phone should be parsed via data extension")
    assert_equal("nazareth@fb.com", Job.first.site_email, "Site email should be parsed via data extension")
  end
  
  # When a user changes a custom field to a blank value, Quickbooks doesn't send the field to the Web Connector at all (it doesn't even show up as null, it's just not there). Our code should therefore treat NO value as a null value, and update the record in the database.
  test "nullifies data extension values when not explicitly defined" do
    c = second_job_hash
    Customer.parse_customer_response(c)
    assert_nil(Job.first.site_contact, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_contact.)")
    assert_nil(Job.first.site_phone, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_phone.)")
    assert_nil(Job.first.site_email, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_email.)")
  end
  
  test "updates a model when the full name already exists in the database" do
    c = second_job_hash
    Customer.parse_customer_response(c)
    assert_equal("Facebook:Construction", Job.first.full_name)
    assert_equal("Mrs", Job.first.salutation)
    assert_equal("New", Job.first.first_name)
    assert_equal("Person", Job.first.last_name)
  end
  
  test "inserts a new record when the full name is not found" do
    c = new_job_record
    Customer.parse_customer_response(c)
  assert_equal(2, Job.count)
  end
  
  # Make sure "reference types" are handled appropriately
  test "handles ref types" do
    assert_equal("GJM", Job.first.sales_rep)
    assert_equal("Tax", Job.first.sales_tax_code)
    assert_equal("SM/CA", Job.first.item_sales_tax)
  end

  test "parses parent reference" do
    assert_equal("8000061D-1225912979", Job.first.parent_list_id)
  end

  def setup
    Client.destroy_all
    Job.destroy_all
    Client.create!({"id" => 2, "list_id" => "8000061D-1225912979", "full_name" => "Facebook"})
    Customer.parse_customer_response(qb_hash)
  end

end
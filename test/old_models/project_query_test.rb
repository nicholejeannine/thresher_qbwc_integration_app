require 'test_helper'
require 'fixtures/project_hash'

class ProjectQueryTest < ActiveSupport::TestCase
  include ProjectHash

  test "can parse simple qb response" do assert_equal(1, Project.count, "should equal one")
  assert_equal("800016B7-1473444995", Project.first.list_id)
  end

  test "can save billing address" do assert_equal("Advanced Systems Group", Project.first.bill_addr1, "Bill Address should parse")
  end

  test "can save ship address" do assert_equal("Aurora Theatre", Project.first.ship_addr1, "Ship Address row value should match that of client hash")
  end

  # Test to make sure custom fields are properly parsed and stored.
  test "can parse data extensions" do assert_equal("David Van Hoy", Project.first.site_contact, "Site contact should be parsed via data extension")
  assert_equal("415.860.0661", Project.first.site_phone, "Site phone should be parsed via data extension")
  assert_equal("dvh@asgllc.com", Project.first.site_email, "Site email should be parsed via data extension")
  end

  # When a user changes a custom field to a blank value, Quickbooks doesn't send the field to the Web Connector at all (it doesn't even show up as null, it's just not there). Our code should therefore treat NO value as an empty string, and update the record in the database.
  test "nullifies data extension values when not explicitly defined" do c = second_project_hash
  Customer.parse_customer_response(c)
  assert_nil(Project.first.site_contact, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_contact.)")
  assert_nil(Project.first.site_phone, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_phone.)")
  assert_nil(Project.first.site_email, "Custom data types not present in hash should be treated as an empty string. (Failed to nullify site_email.)")
  assert_equal(1, Project.count)
  end

  test "updates a model when the full name already exists in the database" do c = second_project_hash
  Customer.parse_customer_response(c)
  assert_equal("ASG", Project.first.company_name)
  assert_equal("ASG", Project.first.bill_addr1)
  end

  test "does not insert a new record when the full name is not found" do c = new_project_record
  QbwcError.destroy_all
  assert_raise(StandardError, Customer.parse_customer_response(c))
  assert_equal(1, Project.count)
  assert_equal(1, QbwcError.count)
  end

  # Make sure "reference types" are handled appropriately
  test "handles ref types" do assert_equal("BPJ", Project.first.sales_rep)
  assert_equal("Tax", Project.first.sales_tax_code)
  assert_equal("SC/CA", Project.first.item_sales_tax)
  assert_equal(1, Project.count)
  end

  test "parses parent reference" do assert_equal("80000C4C-1409850724", Project.first.parent_list_id)
  end


  def setup
    Client.destroy_all
    Job.destroy_all
    Project.destroy_all
    Client.create!({"id" => 2, "list_id" => "8000061D-1225912979", "full_name" => "ASG"})
    Job.create!({"id" => 22, "list_id" => "80000C4C-1409850724", "name" => "Construction", "full_name" => "ASG:Construction"})
    Project.create!("id" => 2466, "list_id" => nil, "name" => 'P-2466', "full_name" => "ASG:Construction:P-2466")
    \
    Customer.parse_customer_response(qb_hash)
  end

  def teardown
    # Do nothing
  end


end
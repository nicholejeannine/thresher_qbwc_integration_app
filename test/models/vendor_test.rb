require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test "can parse simple qb response" do
    assert_equal(1, Vendor.count, "should equal one")
    assert_equal("80000C47-1409351820", Vendor.first.list_id)
  end

  test "updates a model when the list id already exists in the database" do
    hash = {"list_id" => "80000C47-1409351820", :name => "Innovations", :is_active => false}
    Vendor.parse_qb_response(hash)
    assert_equal(1, Vendor.count)
    assert_equal("Innovations", Vendor.first.name)
    assert_equal(false, Vendor.first.is_active)
  end
  
  test "Adds a second model when list id does not exist" do
    hash =  {"list_id" => "8", :name => "Innovations", :is_active => true}
    Vendor.parse_qb_response(hash)
    assert_equal(2, Vendor.count)
  end
  
  def setup
    Vendor.destroy_all
    qb_hash = {"xml_attributes" => {}, "list_id" => "80000C47-1409351820", "time_created" => "2014-08-29T15:37:00-08:00", "time_modified" => "2017-06-20T10:30:29-08:00", "edit_sequence" => "1492813090", "name" => "Screen Innovations", "is_active" => true, "company_name" => "Screen Innovations", "first_name" => "Brittany", "last_name" => "Delgado", "job_title" => "Sales", "vendor_address" => {"xml_attributes" => {}, "addr1" => "Screen Innovations", "addr2" => "9715-B Burnet Road, Suite 400", "city" => "Austin", "state" => "TX", "postal_code" => "78758"}, "vendor_address_block" => {"xml_attributes" => {}, "addr1" => "Screen Innovations", "addr2" => "9715-B Burnet Road, Suite 400", "addr3" => "Austin, TX 78758"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "Screen Innovations", "addr2" => "9715-B Burnet Road, Suite 400", "city" => "Austin", "state" => "TX", "postal_code" => "78758"}, "phone" => "512.832.6939", "email" => "sales@screeninnovations.com", "additional_contact_ref" => [{"xml_attributes" => {}, "contact_name" => "Main Phone", "contact_value" => "512.832.6939"}, {"xml_attributes" => {}, "contact_name" => "Main Email", "contact_value" => "sales@screeninnovations.com"}], "name_on_check" => "Screen Innovations", "account_number" => "CU18133", "vendor_type_ref" => {"xml_attributes" => {}, "list_id" => "70000-875338872", "full_name" => "Manufacturer"}, "terms_ref" => {"xml_attributes" => {}, "list_id" => "20000-875338872", "full_name" => "Net 30"}, "credit_limit" => 10000.0, "is_vendor_eligible_for1099" => false, "balance" => 2347.67}
    Vendor.parse_qb_response(qb_hash)
  end

end

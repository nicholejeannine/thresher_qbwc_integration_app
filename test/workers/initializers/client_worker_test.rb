require 'test_helper'

class ClientWorkerTest < ActiveSupport::TestCase
  
  # Start with a single customer record with no list_id value
  def setup
    QbwcError.destroy_all
    Client.destroy_all
    sql = "INSERT INTO `Customers`(`list_id`, `Customers_PKEY`, `Cust_CompanyAbr`) VALUES (NULL, 238, 'Slack')"
    ActiveRecord::Base.connection.execute(sql)
  end
  
  test "qb_hashes are correctly classifed as Clients according to their full name" do
    assert_equal('Client', Customer.customer_type(qb_hash_with_full_name_match['full_name']))
    assert_equal('Client', Customer.customer_type(qb_hash_with_no_full_name_match['full_name']))
  end
  
  test "initialize_sync updates existing row when full name matches" do
    assert_equal(1, Client.count) # Make sure our setup method ran
    Client.initialize_sync(qb_hash_with_full_name_match, :Cust_CompanyAbr, qb_hash_with_full_name_match['full_name'])
    assert_equal(1, Client.count)
    assert_equal("4444-4444", Client.first.list_id)
    assert_equal(0, QbwcError.count)
  end
  
  test "initialize sync creates new row when no full name matches" do
    assert_equal(1, Client.count) # Make sure our setup method ran
    Client.initialize_sync(qb_hash_with_no_full_name_match, :Cust_CompanyAbr, qb_hash_with_no_full_name_match['full_name'])
    assert_equal(2, Client.count) # Make sure initialization succeeded
  end
  
  test "creating a new row updates the created at and created by fields" do
    Client.initialize_sync(qb_hash_with_no_full_name_match, :Cust_CompanyAbr, qb_hash_with_no_full_name_match['full_name'])
    assert_equal(2, Client.count)
    assert_equal("QB", Client.last.CreationUser)
    assert_equal(Time.now.to_formatted_s(:short), Client.last.CreationTimeStamp.to_formatted_s(:short))
  end
  
  test "updating a row updates the last modified fields but does not touch created at/by fields" do
    Client.initialize_sync(qb_hash_with_full_name_match, :Cust_CompanyAbr, qb_hash_with_full_name_match['full_name'])
    c = Client.where(:Cust_CompanyAbr => "Slack").first
    assert_equal("QB", c.LastModificationUser)
    assert_equal(Time.now.to_formatted_s(:short), c.LastModificationTimeStamp.to_formatted_s(:short)) # The timestamps won't match on the exact second, so let's just make sure the date part is the same.
    assert_nil(c.CreationUser)
    assert_nil(c.CreationTimeStamp)
  end
  
  
  
  protected
  def qb_hash_with_full_name_match
    {"list_id" => "4444-4444", "full_name" => "Slack"}
  end
  
  def qb_hash_with_no_full_name_match
    {"list_id" => "22-22", "full_name" => "No Match"}
  end


end
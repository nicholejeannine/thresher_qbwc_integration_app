require 'test_helper'

class ProjectWorkerTest < ActiveSupport::TestCase
  
  # Start with a single project record with no list_id value
  def setup
    QbwcError.destroy_all
    Client.destroy_all
    Job.destroy_all
    Project.destroy_all
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `Cust_CompanyAbr`, `list_id`) VALUES (1, 'Facebook', '1111-1111')"
    ActiveRecord::Base.connection.execute(sql)
    sql = "INSERT INTO `Jobs`(`list_id`, `Jobs_PKEY`, `Job_QB_JobName`,`full_name`) VALUES ('2222-2222', 41, 'Construction', 'Facebook:Construction')"
    ActiveRecord::Base.connection.execute(sql)
    sql = "INSERT INTO `Project`(`Project_PKEY`, `FK_Customers_PKEY`, `full_name`) VALUES ('3333', 10, 'Facebook:Construction:P-3333')"
    ActiveRecord::Base.connection.execute(sql)
  end
  
  test "qb_hashes are correctly classifed as Projects according to their full name" do
    assert_equal(Project, Project.customer_type(qb_hash_with_full_name_match['full_name']))
    assert_equal(Project, Project.customer_type(qb_hash_with_no_full_name_match['full_name']))
  end
  
  test "names with lowercase p- are also classified as projects" do
    assert_equal(Project, Project.customer_type("Google:Construction:p-3333"))
  end
  
  test "initialize_sync updates existing row when full name matches" do
    assert_equal(1, Project.count) # Make sure our setup method ran
    Project.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
    assert_equal(1, Job.count)
    assert_equal("4444-4444", Project.first.list_id)
    assert_equal(0, QbwcError.count) # Make sure there are no errors
  end
  
  test "initialize sync creates new row when no full name matches" do
    assert_equal(1, Project.count) # Make sure our setup method ran
    Project.initialize_sync(qb_hash_with_no_full_name_match, :full_name, qb_hash_with_no_full_name_match['full_name'])
    assert_equal(2, Project.count) # Make sure initialization succeeded
    assert_equal(0, QbwcError.count) # Make sure there are no errors
  end
  
  test "creating a new row updates the created at and created by fields" do
    Project.initialize_sync(qb_hash_with_no_full_name_match, :full_name, qb_hash_with_no_full_name_match['full_name'])
    assert_equal(2, Project.count)
    assert_equal("QB", Project.last.CreationUser)
    assert_equal(Time.now.to_formatted_s(:short), Project.last.CreationTimeStamp.to_formatted_s(:short))
  end
  
  test "updating a row updates the last modified fields but does not touch created at/by fields" do
    Project.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
    p = Project.where(:full_name => "Facebook:Construction:P-3333").first
    assert_equal("QB", p.LastModificationUser)
    assert_equal(Time.now.to_formatted_s(:short), p.LastModificationTimeStamp.to_formatted_s(:short)) # The timestamps won't match on the exact second, so let's just make sure the date part is the same.
    assert_nil(p.CreationUser)
    assert_nil(p.CreationTimeStamp)
  end
  
  test "foreign keys are properly updated after save" do
    Project.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
    assert_equal(1, Project.count)
    assert_equal(1, Project.first.FK_Customers_PKEY)
    assert_equal(41, Project.first.FK_Jobs_PKEY)
  end
  #
  # test "duplicate primary key writes error to error table instead of creating new row in the database" do
  #   assert_equal(0, QbwcError.count)
  #   Project.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
  #   Project.initialize_sync(qb_hash_with_duplicate_primary_key, :full_name, qb_hash_with_duplicate_primary_key['full_name'])
  #   assert_equal(1, Project.count)
  #   assert_equal(1, QbwcError.count)
  # end
  
  
  
  protected
  def qb_hash_with_full_name_match
    {"list_id" => "4444-4444", "full_name" => "Facebook:Construction:P-3333"}
  end
  
  def qb_hash_with_no_full_name_match
    {"list_id" => "222-222", "full_name" => "Client:Job1:P-3333"}
  end
  
  def qb_hash_with_duplicate_primary_key
    {"list_id" => "333-333", "full_name" => "ASG:Construction:P-3333", "name" => "P-3333"}
  end

end
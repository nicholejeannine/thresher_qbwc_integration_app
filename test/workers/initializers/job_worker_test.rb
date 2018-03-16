require 'test_helper'

class JobWorkerTest < ActiveSupport::TestCase
  
  # Start with a single customer record with no list_id value
  def setup
    QbwcError.destroy_all
    Client.destroy_all
    Job.destroy_all
    sql = "INSERT INTO `Customers` (`Customers_PKEY`, `Cust_CompanyAbr`) VALUES (13, 'Facebook')"
    ActiveRecord::Base.connection.execute(sql)
    sql = "INSERT INTO `Jobs`(`list_id`, `Jobs_PKEY`, `Job_QB_JobName`,`full_name`) VALUES (NULL, 41, 'Construction', 'Facebook:Construction')"
    ActiveRecord::Base.connection.execute(sql)
  end
  
  test "qb_hashes are correctly classifed as Jobs according to their full name" do
    assert_equal(Job, Job.customer_type(qb_hash_with_full_name_match['full_name']))
    assert_equal(Job, Job.customer_type(qb_hash_with_no_full_name_match['full_name']))
  end
  
  test "initialize_sync updates existing row when full name matches" do
    assert_equal(1, Job.count) # Make sure our setup method ran
    Job.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
    assert_equal(1, Job.count)
    assert_equal("4444-4444", Job.first.list_id)
    assert_equal(0, QbwcError.count) # Make sure there are no errors
  end
  
  test "initialize sync creates new row when no full name matches" do
    assert_equal(1, Job.count) # Make sure our setup method ran
    Job.initialize_sync(qb_hash_with_no_full_name_match, :full_name, qb_hash_with_no_full_name_match['full_name'])
    assert_equal(2, Job.count) # Make sure initialization succeeded
    assert_equal(0, QbwcError.count) # Make sure there are no errors
  end
  
  test "creating a new row updates the created at and created by fields" do
    Job.initialize_sync(qb_hash_with_no_full_name_match, :full_name, qb_hash_with_no_full_name_match['full_name'])
    assert_equal(2, Job.count)
    assert_equal("QB", Job.last.CreationUser)
    assert_equal(Time.now.to_formatted_s(:short), Job.last.CreationTimeStamp.to_formatted_s(:short))
  end
  
  test "updating a row updates the last modified fields but does not touch created at/by fields" do
    Job.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
    j = Job.where(:full_name => "Facebook:Construction").first
    assert_equal("QB", j.LastModificationUser)
    assert_equal(Time.now.to_formatted_s(:short), j.LastModificationTimeStamp.to_formatted_s(:short)) # The timestamps won't match on the exact second, so let's just make sure the date part is the same.
    assert_nil(j.CreationUser)
    assert_nil(j.CreationTimeStamp)
  end
  
  test "foreign keys are properly updated after save" do
    Job.initialize_sync(qb_hash_with_full_name_match, :full_name, qb_hash_with_full_name_match['full_name'])
    Job.initialize_sync(qb_hash_with_job_sublevel_2, :full_name, qb_hash_with_job_sublevel_2['full_name'])
    assert_equal(13, Job.where(:full_name => "Facebook:Construction").first.FK_Customers_PKEY)
    assert_equal(13, Job.where(:full_name => "Facebook:Construction:Bld 40").first.FK_Customers_PKEY)
    assert_nil(Job.where(:full_name => "Facebook:Construction").first.FK_JobID_Parent)
    assert_equal(41, Job.where(:full_name => "Facebook:Construction:Bld 40").first.FK_JobID_Parent)
  end
  
  
  
  protected
  def qb_hash_with_full_name_match
    {"list_id" => "4444-4444", "full_name" => "Facebook:Construction"}
  end
  
  def qb_hash_with_no_full_name_match
    {"list_id" => "4444-4444", "full_name" => "Client:Job1"}
  end
  
  def qb_hash_with_job_sublevel_2
    {"list_id" => "222-222", "name" => "Bld 40", "full_name" => "Facebook:Construction:Bld 40"}
  end


end
class SessionPendingJobsText < ActiveRecord::Migration
  def change
    change_column_default(:qbwc_sessions, :pending_jobs, nil)
    change_column :qbwc_sessions, :pending_jobs, :text, :limit => 1000, :null => false
  end
end

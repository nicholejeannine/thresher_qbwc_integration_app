class Project < ApplicationRecord
  include QuickbooksQueryable
  before_save :titleize_job_status

  def self.new_project(qb)
    begin
      # First try to find by list id
    p =   Project.where(:list_id => qb['list_id'])&.first
    # Then try to find by full name
    p ||= Project.where(:full_name => qb['full_name'])&.first
    # If it's not found, write to error log. If it's found, let it update.
    if p.nil?
      QbwcError.create!(:worker_class => "Project::No Match Found", :model_id => qb['list_id'], :error_message => "No project in the portal matches customer #{qb['full_name']} in Quickbooks")
    else
      p.parse_hash(qb.to_hash)
      p.save
    end
    rescue Exception => e
      QbwcError.create(:worker_class => "Project", :model_id => "#{self.id}", :error_message => "#{e}")
    end
  end
  
  private
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

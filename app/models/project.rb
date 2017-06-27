class Project < ApplicationRecord
  include QuickbooksQueryable
  before_save :titleize_job_status

  def self.new_project(qb)
    begin
    p =   Project.where(:list_id => qb['list_id'])&.first
    p ||= Project.find_or_initialize_by(:full_name => qb['full_name'])
    p.list_id= qb['list_id']
    p.parse_hash(qb.to_hash)
    p.save
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.name}", :model_id => "#{qb['list_id']}", :error_message => "Error parsing response: #{e}")
    end
  end
  
  private
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

class Project < ApplicationRecord
  has_many :timecard_transactions
  has_one :project_full_name, :class_name => 'ProjectFullName'
  before_save :titleize_job_status

  def self.parse_qb_response(qb)
    begin
      # First try to find by list id
      p = Project.find_by("list_id" => qb['list_id'])
      if p.nil?
        p_id = ProjectFullName.find_by("project_full_name" => qb["full_name"])&.project_full_name
        if p_id
          p = Project.new
          p.id = p_id
          p.list_id = qb['list_id']
        end
      end
      if p.nil?
        raise StandardError, "Project Not Found"
      else
        hash = QuickbooksQueryResponse.parse(qb, self, p.id)
        p.update(hash)
      end
    rescue StandardError => e
      QbwcError.create(:worker_class => "Project", :model_id => "#{qb["full_name"]}", :error_message => "#{e}")
    end
  end
  
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

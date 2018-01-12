class Project < ApplicationRecord
  before_save :titleize_job_status

  # FIXME: THIS MUST LOOK AT A THE VIEW OF STUFF IN THE PORTAL
  def self.parse_qb_response(qb)
    begin
      # First try to find by list id
      p = Project.find_by("list_id" => qb['list_id']) || Project.find_by("full_name" => qb["full_name"])
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

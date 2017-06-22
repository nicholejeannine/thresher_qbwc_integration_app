class Project < ApplicationRecord
  include QuickbooksQueryable
  before_save :titleize_job_status

  private
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

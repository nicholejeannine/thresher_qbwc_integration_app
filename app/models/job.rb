class Job < ApplicationRecord
  has_many :timecard_transactions
  before_save :titleize_job_status

  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

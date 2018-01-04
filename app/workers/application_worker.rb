class ApplicationWorker < QBWC::Worker

  def self.last_ran
    convert_time(corresponding_job)
  end

  def self.corresponding_job
    QBWC::ActiveRecord::Job::QbwcJob.where(:name => self.name).first
  end

  def self.convert_time (time)
    time&.updated_at&.localtime&.strftime '%FT%R'
  end

end

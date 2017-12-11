class TimeTrackingAddWorker <  QBWC::Worker

  def handle_response(r, session, job, request, data)
      Rails.logger.warn("\n\n\n")
      Rails.logger.warn("SESSION: #{session}")
      Rails.logger.warn("\n\n\n")
      Rails.logger.warn("JOB: #{job}")
      Rails.logger.warn("\n\n\n")
      Rails.logger.warn("REQUEST: #{request}")
      Rails.logger.warn("\n\n\n")
      Rails.logger.warn("DATA: #{data}")
    begin
      r['time_tracking_ret']&.each{|qb|TimeTracking.parse_qb_response(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.name, :error_message => "#{e.message}")
    end
  end
end

class TimeTrackingAddWorker <  QBWC::Worker

  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    Rails.logger.warn("SESSION: #{session}")
    Rails.logger.warn("JOB: #{job}")
    Rails.logger.warn("REQUEST: #{request}")
    Rails.logger.warn("DATA: #{data}")
  end

end

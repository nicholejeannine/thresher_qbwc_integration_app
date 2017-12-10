class TimeTrackingAddWorker <  QBWC::Worker

  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    # QBWC.delete_job(job)
    r['time_tracking_ret']&.each do |response|
      QbwcHistory.create(:worker_class => "AddTime", :error_message => response)
    end
  end
end

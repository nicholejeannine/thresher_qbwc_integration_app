class TimeTrackingAddWorker <  QBWC::Worker

  def handle_response(r, session, job, request, data)
    begin
    TimeTracking.parse_qb_response(r['time_tracking_ret'])
    rescue StandardError => e
      QbwcError.create(:worker_class => "Time Tracking Add", :error_message => "#{e.backtrace}")
    end
  end
end

class TimeTrackingAddWorker <  QBWC::Worker

  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    QbwcError.create(:worker_class => "Test", :error_message => "#{r['xml_attributes']['iteratorRemainingCount']} remain for job #{job}")
    begin
      r['time_tracking_ret']&.each{|qb|TimeTracking.parse_qb_response(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end


  QBWC.session_complete_success = lambda do |session|
    Rails.logger.warn(session)
    total_time = Time.now - session.began_at
    QbwcHistory.create(:began_at => session.began_at, :ticket => session.ticket, :run_time => total_time, :status_code_id => session.status_code, :status_code_severity => session.status_severity)
  end
end

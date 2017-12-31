class TimeTrackingAddWorker <  QBWC::Worker

  def handle_response(r, session, job, request, data)
    if r['xml_attributes']['statusCode'] == '0'
    begin
    TimeTracking.parse_qb_response(r['time_tracking_ret'])
    timecard = TimecardTransaction.find(data.to_i)
    timecard.tc_status =  "QB Stored"
    timecard.save
    QBWC.delete_job(job)
    rescue StandardError => e
      QbwcError.create(:worker_class => "TimeTrackingAddWorker", :model_id => data, :error_message => "#{e}")
    end
    else
      QbwcError.create(:worker_class => "TimeTrackingAddWorker", :model_id => data, :error_message => "#{r['xml_attributes']['statusMessage']}")
    end
  end
end

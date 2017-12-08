class TimeTrackingQueryWorker <  QBWC::Worker

  def requests(job, session, data)
    [
        {:time_tracking_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    Rails.logger.warn("#{r}")
  end
end

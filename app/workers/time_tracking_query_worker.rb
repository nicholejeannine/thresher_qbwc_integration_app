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
    # handle_response will get customers in groups of 100. When this is 0, we're done.
      r['time_tracking_ret'].each do |response|
        QbwcError.create(:worker_class => self.class.name, :error_message => response)
      end

  end
end

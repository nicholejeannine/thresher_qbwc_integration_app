class TimeTrackingQueryWorker <  QBWC::Worker

  def requests(job, session, data)
    [
        {:time_tracking_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :modified_date_range_filter => {
                :from_modified_date => "2017-06-05"
            }
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      Rails.logger.log(r)
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
 
  end
end

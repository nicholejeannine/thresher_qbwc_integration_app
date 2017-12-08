class TimeTrackingQueryWorker <  QBWC::Worker

  def last_ran
    QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'time_tracking_query').first&.updated_at&.localtime&.strftime '%FT%R'
  end

  def requests(job, session, data)
    [
        {:time_tracking_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :modified_date_range_filter => {
                :from_modified_date => last_ran
            }
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    Rails.logger.warn("#{r}")
  end
end

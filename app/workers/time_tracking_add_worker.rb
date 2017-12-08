class TimeTrackingAddWorker <  QBWC::Worker

  def requests(job, session, data)
     [
         {:time_tracking_add_rq => {
         :time_tracking_add => {
             :txn_date => "2017-12-09",
             :entity_ref => {
                 :full_name => "Klerk, Nichole J"
             },
             :customer_ref => {
                 :full_name => "TCP:IT:P-903"
             },
             :item_service_ref => {
                 :full_name => "Video:0100"
             },
             :duration => "PT8H0M0S",
             :payroll_item_wage_ref => {
                 :full_name => "Hourly Level 1"
             },
             :billable_status => "Billable"
         }
    }}
     ]
  end


  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    QBWC.delete_job(job)
  end
end

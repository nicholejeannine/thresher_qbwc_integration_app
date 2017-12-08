class TimeTrackingAddWorker <  QBWC::Worker

  def requests(job, session, data)
     [
    {:time_tracking_add_rq => {
       :xml_attributes => { :requestID =>1},
       :txn_date => "2017-12-08",
       :entity_ref => {
        :full_name => "Klerk, Nichole"
       },
       :customer_ref => {
        :full_name => "TCP:IT:P-903"
       },
       :duration => "PT8H0M0S",
       :payroll_item_wage_ref => {
        :full_name => "Hourly Level 1"
       },
       :billable_status => "Billable"
     }
     }]
  end


  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    Rails.logger.warn(r)
  end
end

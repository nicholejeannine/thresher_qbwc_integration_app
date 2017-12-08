class TimeTrackingAddWorker < ApplicationWorker

  def requests(job, session, data)
     [
    {:time_tracking_add_rq => {
       :xml_attributes => { :requestID =>1},
       :txn_date => "2017-12-08",
       :entity_ref => {
        :full_name => "Nichole Klerk"
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
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['time_tracking_add_rs']&.each{|qb|Rails.logger.log(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

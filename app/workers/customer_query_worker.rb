class CustomerQueryWorker < QBWC::Worker
  
  def last_ran
    QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_customers').first&.updated_at&.localtime&.strftime '%FT%R'
  end
  
  
  def requests(job, session, data)
    [
        {:customer_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :active_status => "All",
            # :from_modified_date => last_ran,
          :include_ret_element => ['ListID', 'Name', 'FullName', 'Balance', 'TotalBalance']
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['customer_ret']&.each{|qb|QbCustomer.parse_qb_customer_response(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

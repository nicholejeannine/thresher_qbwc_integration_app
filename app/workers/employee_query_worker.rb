class EmployeeQueryWorker < QBWC::Worker

  def requests(job, session, data)
    [
        {:employee_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :active_status => "ActiveOnly",
            :include_ret_element => ['ListID', 'Name', 'IsActive', 'BillingRateRef']
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
  end
end

class ListCustomerWorker < QBWC::Worker

  # def should_run?
  #   true
  # end

  def requests(job, session, data)
    {
        :customer_query_rq => {
            :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
            :max_returned => 100
        }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'

    response['customer_ret'].each do |qb_cus|
      qb_id = qb_cus['list_id']
      qb_name = qb_cus['name']
      Rails.logger.info("#{qb_id} #{qb_name}")
    end
  end

end
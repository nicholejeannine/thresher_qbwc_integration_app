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
     customer = Customer.new
     hash = qb_cus.to_hash
     columns = Customer.column_names
     hash.each do |key, value|
       if columns.include?(key.to_s)
          customer.send("#{key}=", value)
       else
          Rails.logger.info("#{key} not saved to customer")
       end
     end
     customer.save 
      Rails.logger.info(customer)
    
    end
  end

end

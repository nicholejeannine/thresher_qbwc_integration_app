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
    columns = Customer.column_names
    # FIXME: REMOVE destroy_all call when not still figuring this part out!
    # Customer.destroy_all
    response['customer_ret'].each do |qb_cus|
    customer = Customer.find_or_initialize_by(:id => qb_cus['list_id'])
     hash = qb_cus.to_hash
      hash.each do |key, value|
       if columns.include?(key.to_s)
          customer.send("#{key}=", value)
       elsif key.match /ref_$/
         customer.send("#{key.sub('ref_', '')}=", value['list_id'])
       end
     end
     customer.save
     end
  end

end

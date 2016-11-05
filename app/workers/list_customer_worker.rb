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
    Rails.logger.warn("Response:  #{response} \n\n\n\n\n\n\n Session: #{session}    Job:  #{job} \n\n\n\n\n\n\n     Request: #{request} \n\n\n\n\n  Data: #{data}")
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Customer.column_names
    response['customer_ret'].each do |qb_cus|
    customer = Customer.find_or_initialize_by(:id => qb_cus['list_id'])
     # hash = qb_cus.to_hash.gsub('ref_list_id', 'id')
      hash.each do |key, value|
        # If the value is also a hash, let's step into that and get the individual attributes out of it.
        if value.class == Hash

            Rails.logger.warn("We have a hash here:  key #{key} and value #{value}")
            value.keys.each do |k, v|
              phrase = key.remove("ref").remove("ret")
              customer.send("#{phrase}_list_id", key[value]['list_id'])
          end
       elsif columns.include?(key.to_s)
          customer.send("#{key}=", value)
       else
         Rails.logger.error("#{key}: #{value}")
       end
     end
     if customer.save
         Rails.logger.info("great success")
     else
         Rails.logger.info("Not saved:  #{customer.errors}")
     end
  end
 end
end

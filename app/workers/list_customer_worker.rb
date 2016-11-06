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
    response['customer_ret'].each do |qb|
    customer = Customer.find_or_initialize_by(:id => qb['list_id'])
    qb.to_hash.each do |key, value|
      if columns.include?(key.to_s)
        customer.send("#{key}=", value)
      elsif key.match /ref$/
        customer.send("#{key.sub('ref', 'id')}=", value['list_id'])
      elsif key.match /address$/
        customer.send("#{key}_addr1=", value['addr1'])
        customer.send("#{key}_addr2=", value['addr2'])
        customer.send("#{key}_city=", value['city'])
        customer.send("#{key}_state=", value['state'])
        customer.send("#{key}_postal_code=", value['postal_code'])
        customer.send("#{key}_note=", value['note'])
      else
        Rails.logger.info("ERROR SENDING #{key}: #{value}")
      end  # end conditional
    end # end for each pair
     if customer.save
         Rails.logger.info("great success")
     else
         Rails.logger.info("Not saved:  #{customer.errors}")
     end
  end
 end
end

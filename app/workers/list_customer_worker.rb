class ListCustomerWorker < QBWC::Worker

  # def should_run?

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
        # send the message to save the values that can be directly translated into key/value pairs
        if columns.include?(key.to_s)
          customer.send("#{key}=", value)
          # save address types
        elsif key.match /ship_address$|bill_address$|block$/
            customer.send("#{key}_addr1=", value['addr1'])
            customer.send("#{key}_addr2=", value['addr2'])
            customer.send("#{key}_addr3=", value['addr3'])
            customer.send("#{key}_addr4=", value['addr4'])
            customer.send("#{key}_addr5=", value['addr5'])
            # Address blocks don't have city/state/postal)code/country/note
            if key.match /address$/
              customer.send("#{key}_city=", value['city'])
              customer.send("#{key}_state=", value['state'])
              customer.send("#{key}_postal_code=", value['postal_code'])
              customer.send("#{key}_country=", value['country'])
              customer.send("#{key}_note=", value['note'])
            end
        elsif key.match(/parent_ref/)
          customer.send("parent_id=", value['parent_ref']['list_id'])
        elsif key.remove(/_ref$/).match /parent$|customer_type$|terms$|sales_rep$/
          name = key.remove(/_ref$/)
          customer.send("#{name}_id=", value['list_id'])
          customer.send("#{name}_full_name=", value['full_name'])
        end # end if statement
      end # end for each |key, value|
      if customer.save
        Rails.logger.info("saved a customer")
      else
        Rails.logger.info("Not saved:  #{customer.errors}")
      end # end if customer save
    end # end for each customer
  end # end handle response
end # end class
    #     if key.match /xml_attributes/
    #         next
    #     elsif value.class == Qbxml::Hash
    #       value.each  do |k, v|
    #         if k == 'list_id'
    #           name = key.sub(/ref$/, "id")
    #           name.sub!(/ret$/, "id")
    #           customer.send("#{name}=", v)
    #         end  # end if k == 'list_id'
    #       end # end value.each do |k,v|
    #     elsif columns.include?(key.to_s)
    #         customer.send("#{key}=", value)
    #       else
    #         next
    #     end # end if parsing ridiculousness
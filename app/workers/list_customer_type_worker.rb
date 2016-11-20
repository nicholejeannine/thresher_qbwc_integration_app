class ListCustomerTypeWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :customer_type_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get customer_types in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = CustomerType.column_names
    response['customer_type_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      customer_type = CustomerType.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          customer_type.send("#{key}_addr1=", value['addr1'])
          customer_type.send("#{key}_addr2=", value['addr2'])
          customer_type.send("#{key}_addr3=", value['addr3'])
          customer_type.send("#{key}_addr4=", value['addr4'])
          customer_type.send("#{key}_addr5=", value['addr5'])
          customer_type.send("#{key}_city=", value['city'])
          customer_type.send("#{key}_state=", value['state'])
          customer_type.send("#{key}_postal_code=", value['postal_code'])
          customer_type.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              customer_type.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            customer_type.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if customer_type.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{customer_type.errors}")
      end # end if customer_type save
    end # end for each customer_type
  end # end handle response
end # end worker class

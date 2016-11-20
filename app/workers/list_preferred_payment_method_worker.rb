class ListPreferredPaymentMethodWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :preferred_payment_method_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get preferred_payment_methods in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = PreferredPaymentMethod.column_names
    response['preferred_payment_method_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      preferred_payment_method = PreferredPaymentMethod.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          preferred_payment_method.send("#{key}_addr1=", value['addr1'])
          preferred_payment_method.send("#{key}_addr2=", value['addr2'])
          preferred_payment_method.send("#{key}_addr3=", value['addr3'])
          preferred_payment_method.send("#{key}_addr4=", value['addr4'])
          preferred_payment_method.send("#{key}_addr5=", value['addr5'])
          preferred_payment_method.send("#{key}_city=", value['city'])
          preferred_payment_method.send("#{key}_state=", value['state'])
          preferred_payment_method.send("#{key}_postal_code=", value['postal_code'])
          preferred_payment_method.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              preferred_payment_method.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            preferred_payment_method.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if preferred_payment_method.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{preferred_payment_method.errors}")
      end # end if preferred_payment_method save
    end # end for each preferred_payment_method
  end # end handle response
end # end worker class

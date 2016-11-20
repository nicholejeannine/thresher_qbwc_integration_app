klass ListClassWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :class_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get klasss in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Class.column_names
    response['class_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      klass = Class.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          klass.send("#{key}_addr1=", value['addr1'])
          klass.send("#{key}_addr2=", value['addr2'])
          klass.send("#{key}_addr3=", value['addr3'])
          klass.send("#{key}_addr4=", value['addr4'])
          klass.send("#{key}_addr5=", value['addr5'])
          klass.send("#{key}_city=", value['city'])
          klass.send("#{key}_state=", value['state'])
          klass.send("#{key}_postal_code=", value['postal_code'])
          klass.send("#{key}_note=", value['note'])
        elsif value.klass == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              klass.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            klass.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if klass.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{klass.errors}")
      end # end if klass save
    end # end for each klass
  end # end handle response
end # end worker klass

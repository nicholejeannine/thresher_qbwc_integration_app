class ListTermWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :term_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get terms in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Term.column_names
    response['term_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      term = Term.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          term.send("#{key}_addr1=", value['addr1'])
          term.send("#{key}_addr2=", value['addr2'])
          term.send("#{key}_addr3=", value['addr3'])
          term.send("#{key}_addr4=", value['addr4'])
          term.send("#{key}_addr5=", value['addr5'])
          term.send("#{key}_city=", value['city'])
          term.send("#{key}_state=", value['state'])
          term.send("#{key}_postal_code=", value['postal_code'])
          term.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              term.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            term.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if term.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{term.errors}")
      end # end if term save
    end # end for each term
  end # end handle response
end # end worker class

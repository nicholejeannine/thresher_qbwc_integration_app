class ListEstimateLineWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :estimate_line_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get estimate_lines in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = EstimateLine.column_names
    response['estimate_line_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      estimate_line = EstimateLine.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          estimate_line.send("#{key}_addr1=", value['addr1'])
          estimate_line.send("#{key}_addr2=", value['addr2'])
          estimate_line.send("#{key}_addr3=", value['addr3'])
          estimate_line.send("#{key}_addr4=", value['addr4'])
          estimate_line.send("#{key}_addr5=", value['addr5'])
          estimate_line.send("#{key}_city=", value['city'])
          estimate_line.send("#{key}_state=", value['state'])
          estimate_line.send("#{key}_postal_code=", value['postal_code'])
          estimate_line.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              estimate_line.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            estimate_line.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if estimate_line.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{estimate_line.errors}")
      end # end if estimate_line save
    end # end for each estimate_line
  end # end handle response
end # end worker class

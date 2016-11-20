class ListEstimateLineGroupWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :estimate_line_group_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get estimate_line_groups in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = EstimateLineGroup.column_names
    response['estimate_line_group_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      estimate_line_group = EstimateLineGroup.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          estimate_line_group.send("#{key}_addr1=", value['addr1'])
          estimate_line_group.send("#{key}_addr2=", value['addr2'])
          estimate_line_group.send("#{key}_addr3=", value['addr3'])
          estimate_line_group.send("#{key}_addr4=", value['addr4'])
          estimate_line_group.send("#{key}_addr5=", value['addr5'])
          estimate_line_group.send("#{key}_city=", value['city'])
          estimate_line_group.send("#{key}_state=", value['state'])
          estimate_line_group.send("#{key}_postal_code=", value['postal_code'])
          estimate_line_group.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              estimate_line_group.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            estimate_line_group.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if estimate_line_group.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{estimate_line_group.errors}")
      end # end if estimate_line_group save
    end # end for each estimate_line_group
  end # end handle response
end # end worker class

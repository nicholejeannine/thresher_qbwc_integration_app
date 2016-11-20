class ListSalesRepWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :sales_rep_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get sales_reps in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = SalesRep.column_names
    response['sales_rep_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      sales_rep = SalesRep.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          sales_rep.send("#{key}_addr1=", value['addr1'])
          sales_rep.send("#{key}_addr2=", value['addr2'])
          sales_rep.send("#{key}_addr3=", value['addr3'])
          sales_rep.send("#{key}_addr4=", value['addr4'])
          sales_rep.send("#{key}_addr5=", value['addr5'])
          sales_rep.send("#{key}_city=", value['city'])
          sales_rep.send("#{key}_state=", value['state'])
          sales_rep.send("#{key}_postal_code=", value['postal_code'])
          sales_rep.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              sales_rep.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            sales_rep.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if sales_rep.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{sales_rep.errors}")
      end # end if sales_rep save
    end # end for each sales_rep
  end # end handle response
end # end worker class

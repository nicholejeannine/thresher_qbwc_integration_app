class ListEstimateWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :estimate_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
	:include_line_items => false
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get estimates in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Estimate.column_names
    response['estimate_ret'].each do |qb|
      estimate = Estimate.find_or_initialize_by(:id => qb['txn_id'])
      qb.to_hash.each do |key, value|
        if columns.include?(key.to_s)
          estimate.send("#{key}=", value)
            next
        elsif key.match /ship_address$|bill_address$|block$/
            esimate.send("#{key}_addr1=", value['addr1'])
            esimate.send("#{key}_addr2=", value['addr2'])
            esimate.send("#{key}_addr3=", value['addr3'])
            esimate.send("#{key}_addr4=", value['addr4'])
            esimate.send("#{key}_addr5=", value['addr5'])
            # Address blocks don't have city/state/postal)code/country/note
            if key.match /address$/
              esimate.send("#{key}_city=", value['city'])
              esimate.send("#{key}_state=", value['state'])
              esimate.send("#{key}_postal_code=", value['postal_code'])
              esimate.send("#{key}_country=", value['country'])
              esimate.send("#{key}_note=", value['note'])
            end
        elsif key.remove(/_ref$/).match /customer$|template$|terms$|sales_rep$|item_sales_tax$|customer_msg$|customer_sales_tax_code$/
          name = key.remove(/_ref$/)
          estimate.send("#{name}_id=", value['list_id'])
          estimate.send("#{name}_full_name=", value['full_name'])
        end # end if statement
      end # end for each |key, value|
      if estimate.save
        Rails.logger.info("saved a estimate")
      else
        Rails.logger.info("Not saved:  #{estimate.errors}")
      end # end if estimate save
    end # end for each estimate
  end # end handle response
end # end class
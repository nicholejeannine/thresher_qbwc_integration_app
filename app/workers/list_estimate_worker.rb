class ListEstimateWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :estimate_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
	:include_line_items => true
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get estimates in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Estimate.column_names
    response['estimate_ret'].each do |qb|
      estimate_id = qb['txn_id']
      estimate = Estimate.find_or_initialize_by(:id => estimate_id)
      estimate['estimate_line_ret'].each do |line|
          estimate_line = EstimateLine.find_or_initialize_by(:id => line['txn_line_id'])
          estimate_line.send("estimate_id=", estimate_id)
          if estimate_line.save
            Rails.logger.info("saved an estimate line")
          else
            Rails.logger.info("#{EstimateLine.errors}")
          end # end if estimate_line.save
      end # end each estimate line
      qb.to_hash.each do |key, value|
        if columns.include?(key.to_s)
          estimate.send("#{key}=", value)
            next
        elsif key.match /ship_address$|bill_address$|block$/
            estimate.send("#{key}_addr1=", value['addr1'])
            estimate.send("#{key}_addr2=", value['addr2'])
            estimate.send("#{key}_addr3=", value['addr3'])
            estimate.send("#{key}_addr4=", value['addr4'])
            estimate.send("#{key}_addr5=", value['addr5'])
            # Address blocks don't have city/state/postal)code/country/note
            if key.match /address$/
              estimate.send("#{key}_city=", value['city'])
              estimate.send("#{key}_state=", value['state'])
              estimate.send("#{key}_postal_code=", value['postal_code'])
              estimate.send("#{key}_country=", value['country'])
              estimate.send("#{key}_note=", value['note'])
            end
        elsif key.remove(/_ref$/).match /customer$|template$|terms$|sales_rep$|item_sales_tax$|customer_msg$|customer_sales_tax_code$/
          name = key.remove(/_ref$/)
          estimate.send("#{name}_id=", value['list_id'])
          estimate.send("#{name}_full_name=", value['full_name'])
        end # end if statement
      end # end for each |key, value|
      if estimate.save
        Rails.logger.info("saved an estimate")
      else
        Rails.logger.info("Not saved:  #{estimate.errors}")
      end # end if estimate save
    end # end for each estimate
  end # end handle response
end # end class
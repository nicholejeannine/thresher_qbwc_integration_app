class ListEstimateWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :estimate_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  # There's no way this will work yet but .... getting there hopefully
  def handle_response(response, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Estimate.column_names
    response['estimate_ret'].each do |qb|
    estimate = Estimate.find_or_initialize_by(:id => qb['txn_id'])
      qb.to_hash.each do |key, value|
       if columns.include?(key.to_s)
          estimate.send("#{key}=", value)
        elsif key.match /ref$/
         estimate.send("#{key.sub('ref', 'id')}=", "#{value['list_id']}")
       elsif key.match /address$/
         estimate.send("#{key}_addr1=", "#{value['addr1']}")
         estimate.send("#{key}_addr2=", "#{value['addr2']}")
         estimate.send("#{key}_city=", "#{value['city']}")
         estimate.send("#{key}_state=", "#{value['state']}")
         estimate.send("#{key}_postal_code=", "#{value['postal_code']}")
         estimate.send("#{key}_note=", "#{value['note']}")
       else
         Rails.logger.info("ERROR SENDING #{key}: #{value}")
        end  # end conditional
       end # end for each pair
      if estimate.save
         Rails.logger.info("great success")
      else
         Rails.logger.info(estimate.errors)
      end # end conditional
     end # end for each response item
  end # end method

end

class ListPriceLevelWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :price_level_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get price_levels in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = PriceLevel.column_names
    response['price_level_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      price_level = PriceLevel.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          price_level.send("#{key}_addr1=", value['addr1'])
          price_level.send("#{key}_addr2=", value['addr2'])
          price_level.send("#{key}_addr3=", value['addr3'])
          price_level.send("#{key}_addr4=", value['addr4'])
          price_level.send("#{key}_addr5=", value['addr5'])
          price_level.send("#{key}_city=", value['city'])
          price_level.send("#{key}_state=", value['state'])
          price_level.send("#{key}_postal_code=", value['postal_code'])
          price_level.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              price_level.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            price_level.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if price_level.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{price_level.errors}")
      end # end if price_level save
    end # end for each price_level
  end # end handle response
end # end worker class

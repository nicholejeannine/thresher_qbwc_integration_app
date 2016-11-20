class ListDataExtWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :data_ext_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get data_exts in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = DataExt.column_names
    response['data_ext_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      data_ext = DataExt.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          data_ext.send("#{key}_addr1=", value['addr1'])
          data_ext.send("#{key}_addr2=", value['addr2'])
          data_ext.send("#{key}_addr3=", value['addr3'])
          data_ext.send("#{key}_addr4=", value['addr4'])
          data_ext.send("#{key}_addr5=", value['addr5'])
          data_ext.send("#{key}_city=", value['city'])
          data_ext.send("#{key}_state=", value['state'])
          data_ext.send("#{key}_postal_code=", value['postal_code'])
          data_ext.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              data_ext.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            data_ext.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if data_ext.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{data_ext.errors}")
      end # end if data_ext save
    end # end for each data_ext
  end # end handle response
end # end worker class

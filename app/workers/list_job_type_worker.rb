class ListJobTypeWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :job_type_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get job_types in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = JobType.column_names
    response['job_type_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      job_type = JobType.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          job_type.send("#{key}_addr1=", value['addr1'])
          job_type.send("#{key}_addr2=", value['addr2'])
          job_type.send("#{key}_addr3=", value['addr3'])
          job_type.send("#{key}_addr4=", value['addr4'])
          job_type.send("#{key}_addr5=", value['addr5'])
          job_type.send("#{key}_city=", value['city'])
          job_type.send("#{key}_state=", value['state'])
          job_type.send("#{key}_postal_code=", value['postal_code'])
          job_type.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              job_type.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            job_type.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if job_type.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{job_type.errors}")
      end # end if job_type save
    end # end for each job_type
  end # end handle response
end # end worker class

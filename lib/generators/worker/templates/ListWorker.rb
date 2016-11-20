class List<%=name.classify%>Worker < QBWC::Worker

  def requests(job, session, data)
    {
      :<%= name.underscore %>_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get <%=name.underscore%>s in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = <%=name.classify%>.column_names
    response['<%=name.underscore%>_ret'].each do |qb|
      id = qb['list_id'] || qb['txn_id']
      <%=name.underscore%> = <%=name.classify%>.find_or_initialize_by(:id => id)
      qb.to_hash.each do |key, value|
        if key.match /block$|xml_attributes/
            next
        elsif key.match /ship_address$|bill_address$/
          <%=name.underscore%>.send("#{key}_addr1=", value['addr1'])
          <%=name.underscore%>.send("#{key}_addr2=", value['addr2'])
          <%=name.underscore%>.send("#{key}_addr3=", value['addr3'])
          <%=name.underscore%>.send("#{key}_addr4=", value['addr4'])
          <%=name.underscore%>.send("#{key}_addr5=", value['addr5'])
          <%=name.underscore%>.send("#{key}_city=", value['city'])
          <%=name.underscore%>.send("#{key}_state=", value['state'])
          <%=name.underscore%>.send("#{key}_postal_code=", value['postal_code'])
          <%=name.underscore%>.send("#{key}_note=", value['note'])
        elsif value.class == Qbxml::Hash
          value.each  do |k, v|
            if k == 'list_id' || k == 'txn_id'
              name = key.sub(/ref$/, "id")
              name.sub!(/ret$/, "id")
              <%=name.underscore%>.send("#{name}=", v)
            end  # end if k == 'list_id' || k == 'txn_id'
          end # end value.each do |k,v|
        elsif columns.include?(key.to_s)
            <%=name.underscore%>.send("#{key}=", value)
        end # end if parsing ridiculousness
      end # end for each |key, value|
      if <%=name.underscore%>.save
        Rails.logger.info("great success")
      else
        Rails.logger.info("Not saved:  #{<%=name.underscore%>.errors}")
      end # end if <%=name.underscore%> save
    end # end for each <%=name.underscore%>
  end # end handle response
end # end worker class

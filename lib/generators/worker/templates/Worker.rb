class <%= name %>Worker < QBWC::Worker

  def requests(job, session, data)
    {
      :<%= name.underscore %>_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    #return if complete
    response['<%=name.underscore%>_ret'].each do |qb|
      qb_id = qb['list_id']
      @<%=name.underscore%> = <%=name.camelize%>.find_or_create('list_id' => qb_id)
      # qb_name = qb['name']
      Rails.logger.info("<%=name.camelize%>: #{qb_id}")
    end
  end
end
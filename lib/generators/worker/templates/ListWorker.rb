class <%= name %>ListWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :<%= name.underscore %>_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  # There's no way this will work yet but .... getting there hopefully
  def handle_response(response, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    #return if complete
    response['<%=name.underscore%>_ret'].each do |qb|
      @<%=name.underscore%> = <%=name.camelize%>.find_or_create_by(':list_id' => qb['list_id'], qb.from_qbxml)
      Rails.logger.info("<%=name.camelize%>: #{qb}")
      Rails.logger.error(@<%=name.underscore%>.errors) if @<%=name.underscore%>.errors?
    end
  end
end
class <%=name.classify%>QueryWorker < QBWC::Worker

include QueryResponseHandler

  def requests(job, session, data)
    {
      :<%=name.underscore%>_query_rq => {
        :xml_attributes => { "requestID" =>"1", "iterator"  => "Start" },
        :max_returned => 100,
        :active_status => "All",
        #:from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => '<%=name.underscore%>_query').first.updated_at.localtime.strftime '%FT%R'}"
      }
    }
  end
end
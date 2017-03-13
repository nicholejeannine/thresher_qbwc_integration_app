class EstimateQueryWorker < QBWC::Worker

  include QueryResponseHandler

  def requests(job, session, data)
    {
      :estimate_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
         :modified_date_range_filter => {
       #  :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_estimates').first.updated_at.localtime.strftime '%FT%R'}"
         :from_modified_date => "2012-01-08T08:14",
         :to_modified_date => "2012-03-01T08:14"
          },
	 :include_line_items => true
      }
    }
  end
end # end class

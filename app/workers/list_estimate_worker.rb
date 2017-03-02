class ListEstimateWorker < QBWC::Worker

  include QbTxnTypeWorker


  # def should_run?

  def requests(job, session, data)
    {
      :estimate_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
       #  :modified_date_range_filter => {
       #  :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_estimates').first.updated_at.localtime.strftime '%FT%R'}"
       # },
	      :include_line_items => true,
        :owner_id => 0
      }
    }
  end

    # handle response method is part of QbTxnTypeWorker concern
end # end class
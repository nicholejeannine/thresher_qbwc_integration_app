class EstimateQueryWorker < QBWC::Worker

  include QueryTxnTypeHandler


  # def should_run?

  def requests(job, session, data)
    {
      :estimate_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
         :modified_date_range_filter => {
       #  :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_estimates').first.updated_at.localtime.strftime '%FT%R'}"
         :from_modified_date => "2017-02-28T08:14",
          },
	      :include_line_items => true,
        :include_linked_txns => true,
        :owner_id => 0
      }
    }
  end

    # handle response method is part of QueryTxnTypeHandler concern
end # end class

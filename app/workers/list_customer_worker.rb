class ListCustomerWorker < QBWC::Worker

  include QbListTypeWorker

  def requests(job, session, data)
    {
      :customer_query_rq => {
          :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
        :active_status => 'All',
          #:from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_customers').first.updated_at.localtime.strftime '%FT%R'}"
        :from_modified_date => "2017-02-23T08:14",
        :owner_id => 0
      }
    }
  end

	# see QbListTypeWorker for handle_response method

end # end class


class CustomerQueryWorker < QBWC::Worker

  include QueryListTypeHandler

  def requests(job, session, data)
    {
      :customer_query_rq => {
          :xml_attributes => { "requestID" =>1, "iterator"  => "Start" },
        :max_returned => 100,
        :active_status => "All",
          :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'customer_query').first.updated_at.localtime.strftime '%FT%R'}",
        # :from_modified_date => "2017-02-23T08:14",
        :owner_id => 0
      }
    }
  end

	# see QueryListTypeHandler for handle_response method

end # end class

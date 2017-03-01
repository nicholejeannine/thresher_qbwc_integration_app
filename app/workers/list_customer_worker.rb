class ListCustomerWorker < QBWC::Worker

  include QbListTypeWorker

  # def should_run?

  def requests(job, session, data)
    {
      :customer_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
        :active_status => 'All',
#:from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_customers').first.updated_at.localtime.strftime '%FT%R'}",
        :owner_id => 0
      }
    }
  end

  # handle response method is part of QbListTypeWorker concern
end # end class
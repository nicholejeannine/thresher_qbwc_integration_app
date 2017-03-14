class ReceivePaymentQueryWorker < QBWC::Worker

include QueryResponseHandler

  def requests(job, session, data)
    {
      :receive_payment_query_rq => {
        :xml_attributes => { "requestID" =>"1", "iterator"  => "Start" },
        :max_returned => 100,
        :modified_date_range_filter => {
            #  :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_estimates').first.updated_at.localtime.strftime '%FT%R'}"
            :from_modified_date => "2017-01-08T08:14",
            :to_modified_date => "2017-02-11T08:14"
        }
    }
    }
  end
end
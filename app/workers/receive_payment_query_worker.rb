class ReceivePaymentQueryWorker < QBWC::Worker

include QueryResponseHandler

  def requests(job, session, data)
    {
      :receive_payment_query_rq => {
    :xml_attributes => { "requestID" =>"1", "iterator"  => "Start" },
    :max_returned => 100,
    :modified_date_range_filter => {
        #:from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'receive_payment_query').first.updated_at.localtime.strftime '%FT%R'}"
    },
    :include_line_items => true
    
}
}
end
end
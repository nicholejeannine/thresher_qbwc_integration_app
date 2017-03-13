class PurchaseOrderQueryWorker < QBWC::Worker

  include QueryResponseHandler

  # def should_run?

  def requests(job, session, data)
    {
      :purchase_order_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
        :modified_date_range_filter => {
          #   :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_purchase_orders').first.updated_at.localtime.strftime '%FT%R'}"
          :from_modified_date => "2017-03-01T08:14"
        },
        :include_line_items => true,
        :owner_id => 0
      }
    }
  end


end # end class

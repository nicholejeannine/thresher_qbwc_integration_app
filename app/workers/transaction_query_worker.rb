class TransactionQueryWorker < QBWC::Worker
  
  def requests(job, session, data)
    
    {:transaction_query_rq => {
        :xml_attributes => { :requestID =>1, :iterator  => "Start" },
        :max_returned => 100,
        :transaction_modified_date_range_filter => {
            :from_modified_date => "2016-06-23T10:07"
        },
        :transaction_detail_level_filter => "All"
    }
    }
  end
  
  
  
  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    Rails.logger.info(r)
  end
end


class EntityQueryWorker < QBWC::Worker
  
  def requests(job, session, data)
    
        {:entity_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :active_status => "All"
        }
        }
  end
  
  
  
  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['customer_ret']&.each{|qb|Customer.parse_customer_response(qb)}
      r['vendor_ret']&.each{|qb|Vendor.parse_qb_response(qb)}
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  
  end
end


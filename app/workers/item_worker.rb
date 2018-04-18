class ItemWorker < QBWC::Worker
  
  def requests(job, session, data)
    {:item_query_rq => {
        :xml_attributes => {:iterator  => "Start" },
        :max_returned => 100,
        :active_status => "All",
        # :include_ret_element => ['ListID', 'Name', 'FullName', 'BarCodeValue', 'IsActive'],
    }
    }
  end
  
  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['item_non_inventory_ret']&.each{|qb|Rails.logger.warn(qb)}
      r['item_inventory_ret']&.each{|qb|Rails.logger.warn(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

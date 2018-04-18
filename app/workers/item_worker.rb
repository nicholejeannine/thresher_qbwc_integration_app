class ItemWorker < QBWC::Worker
  
  def requests(job, session, data)
    {
    
    }
  end
  
  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

class Initializers::ClientWorker < QBWC::Worker
  
  PORTAL_MATCHING_FIELD = :Cust_CompanyAbr
  QB_MATCHING_FIELD = 'full_name'
  
  def requests(job, session, data)
    {:customer_query_rq => {
        :xml_attributes => {:requestID => 1, :iterator => "Start"},
        :max_returned => 100,
        :active_status => "All",
        :include_ret_element => ['ListID', 'FullName', 'IsActive', 'CompanyName', 'Salutation', 'FirstName', 'MiddleName', 'LastName', 'BillAddress', 'ShipAddress', 'Phone', 'AltPhone', 'Fax', 'Email', 'Cc', 'AdditionalContactRef', 'SalesRepRef', 'TotalBalance', 'DataExtRet'], :owner_id => 0
    }
  }
  end
  
  def handle_response(r, session, job, request, data) # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['customer_ret']&.each {|qb|
        if Customer.customer_type(qb['full_name']) == Client
          Client.initialize_sync(qb, PORTAL_MATCHING_FIELD, qb[QB_MATCHING_FIELD])
        end
      }
      QBWC.delete_job(job) if complete
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end


end

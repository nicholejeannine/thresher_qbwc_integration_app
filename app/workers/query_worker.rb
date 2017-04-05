class QueryWorker < QBWC::Worker
  def last_ran
    QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'query').first&.updated_at&.localtime&.strftime '%FT%R'
  end
  def requests(job, session, data)
	[
	{:customer_query_rq => {
	    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
	    :max_returned => 100,
	    :active_status => "All",
	    :from_modified_date => last_ran,
	     :include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'Name', 'FullName', 'IsActive', 'ParentRef', 'Sublevel', 'CompanyName', 'Salutation', 'FirstName', 'MiddleName', 'LastName', 'JobTitle', 'BillAddress', 'ShipAddress','Phone', 'AltPhone', 'Fax', 'Email', 'Cc', 'Contact', 'AltContact', 'CustomerTypeRef', 'TermsRef', 'SalesRepRef', 'Balance', 'TotalBalance', 'SalesTaxCodeRef', 'ItemSalesTaxRef', 'AccountNumber', 'JobStatus', 'JobStartDate', 'JobProjectedEndDate', 'JobEndDate', 'JobDesc', 'JobTypeRef', 'PreferredDeliveryMethod', 'DataExtRet'],
	    :owner_id => 0
	    }
	   },
	    {:estimate_query_rq => {
	    	  :xml_attributes => { :requestID =>1, :iterator  => "Start" },
	   	  :max_returned => 100,
	   	  :modified_date_range_filter => {
	    	    :from_modified_date => last_ran,
	    	  },
	   	  :include_line_items => true,
	    	}
		  },
		  {:sales_order_query_rq => {
		    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
		    :max_returned => 100,
		    :modified_date_range_filter => {
		      :from_modified_date => last_ran
                   },
		    :include_line_items => true
		  }
		  },		  {:purchase_order_query_rq => {
		    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
		    :max_returned => 100,
		    :modified_date_range_filter => {
		  	:from_modified_date => last_ran,
		    },
		    :include_line_items => true
		  }
		  },
		  {:invoice_query_rq => {
		    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
		    :max_returned => 100,
		    :modified_date_range_filter => {
		      :from_modified_date => last_ran,
		    },
		    :include_line_items => true
		  }
		}]
	end


	def handle_response(r, session, job, request, data)
        # handle_response will get customers in groups of 100. When this is 0, we're done.
		complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
		begin
		  r['customer_ret']&.each{|qb|Customer.parse_qb_response(qb)}
          r['estimate_ret']&.each{|qb|Estimate.parse_qb_response(qb)}
          r['sales_order_ret']&.each{|qb|SalesOrder.parse_qb_response(qb)}
          r['purchase_order_ret']&.each{|qb|PurchaseOrder.parse_qb_response(qb)}
          r['invoice_ret']&.each{|qb|Invoice.parse_qb_response(qb)}
		rescue Exception => e
		  QbwcError.create(:worker_class => self.class.name, :error_message => e)
		end

	end
end

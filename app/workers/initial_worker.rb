class InitialWorker < QBWC::Worker

	def requests(job, session, data)
	[
	 {:customer_query_rq => {
	     :xml_attributes => { :requestID =>1, :iterator  => "Start" },
	     :max_returned => 100,
	     :active_status => "All",
	     :owner_id => 0
	     }
	    },
	 {:vendor_query_rq => {
			 :xml_attributes => { :requestID =>1, :iterator  => "Start" },
			 :max_returned => 100,
			 :active_status => "All"
	 }
	 },
	     {:estimate_query_rq => {
	     	  :xml_attributes => { :requestID =>1, :iterator  => "Start" },
	    	  :max_returned => 100,
	    	  :include_line_items => true,
	    	  :include_linked_txns => false
	     	}
	 	  },
	 	  {:sales_order_query_rq => {
	 	    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
	 	    :max_returned => 100,
	 	    :include_line_items => true,
	 	    :include_linked_txns => false
	 	  }
	 	  },
		  {:purchase_order_query_rq => {
		    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
		    :max_returned => 50,
		    :include_line_items => true,
		    :include_linked_txns => false
		  }
		  },
		  {:invoice_query_rq => {
		    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
		    :max_returned => 100,
		    :include_line_items => true,
		    :include_linked_txns => true
		  }
		  },
		    {:receive_payment_query_rq => {
				    :xml_attributes => { :requestID =>1, :iterator  => "Start" },
				    :max_returned => 100,
				    :include_line_items => true
		    }
		    },
	    {:employee_query_rq => {
			 :active_status => "All",
			 :from_modified_date => last_ran,
	  :include_ret_element => ['ListID', 'Name', 'IsActive', 'FirstName', 'MiddleName', 'LastName']
			 }
	}]
	end


  def handle_response(r, session, job, request, data)
  # handle_response will get customers in groups of 100. When this is 0, we're done.
		 complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
		 begin
			 r['customer_ret']&.each{|qb|Customer.parse_customer_response(qb)}
			 r['vendor_ret']&.each{|qb|Vendor.parse_qb_response(qb)}
			 r['estimate_ret']&.each{|qb|Estimate.parse_qb_response(qb)}
			 r['sales_order_ret']&.each{|qb|SalesOrder.parse_qb_response(qb)}
			 r['purchase_order_ret']&.each{|qb|PurchaseOrder.parse_qb_response(qb)}
			 r['invoice_ret']&.each{|qb|Invoice.parse_qb_response(qb)}
		   r['receive_payment_ret']&.each{|qb|ReceivePayment.parse_qb_response(qb)}
			 r['employee_ret']&.each{|qb|QbEmployee.parse_qb_response(qb)}
		 rescue StandardError => e
		   QbwcError.create(:worker_class => self.class.name, :error_message => e)
		 end

  end
end

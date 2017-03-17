class QueryWorker < QBWC::Worker

		def self.last_ran
			(QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'query').first&.updated_at || Time.now)&.localtime&.strftime '%FT%R'
		end

		def self.queries
		client_request = {:customer_query_rq => {
				:xml_attributes => { :requestID =>1, :iterator  => "Start" },
				:max_returned => 100,
				:active_status => "All",
				:from_modified_date =>last_ran,
				:include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'FullName', 'IsActive', 'CompanyName', 'CustomerTypeRef', 'TermsRef', 'SalesRepRef', 'TotalBalance', 'SalesTaxCodeRep', 'ItemSalesTaxRef', 'AccountNumber', 'PreferredDeliveryMethod'],
				:owner_id => 0
		}
		}
		job_request =  {:customer_query_rq => {
				:xml_attributes => { :requestID =>1, :iterator  => "Start" },
				:max_returned => 100,
				:active_status => "All",
				:from_modified_date => last_ran,
				:name_filter => {
						:match_criterion => 'Contains',
						:name => ':'
				},
				:include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'Name', 'FullName', 'IsActive', 'ParentRef', 'Sublevel', 'JobStatus', 'JobStartDate', 'JobEndDate', 'JobProjectedEndDate', 'JobEndDate', 'JobDesc', 'JobTypeRef']
		}
		}

		project_request =  {:customer_query_rq => {
				:xml_attributes => { :requestID =>1, :iterator  => "Start" },
				:max_returned => 100,
				:active_status => "All",
				:from_modified_date => last_ran,
				:name_filter => {
						:match_criterion => 'StartsWith',
						:name => 'P-'
				},
				:include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'Name', 'FullName', 'IsActive', 'ParentRef']
		}
		}

		estimate_request = {
				:estimate_query_rq => {
						:xml_attributes => { :requestID =>1, :iterator  => "Start" },
						:max_returned => 100,
						:modified_date_range_filter => {
								:from_modified_date => last_ran
						},
						:include_line_items => true
				}
		}

		sales_order_request = {
				:sales_order_query_rq => {
						:xml_attributes => { :requestID =>1, :iterator  => "Start" },
						:max_returned => 100,
						:modified_date_range_filter => {
								:from_modified_date => last_ran
						},
						:include_line_items => true
				}
		}

		purchase_order_request = {
				:purchase_order_query_rq => {
						:xml_attributes => { :requestID =>1, :iterator  => "Start" },
						:max_returned => 100,
						:modified_date_range_filter => {
								:from_modified_date => last_ran
						},
						:include_line_items => true
				}
		}
		invoice_request =  {
				:invoice_query_rq => {
						:xml_attributes => { :requestID =>1, :iterator  => "Start" },
						:max_returned => 100,
						:modified_date_range_filter => {
								:from_modified_date => last_ran
						},
						:include_line_items => true
				}
		}
		 [client_request, job_request, project_request, estimate_request, sales_order_request, purchase_order_request, invoice_request]
		end

		def requests
			queries
		end


	def handle_response(r, session, job, request, data)
		QbwcError.create(:worker_class => self.class.name, :error_message => data)
	end
end
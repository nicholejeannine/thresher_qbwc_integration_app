class QueryWorker < QBWC::Worker

		def last_ran
			'2017-03-06 08:18:12'
			# QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'query').first&.updated_at&.localtime&.strftime '%FT%R'
		end

	def	requests(job, session, data)
			[{:customer_query_rq => {
					:xml_attributes => { :requestID =>1, :iterator  => "Start" },
					:max_returned => 100,
					:active_status => "All",
					:from_modified_date =>last_ran,
					:include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'FullName', 'IsActive', 'CompanyName', 'CustomerTypeRef', 'TermsRef', 'SalesRepRef', 'TotalBalance', 'SalesTaxCodeRep', 'ItemSalesTaxRef', 'AccountNumber', 'PreferredDeliveryMethod'],
					:owner_id => 0
			}
			 },
			 {:customer_query_rq => {
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
			 },
			 {:customer_query_rq => {
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
			 },
			 {
					 :estimate_query_rq => {
							 :xml_attributes => { :requestID =>1, :iterator  => "Start" },
							 :max_returned => 100,
							 :modified_date_range_filter => {
									 :from_modified_date => last_ran
							 },
							 :include_line_items => true
					 }
			 },
			 {
					 :sales_order_query_rq => {
							 :xml_attributes => { :requestID =>1, :iterator  => "Start" },
							 :max_returned => 100,
							 :modified_date_range_filter => {
									 :from_modified_date => last_ran
							 },
							 :include_line_items => true
					 }
			 },
			 {
					 :purchase_order_query_rq => {
							 :xml_attributes => { :requestID =>1, :iterator  => "Start" },
							 :max_returned => 100,
							 :modified_date_range_filter => {
									 :from_modified_date => last_ran
							 },
							 :include_line_items => true
					 }
			 },


			{:invoice_query_rq => {
					:xml_attributes => { :requestID =>1, :iterator  => "Start" },
					:max_returned => 100,
					:modified_date_range_filter => {
							:from_modified_date => last_ran
					},
					:include_line_items => true
			}
			}]
		end


	def handle_response(r, session, job, request, data)
		QbwcError.create(:worker_class => self.class.name, :error_message => r)
	end
end
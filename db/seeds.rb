# clear quickbooks jobs
  QBWC.clear_jobs
  client_request = {:customer_query_rq => {
          :xml_attributes => { :requestID =>1, :iterator  => "Start" },
          :max_returned => 100,
          :active_status => "All",
          :from_modified_date => "2017-02-28T08:14",
          :include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'FullName', 'IsActive', 'CompanyName', 'CustomerTypeRef', 'TermsRef', 'SalesRepRef', 'TotalBalance', 'SalesTaxCodeRep', 'ItemSalesTaxRef', 'AccountNumber', 'PreferredDeliveryMethod'],
          :owner_id => 0
      }
  }
  job_request =  {:customer_query_rq => {
      :xml_attributes => { :requestID =>1, :iterator  => "Start" },
      :max_returned => 100,
      :active_status => "All",
      :from_modified_date => "2017-02-28T08:14",
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
      :from_modified_date => "2017-02-28T08:14",
      :name_filter => {
		      :match_criterion => 'StartsWith',
          :name => 'P-'
      },
      :include_ret_element => ['ListID', 'TimeCreated', 'TimeModified', 'EditSequence', 'Name', 'FullName', 'IsActive', 'ParentRef']
  }
  }

  estimate_request = {
      :estimate_query_rq => {
          :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
          :max_returned => 100,
          :modified_date_range_filter => {
              #  :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_estimates').first.updated_at.localtime.strftime '%FT%R'}"
              :from_modified_date => "2012-01-08T08:14",
              :to_modified_date => "2012-01-11T08:14"
          },
          :include_line_items => true
      }
  }

  sales_order_request = {
      :sales_order_query_rq => {
          :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
          :max_returned => 100,
          :modified_date_range_filter => {
              # :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_sales_orders').first.updated_at.localtime.strftime '%FT%R'}"
              :from_modified_date => "2017-02-28T08:14"
          },
          :include_line_items => true,
          :owner_id => 0
      }
  }

  purchase_order_request = {
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
  invoice_request =  {
      :invoice_query_rq => {
          :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
          :max_returned => 100,
          :modified_date_range_filter => {
              # :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_invoices').first.updated_at.localtime.strftime '%FT%R'}"
              :from_modified_date => "2017-02-28T08:14"
          },
          :include_line_items => true,
          :owner_id => 0
      }
  }

  QBWC.add_job(:customers_query, true, '', QBWC::Worker, [client_request, job_request, project_request, estimate_request, sales_order_request, purchase_order_request, invoice_request])
  # QBWC.add_job(:estimate_query, true, '', EstimateQueryWorker)
 # QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
 # QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
 # QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)
#  QBWC.add_job(:list_receive_payments, true, '', ReceivePaymentQueryWorker)
  

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

  QBWC.add_job(:customers_query, true, '', QBWC::Worker, [client_request, job_request, project_request])
  # QBWC.add_job(:estimate_query, true, '', EstimateQueryWorker)
 # QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
 # QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
 # QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)
#  QBWC.add_job(:list_receive_payments, true, '', ReceivePaymentQueryWorker)
  

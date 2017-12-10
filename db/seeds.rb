# clear quickbooks jobs
  QBWC.clear_jobs
  QBWC.add_job(:initial, true, '', InitialWorker)
  QBWC.add_job(:query, false, '', QueryWorker)
  QBWC.add_job(:list_del, false, '', ListDeletedQueryWorker)
  QBWC.add_job(:txn_del, false, '', TxnDeletedQueryWorker)
  QBWC.add_job(:add_time, false, '', TimeTrackingAddWorker, [{:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "2017-12-09", :entity_ref => {:full_name => "Klerk, Nichole J"}, :customer_ref => {:full_name => "TCP:IT:P-903"}, :item_service_ref => {:full_name => "Video:0100"}, :duration => "PT8H0M0S", :payroll_item_wage_ref => {:full_name => "Hourly Level 1"}, :billable_status => "Billable"}}}])


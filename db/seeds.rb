# clear quickbooks jobs
  requests = [{:time_tracking_add_rq =>
                   {:time_tracking_add =>
                        {:txn_date => "2017-12-04",
                         :entity_ref => {:full_name => "Klerk, Nichole J"},
                         :customer_ref => {:full_name => "TCP:IT:P-903"},
                         :item_service_ref => {:full_name => "Video:0100"},
                         :duration => "PT8H0M0S",
                         :payroll_item_wage_ref => {:full_name => "Hourly Level 1"},                                       :billable_status => "Billable"}
                   },
              },
              {:time_tracking_add_rq =>
                   {:time_tracking_add =>
                        {:txn_date => "2017-12-05",
                         :entity_ref => {:full_name => "Klerk, Nichole J"},
                         :customer_ref => {:full_name => "TCP:IT:P-903"},
                         :item_service_ref => {:full_name => "Video:0100"},
                         :duration => "PT8H0M0S",
                         :payroll_item_wage_ref => {:full_name => "Hourly Level 1"},                                       :billable_status => "Billable"}
                   },
              },
              {:time_tracking_add_rq =>
                   {:time_tracking_add =>
                        {:txn_date => "2017-12-06",
                         :entity_ref => {:full_name => "Klerk, Nichole J"},
                         :customer_ref => {:full_name => "TCP:IT:P-903"},
                         :item_service_ref => {:full_name => "Video:0100"},
                         :duration => "PT8H0M0S",
                         :payroll_item_wage_ref => {:full_name => "Hourly Level 1"},                                       :billable_status => "Billable"}
                   },
              },
              {:time_tracking_add_rq =>
                   {:time_tracking_add =>
                        {:txn_date => "2017-12-07",
                         :entity_ref => {:full_name => "Klerk, Nichole J"},
                         :customer_ref => {:full_name => "TCP:IT:P-903"},
                         :item_service_ref => {:full_name => "Video:0100"},
                         :duration => "PT8H0M0S",
                         :payroll_item_wage_ref => {:full_name => "Hourly Level 1"},                                       :billable_status => "Billable"}
                   },
              },
              {:time_tracking_add_rq =>
                   {:time_tracking_add =>
                        {:txn_date => "2017-12-09",
                         :entity_ref => {:full_name => "Klerk, Nichole J"},
                         :customer_ref => {:full_name => "TCP:IT:P-903"},
                         :item_service_ref => {:full_name => "Video:0100"},
                         :duration => "PT8H0M0S",
                         :payroll_item_wage_ref => {:full_name => "Hourly Level 1"},                                       :billable_status => "Billable"}
                   },
              }]

  QBWC.clear_jobs
  QBWC.add_job(:initial, false, '', InitialWorker)
  QBWC.add_job(:query, false, '', QueryWorker)
  QBWC.add_job(:list_del, false, '', ListDeletedQueryWorker)
  QBWC.add_job(:txn_del, false, '', TxnDeletedQueryWorker)
  QBWC.add_job(:time_tracking_query, false, '', TimeTrackingQueryWorker)
  QBWC.add_job(:add_time, true, '', TimeTrackingAddWorker, requests)


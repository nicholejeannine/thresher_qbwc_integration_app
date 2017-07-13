# clear quickbooks jobs
  QBWC.clear_jobs
  QBWC.add_job(:list, false, '', ListWorker)
  QBWC.add_job(:txn, false, '', TransactionQueryWorker)
  QBWC.add_job(:initial, true, '', InitialWorker)
  QBWC.add_job(:query, false, '', QueryWorker)
  QBWC.add_job(:list_del, false, '', ListDeletedQueryWorker)
  QBWC.add_job(:txn_del, false, '', TxnDeletedQueryWorker)
  

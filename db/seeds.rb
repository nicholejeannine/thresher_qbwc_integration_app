# clear quickbooks jobs
  QBWC.clear_jobs
  # QBWC.add_job(:list, true, '', ListWorker)
  QBWC.add_job(:initial, true, '', InitialWorker)
  # QBWC.add_job(:linked_txn, true, '', LinkedTxnWorker)
  # QBWC.add_job(:query, false, '', QueryWorker)
  

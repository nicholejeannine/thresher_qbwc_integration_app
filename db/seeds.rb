# clear quickbooks jobs
QBWC.clear_jobs
QBWC.add_job(:initial, false, '', InitialWorker)
QBWC.add_job(:query, false, '', QueryWorker)
QBWC.add_job(:list_del, false, '', ListDeletedQueryWorker)
QBWC.add_job(:txn_del, false, '', TxnDeletedQueryWorker)
QBWC.add_job(:list_customers, false, '', CustomerQueryWorker)

QBWC.add_job(:initalize_customers, true, '', Initializers::ClientWorker)


# clear quickbooks jobs
QBWC.clear_jobs

QBWC.add_job(:initalize_customers, true, '', Initializers::ClientWorker)
QBWC.add_job(:query, true, '', QueryWorker)
QBWC.add_job(:list_customers, true, '', CustomerQueryWorker)
QBWC.add_job(:list_del, false, '', ListDeletedQueryWorker)
QBWC.add_job(:txn_del, false, '', TxnDeletedQueryWorker)
# QBWC.add_job(:initalize_jobs, true, '', Initializers::JobWorker)


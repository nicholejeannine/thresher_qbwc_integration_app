# clear quickbooks jobs
QBWC.clear_jobs
# THE INITIALIZER JOBS DELETE THEMSELVES AFTER THEY ARE RUN. If you need to run them again for some reason, uncomment them.

# QBWC.add_job(:initalize_customers, true, '', Initializers::ClientWorker)
QBWC.add_job(:initalize_jobs, true, '', Initializers::JobWorker)
QBWC.add_job(:query, true, '', QueryWorker)
QBWC.add_job(:list_customers, true, '', CustomerQueryWorker)
QBWC.add_job(:list_del, false, '', ListDeletedQueryWorker)
QBWC.add_job(:txn_del, false, '', TxnDeletedQueryWorker)


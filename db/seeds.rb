# clear quickbooks jobs
  QBWC.clear_jobs
  # QBWC.add_job(:client, true, '', ClientWorker)
  QBWC.add_job(:initial, true, '', InitialWorker)

  # QBWC.add_job(:query, true, '', QueryWorker)
  # QBWC.add_job(:estimate_query, true, '', EstimateQueryWorker)
 # QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
 # QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
 # QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)
#  QBWC.add_job(:list_receive_payments, true, '', ReceivePaymentQueryWorker)
  

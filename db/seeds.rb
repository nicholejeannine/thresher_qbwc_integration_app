# clear quickbooks jobs
  QBWC.clear_jobs
  QBWC.add_job(:customer_query, true, '', CustomerQueryWorker)
  QBWC.add_job(:list_estimates, true, '', EstimateQueryWorker)
 # QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
 # QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
 # QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)


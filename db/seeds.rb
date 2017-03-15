# clear quickbooks jobs
  QBWC.clear_jobs
  
  QBWC.add_job(:client_query, true, '', ClientQueryWorker)
 # QBWC.add_job(:estimate_query, true, '', EstimateQueryWorker)
 # QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
 # QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
 # QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)
#  QBWC.add_job(:list_receive_payments, true, '', ReceivePaymentQueryWorker)
  

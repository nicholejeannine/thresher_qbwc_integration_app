# clear quickbooks jobs
  QBWC.clear_jobs
  requests = {
   :data_event_subscription_query_rq => {
     :xml_attributes => {"requestID" => '9'},
     :subscriber_id =>  '{57F3B9B1-86F1-4fcc-B1EE-566DE1813D20}'
     }
   }
#  QBWC.add_job(:customer_query, true, '', CustomerQueryWorker)
 # QBWC.add_job(:estimate_query, true, '', EstimateQueryWorker)
  #QBWC.add_job(:list_sales_orders, true, '', SalesOrderQueryWorker)
  #QBWC.add_job(:list_purchase_orders, true, '', PurchaseOrderQueryWorker)
  #QBWC.add_job(:list_invoices, true, '', InvoiceQueryWorker)
  QBWC.add_job(:list_receive_payments, true, '', ReceivePaymentQueryWorker)
  QBWC.add_job(:list_subscriptions, true, '', QBWC::Worker, requests)

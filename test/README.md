# TESTS TO WRITE:


1. Invoice.parse_linked_txn (saves sales order id)
1. Invoice.parse_memo (saves estimate id)
1. Job.titleize_job_status
1. Project.titleize_job_status
1. PurchaseOrder.lookup_vendor (saves vendor id)
1. PurchaseOrder.parse_memo (saves sales order id)
1. ReceivePayment.parse_linked_txn(saves invoice id and payment id to the join table)
1. SalesOrder.parse_memo (saves estimate id)
1. All line items - make sure foreign keys are being saved!
1. Job parent, project parent, parents on txn types

# TO FIX:


1. Invoices don't want to save sales order id

# TESTS TO WRITE:


1. Invoice.parse_linked_txn (saves sales order id)
1. Invoice.parse_memo (saves estimate id)
1. Job.titleize_job_status
1. Project.titleize_job_status
1. PurchaseOrder.lookup_vendor (saves vendor id)
1. PurchaseOrder.parse_memo (saves sales order id)
1. ReceivePayment.parse_linked_txn(saves invoice id and payment id to the join table)
1. SalesOrder.parse_memo (saves estimate id)
1. All line items


# TO UDPATE IN DB SCHEMA:

1. Convert ids to int types
1. Parent_id for parent_ref (full name and call the column "parent")
1. Convert customer_type/customer_id to customer_full_name
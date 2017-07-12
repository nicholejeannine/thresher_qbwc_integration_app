CREATE OR REPLACE
ALGORITHM = UNDEFINED
VIEW `qPurchaseOrders`
AS SELECT id AS qPurchaseOrders_PKEY, time_created AS CreationTimeStamp, CreationUser, time_modified AS LastModificationTimeStamp, LastModificationUser, FK_Jobs_PKEY, FK_Project_PKEY, FK_qEstimates_PKEY, FK_qSalesOrders_PKEY, FK_Customers_PKEY, total_amount AS PO_Amount, PO_ConfirmationNo, PO_DateComplete, PO_DateConfirmed, txn_date AS PO_DateCreation, PO_DateDelivered, expected_date AS PO_DateETA, PO_DateReceived, PO_DateSent, PO_DateShipped, PO_ETA, PO_Notes, concat("PO-", ref_number) AS PO_Number, PO_ProjectName, PO_ShippedTo, PO_Status, PO_URL, `PO_URL BU`, vendor_addr1 AS PO_Vendor, PO_NBD, PO_Bundle, PO_OrderByDate FROM purchase_orders

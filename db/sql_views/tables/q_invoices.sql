-- CREATE OR REPLACE
-- ALGORITHM = UNDEFINED
-- SQL SECURITY INVOKER
-- VIEW `qInvoices`
-- AS SELECT id AS qInvoices_PKEY, time_created AS CreationTimeStamp, CreationUser, time_modified AS LastModificationTimeStamp, LastModificationUser, FK_Project_PKEY, FK_qEstimates_PKEY, FK_Jobs_PKEY, FK_Customers_PKEY, FK_qSalesOrders_PKEY, abs(`applied_amount`) AS Inv_Amount, txn_date AS Inv_DateCreated, Inv_DateInvoiceApproved, Inv_DateInvoiceConfirmed, Inv_DateInvoicePaid, Inv_DateScheduled, Inv_DateSent, Inv_Description, Inv_InvConfirmedNote, Inv_InvSentTo, Inv_InvSentVia, Inv_Notes, concat("Inv-", ref_number) AS Inv_Number, Inv_PaidMethod, Inv_PaymentURL, `Inv_PaymentURL BU`, Inv_ProjectName, Inv_Status, terms AS Inv_Terms, Inv_URL, `Inv_URL BU`, AutolinkPDF FROM invoices
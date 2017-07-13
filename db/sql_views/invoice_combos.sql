CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY INVOKER
 VIEW `invoice_combos`
 AS select `PI`.`qInvoices_PKEY` AS `qInvoices_PKEY`,`RI`.*, `PI`.`CreationTimeStamp` AS `CreationTimeStamp`,`PI`.`CreationUser` AS `CreationUser`,`PI`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,`PI`.`LastModificationUser` AS `LastModificationUser`,`PI`.`FK_Project_PKEY` AS `FK_Project_PKEY`,`PI`.`FK_qEstimates_PKEY` AS `FK_qEstimates_PKEY`,`PI`.`FK_Jobs_PKEY` AS `FK_Jobs_PKEY`,`PI`.`FK_Customers_PKEY` AS `FK_Customers_PKEY`,`PI`.`FK_qSalesOrders_PKEY` AS `FK_qSalesOrders_PKEY`,`PI`.`Inv_Amount` AS `Inv_Amount`,`PI`.`Inv_DateCreated` AS `Inv_DateCreated`,`PI`.`Inv_DateInvoiceApproved` AS `Inv_DateInvoiceApproved`,`PI`.`Inv_DateInvoiceConfirmed` AS `Inv_DateInvoiceConfirmed`,`PI`.`Inv_DateInvoicePaid` AS `Inv_DateInvoicePaid`,`PI`.`Inv_DateScheduled` AS `Inv_DateScheduled`,`PI`.`Inv_DateSent` AS `Inv_DateSent`,`PI`.`Inv_Description` AS `Inv_Description`,`PI`.`Inv_InvConfirmedNote` AS `Inv_InvConfirmedNote`,`PI`.`Inv_InvSentTo` AS `Inv_InvSentTo`,`PI`.`Inv_InvSentVia` AS `Inv_InvSentVia`,`PI`.`Inv_Notes` AS `Inv_Notes`,`PI`.`Inv_Number` AS `Inv_Number`,`PI`.`Inv_PaidMethod` AS `Inv_PaidMethod`,`PI`.`Inv_PaymentURL` AS `Inv_PaymentURL`,`PI`.`Inv_PaymentURL BU` AS `Inv_PaymentURL BU`,`PI`.`Inv_ProjectName` AS `Inv_ProjectName`,`PI`.`Inv_Status` AS `Inv_Status`,`PI`.`Inv_Terms` AS `Inv_Terms`,`PI`.`Inv_URL` AS `Inv_URL`,`PI`.`Inv_URL BU` AS `Inv_URL BU`,`PI`.`AutolinkPDF` AS `AutolinkPDF` from (`railstest_development`.`invoices` `RI` left join `Thresher`.`qInvoices` `PI` on((`PI`.`Inv_Number` = concat('Inv-',`RI`.`ref_number`))));

CREATE OR REPLACE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `payment_combos`
AS SELECT
   `P`.`Payments_PKEY` AS `Payments_PKEY`,
   `RP`.`id` AS `id`,
   `RP`.`time_created` AS `time_created`,
   `RP`.`time_modified` AS `time_modified`,
   `RP`.`edit_sequence` AS `edit_sequence`,
   `RP`.`txn_number` AS `txn_number`,
   `RP`.`customer_id` AS `customer_id`,
   `RP`.`customer_type` AS `customer_type`,
   `RP`.`invoice_id` AS `invoice_id`,
   `RP`.`ar_account` AS `ar_account`,
   `RP`.`txn_date` AS `txn_date`,
   `RP`.`ref_number` AS `ref_number`,
   `RP`.`total_amount` AS `total_amount`,
   `RP`.`payment_method` AS `payment_method`,
   `RP`.`memo` AS `memo`,
   `RP`.`deposit_to_account` AS `deposit_to_account`,
   `RP`.`unused_payment` AS `unused_payment`,
   `RP`.`unused_credits` AS `unused_credits`,
   `P`.`CreationTimeStamp` AS `CreationTimeStamp`,
   `P`.`CreationUser` AS `CreationUser`,
   `P`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,
   `P`.`LastModificationUser` AS `LastModificationUser`,
   `P`.`FK_qInvoices_PKEY` AS `FK_qInvoices_PKEY`,
   `P`.`Date` AS `Date`,
   `P`.`Amount` AS `Amount`,
   `P`.`PaymentNumber` AS `PaymentNumber`,
   `P`.`FK_PaymentMethod_PKEY` AS `FK_PaymentMethod_PKEY`,
   `P`.`URL` AS `URL`
FROM ((`Thresher`.`invoice_combos` `IC` join `Thresher`.`Payments` `P` on((`P`.`FK_qInvoices_PKEY` = `IC`.`qInvoices_PKEY`))) join `railstest_development`.`receive_payments` `RP` on((`RP`.`invoice_id` = `IC`.`id`))) where (`P`.`Amount` = trim(trailing '000' from `RP`.`total_amount`));


CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `payment_combo_matches`
AS SELECT
   `IC`.`qInvoices_PKEY` AS `qInvoices_PKEY`,
   `P`.`Payments_PKEY` AS `Payments_PKEY`,
   `RP`.`id` AS `QB Payment id`,
   `P`.`Amount` AS `Portal Amount`,trim(trailing '000'
FROM `RP`.`total_amount`) AS `QB Amount`,`P`.`Date` AS `Portal Date`,`RP`.`txn_date` AS `QB Date` from ((`Thresher`.`invoice_combos` `IC` join `Thresher`.`Payments` `P` on((`P`.`FK_qInvoices_PKEY` = `IC`.`qInvoices_PKEY`))) join `railstest_development`.`receive_payments` `RP` on((`RP`.`invoice_id` = `IC`.`id`))) where (`P`.`Amount` = trim(trailing '000' from `RP`.`total_amount`)) order by `IC`.`qInvoices_PKEY`;
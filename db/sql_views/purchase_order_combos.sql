CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `purchase_order_combos`
 AS select `PP`.`qPurchaseOrders_PKEY` AS `qPurchaseOrders_PKEY`,`RP`.*,`PP`.`CreationTimeStamp` AS `CreationTimeStamp`,`PP`.`CreationUser` AS `CreationUser`,`PP`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,`PP`.`LastModificationUser` AS `LastModificationUser`,`PP`.`FK_Jobs_PKEY` AS `FK_Jobs_PKEY`,`PP`.`FK_Project_PKEY` AS `FK_Project_PKEY`,`PP`.`FK_qEstimates_PKEY` AS `FK_qEstimates_PKEY`,`PP`.`FK_qSalesOrders_PKEY` AS `FK_qSalesOrders_PKEY`,`PP`.`FK_Customers_PKEY` AS `FK_Customers_PKEY`,`PP`.`PO_Amount` AS `PO_Amount`,`PP`.`PO_ConfirmationNo` AS `PO_ConfirmationNo`,`PP`.`PO_DateComplete` AS `PO_DateComplete`,`PP`.`PO_DateConfirmed` AS `PO_DateConfirmed`,`PP`.`PO_DateCreation` AS `PO_DateCreation`,`PP`.`PO_DateDelivered` AS `PO_DateDelivered`,`PP`.`PO_DateETA` AS `PO_DateETA`,`PP`.`PO_DateReceived` AS `PO_DateReceived`,`PP`.`PO_DateSent` AS `PO_DateSent`,`PP`.`PO_DateShipped` AS `PO_DateShipped`,`PP`.`PO_ETA` AS `PO_ETA`,`PP`.`PO_Notes` AS `PO_Notes`,`PP`.`PO_Number` AS `PO_Number`,`PP`.`PO_ProjectName` AS `PO_ProjectName`,`PP`.`PO_ShippedTo` AS `PO_ShippedTo`,`PP`.`PO_Status` AS `PO_Status`,`PP`.`PO_URL` AS `PO_URL`,`PP`.`PO_URL BU` AS `PO_URL BU`,`PP`.`PO_Vendor` AS `PO_Vendor`,`PP`.`PO_NBD` AS `PO_NBD`,`PP`.`PO_Bundle` AS `PO_Bundle`,`PP`.`PO_OrderByDate` AS `PO_OrderByDate` from (`railstest_development`.`purchase_orders` `RP` left join `Thresher`.`qPurchaseOrders` `PP` on((concat('PO-',`RP`.`ref_number`) = `PP`.`PO_Number`)))
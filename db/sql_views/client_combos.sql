CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY INVOKER
 VIEW `client_combos`
 AS select `P`.`Customers_PKEY` AS `Customers_PKEY`, Q.*, `P`.`CreationTimeStamp` AS `CreationTimeStamp`,`P`.`CreationUser` AS `CreationUser`,`P`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,`P`.`LastModificationUser` AS `LastModificationUser`,`P`.`Cust_Address1` AS `Cust_Address1`,`P`.`Cust_Address2` AS `Cust_Address2`,`P`.`Cust_BillTo_Address1` AS `Cust_BillTo_Address1`,`P`.`Cust_BillTo_Address2` AS `Cust_BillTo_Address2`,`P`.`Cust_BillTo_City` AS `Cust_BillTo_City`,`P`.`Cust_BillTo_Company` AS `Cust_BillTo_Company`,`P`.`Cust_BillTo_Country` AS `Cust_BillTo_Country`,`P`.`Cust_BillTo_Email` AS `Cust_BillTo_Email`,`P`.`Cust_BillTo_Name` AS `Cust_BillTo_Name`,`P`.`Cust_AP_Name` AS `Cust_AP_Name`,`P`.`Cust_BillTo_Phone` AS `Cust_BillTo_Phone`,`P`.`Cust_BillTo_State` AS `Cust_BillTo_State`,`P`.`Cust_BillTo_Zip` AS `Cust_BillTo_Zip`,`P`.`Cust_City` AS `Cust_City`,`P`.`Cust_CLNo` AS `Cust_CLNo`,`P`.`Cust_Company` AS `Cust_Company`,`P`.`Cust_CompanyAbr` AS `Cust_CompanyAbr`,`P`.`Cust_ContactAlt` AS `Cust_ContactAlt`,`P`.`Cust_Country` AS `Cust_Country`,`P`.`Cust_EmailCC` AS `Cust_EmailCC`,`P`.`Cust_EmailTo` AS `Cust_EmailTo`,`P`.`Cust_InactiveFlag` AS `Cust_InactiveFlag`,`P`.`Cust_NameAltFull` AS `Cust_NameAltFull`,`P`.`Cust_NameFirst` AS `Cust_NameFirst`,`P`.`Cust_NameFull` AS `Cust_NameFull`,`P`.`Cust_NameLast` AS `Cust_NameLast`,`P`.`Cust_NameMiddle` AS `Cust_NameMiddle`,`P`.`Cust_NameSalutation` AS `Cust_NameSalutation`,`P`.`Cust_PhoneAlt` AS `Cust_PhoneAlt`,`P`.`Cust_PhoneCell` AS `Cust_PhoneCell`,`P`.`Cust_PhoneFax` AS `Cust_PhoneFax`,`P`.`Cust_PhoneOffice` AS `Cust_PhoneOffice`,`P`.`Cust_PONo` AS `Cust_PONo`,`P`.`Cust_Rep` AS `Cust_Rep`,`P`.`Cust_SaleTaxCode` AS `Cust_SaleTaxCode`,`P`.`Cust_ShipTo_Address1` AS `Cust_ShipTo_Address1`,`P`.`Cust_ShipTo_Address2` AS `Cust_ShipTo_Address2`,`P`.`Cust_ShipTo_City` AS `Cust_ShipTo_City`,`P`.`Cust_ShipTo_Company` AS `Cust_ShipTo_Company`,`P`.`Cust_ShipTo_Country` AS `Cust_ShipTo_Country`,`P`.`Cust_ShipTo_Email` AS `Cust_ShipTo_Email`,`P`.`Cust_ShipTo_Name` AS `Cust_ShipTo_Name`,`P`.`Cust_ShipTo_Phone` AS `Cust_ShipTo_Phone`,`P`.`Cust_ShipTo_State` AS `Cust_ShipTo_State`,`P`.`Cust_ShipTo_Zip` AS `Cust_ShipTo_Zip`,`P`.`Cust_State` AS `Cust_State`,`P`.`Cust_Terms` AS `Cust_Terms`,`P`.`Cust_Type` AS `Cust_Type`,`P`.`Cust_Zip` AS `Cust_Zip` from (`qb`.`clients` `Q` left join `Thresher`.`Customers` `P` on((`P`.`Cust_CompanyAbr` = `Q`.`full_name`)));
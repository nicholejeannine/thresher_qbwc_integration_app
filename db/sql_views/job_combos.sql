CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `job_combos`
 AS select `PJ`.`Jobs_PKEY` AS `Jobs_PKEY`,`Q`.*,`PJ`.`CreationTimeStamp` AS `CreationTimeStamp`,`PJ`.`CreationUser` AS `CreationUser`,`PJ`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,`PJ`.`LastModificationUser` AS `LastModificationUser`,`PJ`.`FK_JobID_Parent` AS `FK_JobID_Parent`,`PJ`.`FK_Customers_PKEY` AS `FK_Customers_PKEY`,`PJ`.`Job_Company` AS `Job_Company`,`PJ`.`Job_CompanyAbr` AS `Job_CompanyAbr`,`PJ`.`Job_Contact` AS `Job_Contact`,`PJ`.`Job_ContactAlt` AS `Job_ContactAlt`,`PJ`.`Job_ContactName` AS `Job_ContactName`,`PJ`.`Job_CustCLNo` AS `Job_CustCLNo`,`PJ`.`Job_CustPONo` AS `Job_CustPONo`,`PJ`.`Job_DateEndActual` AS `Job_DateEndActual`,`PJ`.`Job_DateEndProjected` AS `Job_DateEndProjected`,`PJ`.`Job_DateStartActual` AS `Job_DateStartActual`,`PJ`.`Job_DateStartProjected` AS `Job_DateStartProjected`,`PJ`.`Job_DefaultJob` AS `Job_DefaultJob`,`PJ`.`Job_Description_Long` AS `Job_Description_Long`,`PJ`.`Job_Description_Short` AS `Job_Description_Short`,`PJ`.`Job_DisplayIndent` AS `Job_DisplayIndent`,`PJ`.`Job_EmailCC` AS `Job_EmailCC`,`PJ`.`Job_EmailTo` AS `Job_EmailTo`,`PJ`.`Job_ExpiryDate` AS `Job_ExpiryDate`,`PJ`.`Job_HoursAmount_Default` AS `Job_HoursAmount_Default`,`PJ`.`Job_HoursAmount_Lock` AS `Job_HoursAmount_Lock`,`PJ`.`Job_HoursAmount_Max` AS `Job_HoursAmount_Max`,`PJ`.`Job_HourType` AS `Job_HourType`,`PJ`.`Job_InactiveFlag` AS `Job_InactiveFlag`,`PJ`.`Job_NameFirst` AS `Job_NameFirst`,`PJ`.`Job_NameLast` AS `Job_NameLast`,`PJ`.`Job_NameMiddle` AS `Job_NameMiddle`,`PJ`.`Job_NameSalutation` AS `Job_NameSalutation`,`PJ`.`Job_Notes` AS `Job_Notes`,`PJ`.`Job_PhoneAlt` AS `Job_PhoneAlt`,`PJ`.`Job_PhoneFax` AS `Job_PhoneFax`,`PJ`.`Job_PhoneOffice` AS `Job_PhoneOffice`,`PJ`.`Job_QB_JobName` AS `Job_QB_JobName`,`PJ`.`Job_Status` AS `Portal_Job_Status`,`PJ`.`Job_Type` AS `Portal_Job_Type`,`PJ`.`Job_PhoneCell` AS `Job_PhoneCell` from (`railstest_development`.`jobs` `Q` left join (`Thresher`.`Jobs` `PJ` join `railstest_development`.`FullName` `FN` on((`FN`.`Jobs_PKEY` = `PJ`.`Jobs_PKEY`))) on((`Q`.`full_name` = `FN`.`FullName`)))
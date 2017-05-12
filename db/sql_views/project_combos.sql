CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `project_combos`
 AS select `P`.`Project_PKEY` AS `Project_PKEY`,`Q`.*,`P`.`CreationTimeStamp` AS `CreationTimeStamp`,`P`.`CreationUser` AS `CreationUser`,`P`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,`P`.`LastModificationUser` AS `LastModificationUser`,`P`.`FK_Customers_PKEY` AS `FK_Customers_PKEY`,`P`.`FK_Jobs_PKEY` AS `FK_Jobs_PKEY`,`P`.`FK_ProgMan_Employees_PKEY` AS `FK_ProgMan_Employees_PKEY`,`P`.`FK_ProjMan_Employees_PKEY` AS `FK_ProjMan_Employees_PKEY`,`P`.`FK_TechLead_Employees_PKEY` AS `FK_TechLead_Employees_PKEY`,`P`.`FK_Foreman_Employees_PKEY` AS `FK_Foreman_Employees_PKEY`,`P`.`FK_TechForeman_Employees_PKEY` AS `FK_TechForeman_Employees_PKEY`,`P`.`Project_Name` AS `Project_Name`,`P`.`Project_Type` AS `Project_Type`,`P`.`Project_DateStartEstimated` AS `Project_DateStartEstimated`,`P`.`Project_DateEndEstimated` AS `Project_DateEndEstimated`,`P`.`Project_DateStartActual` AS `Project_DateStartActual`,`P`.`Project_DateEndActual` AS `Project_DateEndActual`,`P`.`Project_RoughInStart` AS `Project_RoughInStart`,`P`.`Project_RoughInEnd` AS `Project_RoughInEnd`,`P`.`Project_DeviceInstallStart` AS `Project_DeviceInstallStart`,`P`.`Project_DeviceInstallEnd` AS `Project_DeviceInstallEnd`,`P`.`Project_CommissioningStart` AS `Project_CommissioningStart`,`P`.`Project_CommissioningEnd` AS `Project_CommissioningEnd`,`P`.`Project_ScopeText` AS `Project_ScopeText`,`P`.`Project_NameSalutation` AS `Project_NameSalutation`,`P`.`Project_NameFirst` AS `Project_NameFirst`,`P`.`Project_NameMiddle` AS `Project_NameMiddle`,`P`.`Project_NameLast` AS `Project_NameLast`,`P`.`Project_PhoneMain` AS `Project_PhoneMain`,`P`.`Project_EmailMain` AS `Project_EmailMain`,`P`.`Project_PhoneAlternate` AS `Project_PhoneAlternate`,`P`.`Project_EmailCC` AS `Project_EmailCC`,`P`.`Project_PhoneCell` AS `Project_PhoneCell`,`P`.`Project_PhoneFax` AS `Project_PhoneFax`,`P`.`Project_Address1` AS `Project_Address1`,`P`.`Project_Address2` AS `Project_Address2`,`P`.`Project_Address_Parking1` AS `Project_Address_Parking1`,`P`.`Project_Address_Parking2` AS `Project_Address_Parking2`,`P`.`Project_City` AS `Project_City`,`P`.`Project_State` AS `Project_State`,`P`.`Project_Zip` AS `Project_Zip`,`P`.`Project_Park_1_Address` AS `Project_Park_1_Address`,`P`.`Project_Park_1_Address_City` AS `Project_Park_1_Address_City`,`P`.`Project_Park_1_Address_State` AS `Project_Park_1_Address_State`,`P`.`Project_Park_1_Address_Zip` AS `Project_Park_1_Address_Zip`,`P`.`Project_Park_2_Address` AS `Project_Park_2_Address`,`P`.`Project_Park_2_Address_City` AS `Project_Park_2_Address_City`,`P`.`Project_Park_2_Address_State` AS `Project_Park_2_Address_State`,`P`.`Project_Park_2_Address_Zip` AS `Project_Park_2_Address_Zip`,`P`.`Project_PercentComplete` AS `Project_PercentComplete`,`P`.`Project_IsClosed` AS `Project_IsClosed`,`P`.`Project_Status` AS `Project_Status`,`P`.`Project_QuotedTechLabor` AS `Project_QuotedTechLabor`,`P`.`Project_QuotedRILabor` AS `Project_QuotedRILabor`,`P`.`Project_QuotedDILabor` AS `Project_QuotedDILabor`,`P`.`Project_QuotedCOLabor` AS `Project_QuotedCOLabor`,`P`.`Project_QuotedEngLabor` AS `Project_QuotedEngLabor`,`P`.`Project_QuotedPMLabor` AS `Project_QuotedPMLabor`,`P`.`Project_UseCase` AS `Project_UseCase`,`P`.`Project_QuotedLgstLabor` AS `Project_QuotedLgstLabor`,`P`.`Project_QuotedMaintLabor` AS `Project_QuotedMaintLabor` from ((`Thresher`.`Project` `P` join `railstest_development`.`ProjectFullName` `FN` on((`FN`.`Project_PKEY` = `P`.`Project_PKEY`))) left join `railstest_development`.`projects` `Q` on((`Q`.`full_name` = `FN`.`project_full_name`)))
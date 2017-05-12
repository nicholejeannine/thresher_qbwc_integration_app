CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `estimate_combos`
 AS select `PE`.`qEstimates_PKEY` AS `qEstimates_PKEY`,`RE`.*,`PE`.`CreationTimeStamp` AS `CreationTimeStamp`,`PE`.`CreationUser` AS `CreationUser`,`PE`.`LastModificationTimeStamp` AS `LastModificationTimeStamp`,`PE`.`LastModificationUser` AS `LastModificationUser`,`PE`.`FK_Customers_PKEY` AS `FK_Customers_PKEY`,`PE`.`FK_Jobs_PKEY` AS `FK_Jobs_PKEY`,`PE`.`FK_Project_PKEY` AS `FK_Project_PKEY`,`PE`.`Est_Amount` AS `Est_Amount`,`PE`.`Est_Company` AS `Est_Company`,`PE`.`Est_CompanyAbr` AS `Est_CompanyAbr`,`PE`.`Est_Contact` AS `Est_Contact`,`PE`.`Est_ContactAlt` AS `Est_ContactAlt`,`PE`.`Est_CPR` AS `Est_CPR`,`PE`.`Est_DateCompletion_Actual` AS `Est_DateCompletion_Actual`,`PE`.`Est_DateCompletion_Estimated` AS `Est_DateCompletion_Estimated`,`PE`.`Est_DateCreated` AS `Est_DateCreated`,`PE`.`Est_DateFDOB` AS `Est_DateFDOB`,`PE`.`Est_DateStarted_Actual` AS `Est_DateStarted_Actual`,`PE`.`Est_DateStarted_Estimated` AS `Est_DateStarted_Estimated`,`PE`.`Est_EmailCC` AS `Est_EmailCC`,`PE`.`Est_EmailTo` AS `Est_EmailTo`,`PE`.`Est_NameFirst` AS `Est_NameFirst`,`PE`.`Est_NameLast` AS `Est_NameLast`,`PE`.`Est_NameMiddle` AS `Est_NameMiddle`,`PE`.`Est_NameSalutation` AS `Est_NameSalutation`,`PE`.`Est_Notes` AS `Est_Notes`,`PE`.`Est_Number` AS `Est_Number`,`PE`.`Est_PercentComplete` AS `Est_PercentComplete`,`PE`.`Est_PhoneAlt` AS `Est_PhoneAlt`,`PE`.`Est_PhoneFax` AS `Est_PhoneFax`,`PE`.`Est_PhoneOffice` AS `Est_PhoneOffice`,`PE`.`Est_ProjectName` AS `Est_ProjectName`,`PE`.`Est_Status` AS `Est_Status`,`PE`.`Est_URL` AS `Est_URL`,`PE`.`Est_URL BU` AS `Est_URL BU` from (`railstest_development`.`estimates` `RE` left join `Thresher`.`qEstimates` `PE` on((concat('Q-',`RE`.`ref_number`) = `PE`.`Est_Number`)))
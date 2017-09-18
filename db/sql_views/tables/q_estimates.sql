-- CREATE OR REPLACE
-- ALGORITHM = UNDEFINED
-- SQL SECURITY INVOKER
-- VIEW `qEstimates`
-- AS SELECT id AS qEstimates_PKEY, time_created AS CreationTimeStamp, CreationUser, time_modified AS LastModificationTimeStamp, LastModificationUser, FK_Customers_PKEY, FK_Jobs_PKEY, FK_Project_PKEY, total_amount AS Est_Amount, bill_addr1 AS Est_Company, Est_CompanyAbr, Est_Contact, Est_ContactAlt, Est_CPR, Est_DateCompletion_Actual, Est_DateCompletion_Estimated, txn_date AS Est_DateCreated, Est_DateFDOB, Est_DateStarted_Actual, Est_DateStarted_Estimated, Est_EmailCC, Est_EmailTo, Est_NameFirst, Est_NameLast, Est_NameMiddle, Est_NameSalutation, Est_Notes, concat("Q-", ref_number) AS Est_Number, Est_PercentComplete, Est_PhoneAlt, Est_PhoneFax, Est_PhoneOffice, Est_ProjectName, Est_Status, Est_URL, `Est_URL BU` FROM estimates














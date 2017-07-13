CREATE OR REPLACE
ALGORITHM = UNDEFINED
SQL SECURITY INVOKER
VIEW `qSalesOrders`
AS SELECT id AS qSalesOrders_PKEY, time_created AS CreationTimeStamp, CreationUser, time_modified AS LastModificationTimeStamp, LastModificationUser, FK_Jobs_PKEY, FK_Project_PKEY, estimate_id AS FK_qEstimates_PKEY, FK_Customers_PKEY, total_amount AS SO_Amount, total_amount AS SO_ClientPOAmount, txn_date AS SO_ClientPODate, po_number AS SO_ClientPONo, SO_ClientPOURL, `SO_ClientPOURL BU`, SO_DateCompleted_Actual, SO_DateCompleted_Estimated, time_created AS SO_DateCreated, SO_DateFDOB, SO_DateStarted_Actual, SO_DateStarted_Estimated, SO_Notes, concat("SO-", ref_number) AS SO_Number, SO_PercentComplete, SO_ProjectForeman, SO_ProjectManager, SO_Status, SO_URL, `SO_URL BU`, SO_MaterialsDateNeededBy, SO_MaterialsStatus, SO_LOM_URL, FK_ProgMan_Employees_PKEY, FK_TechLead_Employees_PKEY, SO_Description FROM sales_orders
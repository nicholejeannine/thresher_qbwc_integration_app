CREATE OR REPLACE ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `timecard_transactions` AS select `Thresher`.`TimeCardTrans`.`TimeCardTrans_PKEY` AS `id`, `Thresher`.`TimeCardTrans`.`FK_Holidays_PKEY` AS `holiday_id`, `Thresher`.`TimeCardTrans`.`FK_Jobs_PKEY` AS `job_id`, `Thresher`.`TimeCardTrans`.`FK_Customers_PKEY` AS `client_id`, `Thresher`.`TimeCardTrans`.`FK_Project_PKEY` AS `project_id`, `Thresher`.`TimeCardTrans`.`FK_TimeCards_PKEY` AS `timecard_id`, `Thresher`.`TimeCardTrans`.`FK_Tickets_PKEY` AS `ticket_id`, `Thresher`.`TimeCardTrans`.`FK_Employees_PKEY` AS `employee_id`, `Thresher`.`TimeCardTrans`.`TCT_Date` AS `tc_date`, `Thresher`.`TimeCardTrans`.`TCT_Hours` AS `duration`, `Thresher`.`TimeCardTrans`.`TCT_QBJobName` AS `qb_job_name`, `Thresher`.`TimeCardTrans`.`TCT_Status` AS `tc_status` from `Thresher`.`TimeCardTrans`
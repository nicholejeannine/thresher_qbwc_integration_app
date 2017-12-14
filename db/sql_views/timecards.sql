CREATE OR REPLACE ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `timecards` AS select `Thresher`.`TimeCards`.`TimeCards_PKEY` AS `id`,
 `Thresher`.`TimeCards`.`FK_Employees_PKEY` AS `employee_id`,
 `Thresher`.`TimeCards`.`TC_Date_01` AS `tc_date1`,
 `Thresher`.`TimeCards`.`TC_Status` AS `tc_status` from `Thresher`.`TimeCards`
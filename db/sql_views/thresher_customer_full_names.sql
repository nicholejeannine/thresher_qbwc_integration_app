CREATE OR REPLACE ALGORITHM = UNDEFINED DEFINER = root@localhost SQL SECURITY DEFINER VIEW `thresher_customer_full_names` AS select 'Client' AS `customer_type`,`Thresher`.`Customers`.`Customers_PKEY` AS `customer_id`,`Thresher`.`Customers`.`Cust_CompanyAbr` AS `full_name` from `Thresher`.`Customers` union select 'Job' AS `customer_type`,`FullName`.`Jobs_PKEY` AS `customer_id`,`FullName`.`FullName` AS `full_name` from `Thresher`.`FullName` union select 'Project' AS `customer_type`,`ProjectFullName`.`Project_PKEY` AS `customer_id`,`ProjectFullName`.`project_full_name` AS `full_name` from `Thresher`.`ProjectFullName`
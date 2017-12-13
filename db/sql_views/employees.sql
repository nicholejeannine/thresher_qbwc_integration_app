CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY INVOKER
 VIEW `employees` AS select `Thresher`.`Employees`.`Employees_PKEY` AS `id`, `Thresher`.`Employees`.`list_id` AS `employee_list_id` from `Thresher`.`Employees`
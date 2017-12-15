CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY INVOKER
 VIEW `customer_full_names` AS select `p`.`Project_PKEY` AS `id`,concat(`f`.`FullName`,':P-',`p`.`Project_PKEY`) AS `customer_full_name` from (`Thresher`.`Project` `p` join `railstest_development`.`FullName` `f` on((`f`.`Jobs_PKEY` = `p`.`FK_Jobs_PKEY`)))


CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `FullNameFields` AS select `j`.`Jobs_PKEY` AS `Jobs_PKEY`,`Thresher`.`Customers`.`Cust_CompanyAbr` AS `cust`,(select `Thresher`.`Jobs`.`Job_QB_JobName` AS `jn3` from `Thresher`.`Jobs` where (`Thresher`.`Jobs`.`Jobs_PKEY` = (select `Thresher`.`Jobs`.`FK_JobID_Parent` from `Thresher`.`Jobs` where (`Thresher`.`Jobs`.`Jobs_PKEY` = (select `Thresher`.`Jobs`.`FK_JobID_Parent` from `Thresher`.`Jobs` where (`Thresher`.`Jobs`.`Jobs_PKEY` = `j`.`FK_JobID_Parent`)))))) AS `jp3`,(select `Thresher`.`Jobs`.`Job_QB_JobName` AS `jn2` from `Thresher`.`Jobs` where (`Thresher`.`Jobs`.`Jobs_PKEY` = (select `Thresher`.`Jobs`.`FK_JobID_Parent` from `Thresher`.`Jobs` where (`Thresher`.`Jobs`.`Jobs_PKEY` = `j`.`FK_JobID_Parent`)))) AS `jp2`,(select `Thresher`.`Jobs`.`Job_QB_JobName` AS `jn1` from `Thresher`.`Jobs` where (`Thresher`.`Jobs`.`Jobs_PKEY` = `j`.`FK_JobID_Parent`)) AS `jp1`,`j`.`Job_QB_JobName` AS `pj` from (`Thresher`.`Jobs` `j` left join `Thresher`.`Customers` on((`j`.`FK_Customers_PKEY` = `Thresher`.`Customers`.`Customers_PKEY`)));

 CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `FullName`
 AS select `FullNameFields`.`Jobs_PKEY` AS `Jobs_PKEY`,concat(`FullNameFields`.`cust`,(case when (`FullNameFields`.`jp3` is not null) then concat(':',`FullNameFields`.`jp3`,':',`FullNameFields`.`jp2`,':',`FullNameFields`.`jp1`) when (`FullNameFields`.`jp2` is not null) then concat(':',`FullNameFields`.`jp2`,':',`FullNameFields`.`jp1`) when (`FullNameFields`.`jp1` is not null) then concat(':',`FullNameFields`.`jp1`) else '' end),':',`FullNameFields`.`pj`) AS `FullName` from `Thresher`.`FullNameFields`;

CREATE OR REPLACE
 ALGORITHM = UNDEFINED
 SQL SECURITY DEFINER
 VIEW `ProjectFulllName` AS
 select `p`.`Project_PKEY` AS `Project_PKEY`,concat(`f`.`FullName`,':P-',`p`.`Project_PKEY`) AS `project_full_name` from (`Thresher`.`Project` `p` join `Thresher`.`FullName` `f` on((`f`.`Jobs_PKEY` = `p`.`FK_Jobs_PKEY`)));
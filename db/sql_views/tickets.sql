CREATE OR REPLACE ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `	view_tickets` AS select `Thresher`.`Tickets`.`Tickets_PKEY` AS `id`,
 `Thresher`.`Tickets`.`Tick_Type` AS `ticket_type_id`,
 `Thresher`.`Tickets`.`Tick_subType1` AS `ticket_subtype1_id`,
 `Thresher`.`Tickets`.`Tick_subType2` AS `ticket_subtype2_id` from `Thresher`.`Tickets`
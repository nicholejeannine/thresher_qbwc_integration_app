CREATE OR REPLACE ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `ticket_types` AS select `Thresher`.`Tickets_List_Type`.`Tickets_List_Type_PKEY` AS `id`, `Thresher`.`Tickets_List_Type`.`Description` AS `description`, `Thresher`.`Tickets_List_Type`.`ParentType` AS `parent_id`, `Thresher`.`Tickets_List_Type`.`ServiceCode` AS `service_code` from `Thresher`.`Tickets_List_Type`
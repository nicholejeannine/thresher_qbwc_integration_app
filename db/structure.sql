
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `phone` varchar(21) DEFAULT NULL,
  `alt_phone` varchar(21) DEFAULT NULL,
  `fax` varchar(21) DEFAULT NULL,
  `email` varchar(1023) DEFAULT NULL,
  `cc` varchar(1023) DEFAULT NULL,
  `contact` varchar(41) DEFAULT NULL,
  `alt_contact` varchar(41) DEFAULT NULL,
  `customer_type` varchar(159) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `total_balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `account_number` varchar(99) DEFAULT NULL,
  `preferred_delivery_method` varchar(41) DEFAULT NULL,
  `site_contact` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_id` (`list_id`) USING BTREE,
  UNIQUE KEY `full_name` (`full_name`) USING BTREE,
  KEY `is_active` (`is_active`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `employees`;
/*!50001 DROP VIEW IF EXISTS `employees`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employees` AS SELECT 
 1 AS `id`,
 1 AS `employee_list_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `middle_name`,
 1 AS `is_active`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `estimate_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimate_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_line_id` varchar(255) NOT NULL DEFAULT '',
  `estimate_id` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `desc` varchar(4095) DEFAULT NULL,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(31) DEFAULT NULL,
  `override_uom_set` varchar(31) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `rate_percent` float DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `inventory_site` varchar(31) DEFAULT NULL,
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `markup_rate` decimal(20,5) DEFAULT NULL,
  `markup_rate_percent` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_estimate_lines_on_txn_line_id` (`txn_line_id`) USING BTREE,
  KEY `estimate_id` (`estimate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=194764 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_full_name` varchar(209) DEFAULT NULL,
  `template` varchar(159) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(11) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `terms` varchar(31) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `subtotal` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `sales_tax_percentage` float DEFAULT NULL,
  `sales_tax_total` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `memo` varchar(4095) DEFAULT NULL,
  `customer_msg` varchar(101) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `customer_sales_tax_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txn_id` (`txn_id`) USING BTREE,
  KEY `customer_full_name` (`customer_full_name`) USING BTREE,
  KEY `is_active` (`is_active`) USING BTREE,
  KEY `ref_number` (`ref_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7269 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `holidays`;
/*!50001 DROP VIEW IF EXISTS `holidays`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `holidays` AS SELECT 
 1 AS `id`,
 1 AS `date`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `invoice_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_line_id` varchar(255) NOT NULL DEFAULT '',
  `invoice_id` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `desc` text,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `override_uom_set` varchar(255) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `rate_percent` float DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `inventory_site` varchar(255) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `sales_tax_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_invoice_lines_on_txn_line_id` (`txn_line_id`) USING BTREE,
  KEY `invoice_id` (`invoice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154359 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_full_name` varchar(209) DEFAULT NULL,
  `sales_order_id` int(11) DEFAULT NULL,
  `template` varchar(31) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(11) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `po_number` varchar(25) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `ship_method` varchar(15) DEFAULT NULL,
  `subtotal` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `sales_tax_percentage` float DEFAULT NULL,
  `sales_tax_total` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `applied_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `balance_remaining` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `memo` varchar(4095) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `customer_msg` varchar(101) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `customer_sales_tax_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txn_id` (`txn_id`) USING BTREE,
  KEY `customer_full_name` (`customer_full_name`) USING BTREE,
  KEY `ref_number` (`ref_number`) USING BTREE,
  KEY `sales_order_id` (`sales_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invoices_receive_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices_receive_payments` (
  `invoice_id` int(11) NOT NULL,
  `receive_payment_id` int(11) NOT NULL,
  UNIQUE KEY `invoice_payment` (`receive_payment_id`,`invoice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_list_id` varchar(255) DEFAULT NULL,
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `phone` varchar(21) DEFAULT NULL,
  `alt_phone` varchar(21) DEFAULT NULL,
  `fax` varchar(21) DEFAULT NULL,
  `email` varchar(1023) DEFAULT NULL,
  `cc` varchar(1023) DEFAULT NULL,
  `contact` varchar(41) DEFAULT NULL,
  `alt_contact` varchar(41) DEFAULT NULL,
  `customer_type` varchar(159) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `total_balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `account_number` varchar(99) DEFAULT NULL,
  `job_status` varchar(41) DEFAULT NULL,
  `job_start_date` date DEFAULT NULL,
  `job_projected_end_date` date DEFAULT NULL,
  `job_end_date` date DEFAULT NULL,
  `job_desc` varchar(99) DEFAULT NULL,
  `job_type` varchar(159) DEFAULT NULL,
  `preferred_delivery_method` varchar(41) DEFAULT NULL,
  `site_contact` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_id` (`list_id`) USING BTREE,
  UNIQUE KEY `full_name` (`full_name`) USING BTREE,
  KEY `is_active` (`is_active`) USING BTREE,
  KEY `parent_list_id` (`parent_list_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2850 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_list_id` varchar(255) DEFAULT NULL,
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `phone` varchar(21) DEFAULT NULL,
  `alt_phone` varchar(21) DEFAULT NULL,
  `fax` varchar(21) DEFAULT NULL,
  `email` varchar(1023) DEFAULT NULL,
  `cc` varchar(1023) DEFAULT NULL,
  `contact` varchar(41) DEFAULT NULL,
  `alt_contact` varchar(41) DEFAULT NULL,
  `customer_type` varchar(159) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `total_balance` decimal(20,5) DEFAULT '0.00000',
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `account_number` varchar(99) DEFAULT NULL,
  `job_status` varchar(41) DEFAULT NULL,
  `job_start_date` date DEFAULT NULL,
  `job_projected_end_date` date DEFAULT NULL,
  `job_end_date` date DEFAULT NULL,
  `job_desc` varchar(99) DEFAULT NULL,
  `job_type` varchar(159) DEFAULT NULL,
  `preferred_delivery_method` varchar(41) DEFAULT NULL,
  `site_contact` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`full_name`) USING BTREE,
  UNIQUE KEY `list_id` (`list_id`) USING BTREE,
  KEY `is_active` (`is_active`) USING BTREE,
  KEY `parent_list_id` (`parent_list_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `purchase_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_line_id` varchar(255) NOT NULL DEFAULT '',
  `purchase_order_id` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `manufacturer_part_number` varchar(255) DEFAULT NULL,
  `desc` text,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `override_uom_set` varchar(255) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `customer_full_name` varchar(209) DEFAULT NULL,
  `received_quantity` decimal(20,5) DEFAULT NULL,
  `unbilled_quantity` decimal(20,5) DEFAULT NULL,
  `is_billed` tinyint(1) DEFAULT NULL,
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_purchase_order_lines_on_txn_line_id` (`txn_line_id`) USING BTREE,
  KEY `customer_full_name` (`customer_full_name`) USING BTREE,
  KEY `purchase_order_id` (`purchase_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62450 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(255) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `vendor_name` varchar(41) DEFAULT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `sales_order_id` int(11) DEFAULT NULL,
  `inventory_site` varchar(255) DEFAULT NULL,
  `ship_to_entity` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `vendor_addr1` varchar(41) DEFAULT NULL,
  `vendor_addr2` varchar(41) DEFAULT NULL,
  `vendor_addr3` varchar(41) DEFAULT NULL,
  `vendor_addr4` varchar(41) DEFAULT NULL,
  `vendor_city` varchar(31) DEFAULT NULL,
  `vendor_state` varchar(21) DEFAULT NULL,
  `vendor_postal_code` varchar(13) DEFAULT NULL,
  `vendor_country` varchar(31) DEFAULT NULL,
  `vendor_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  `is_fully_received` tinyint(1) DEFAULT NULL,
  `memo` text,
  `vendor_msg` varchar(255) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txn_id` (`txn_id`) USING BTREE,
  KEY `ref_number` (`ref_number`) USING BTREE,
  KEY `sales_order_id` (`sales_order_id`) USING BTREE,
  KEY `vendor` (`vendor_name`),
  KEY `time_created` (`time_created`),
  KEY `time_modified` (`time_modified`),
  KEY `estimate_id` (`estimate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `qb_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qb_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(209) NOT NULL,
  `name` varchar(41) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_id` (`list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `qbwc_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qbwc_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_class` varchar(255) NOT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `error_message` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `qbwc_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qbwc_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `began_at` datetime DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `run_time` varchar(255) DEFAULT NULL,
  `error` text,
  `status_code_id` varchar(255) DEFAULT NULL,
  `status_code_severity` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code_id` (`status_code_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `qbwc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qbwc_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(1000) DEFAULT NULL,
  `worker_class` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `request_index` text,
  `requests` text,
  `requests_provided_when_job_added` tinyint(1) NOT NULL DEFAULT '0',
  `data` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_qbwc_jobs_on_name` (`name`) USING BTREE,
  KEY `index_qbwc_jobs_on_company` (`company`(150)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `qbwc_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qbwc_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `company` varchar(1000) DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `current_job` varchar(255) DEFAULT NULL,
  `iterator_id` varchar(255) DEFAULT NULL,
  `error` text,
  `pending_jobs` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `qbwc_timecard_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qbwc_timecard_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_class` varchar(255) NOT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `error_message` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `receive_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receive_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_full_name` varchar(209) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(20) DEFAULT NULL,
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `payment_method` varchar(31) DEFAULT NULL,
  `memo` varchar(4095) DEFAULT NULL,
  `deposit_to_account` varchar(159) DEFAULT NULL,
  `unused_payment` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `unused_credits` decimal(20,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `txn_id` (`txn_id`) USING BTREE,
  KEY `customer_full_name` (`customer_full_name`) USING BTREE,
  KEY `ref_number` (`ref_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2825 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sales_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_line_id` varchar(255) NOT NULL DEFAULT '',
  `sales_order_id` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `desc` text,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `override_uom_set` varchar(255) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `rate_percent` float DEFAULT NULL,
  `amount` decimal(20,5) DEFAULT NULL,
  `inventory_site` varchar(255) DEFAULT NULL,
  `sales_tax_code` varchar(255) DEFAULT NULL,
  `invoiced` decimal(20,5) DEFAULT NULL,
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sales_order_lines_on_txn_line_id` (`txn_line_id`) USING BTREE,
  KEY `sales_order_id` (`sales_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sales_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(255) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_full_name` varchar(209) DEFAULT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(255) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `subtotal` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `item_sales_tax` varchar(255) DEFAULT NULL,
  `sales_tax_percentage` float DEFAULT NULL,
  `sales_tax_total` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  `is_fully_invoiced` tinyint(1) DEFAULT NULL,
  `memo` text,
  `customer_msg` varchar(255) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `customer_sales_tax_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txn_id` (`txn_id`) USING BTREE,
  KEY `customer_full_name` (`customer_full_name`) USING BTREE,
  KEY `estimate_id` (`estimate_id`) USING BTREE,
  KEY `is_fully_invoiced` (`is_fully_invoiced`) USING BTREE,
  KEY `ref_number` (`ref_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4758 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ticket_types`;
/*!50001 DROP VIEW IF EXISTS `ticket_types`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ticket_types` AS SELECT 
 1 AS `id`,
 1 AS `description`,
 1 AS `parent_id`,
 1 AS `service_code`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `tickets`;
/*!50001 DROP VIEW IF EXISTS `tickets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tickets` AS SELECT 
 1 AS `id`,
 1 AS `ticket_type_id`,
 1 AS `ticket_subtype1_id`,
 1 AS `ticket_subtype2_id`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `time_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_trackings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `employee_list_id` varchar(209) DEFAULT NULL,
  `employee_full_name` varchar(209) DEFAULT NULL,
  `customer_full_name` varchar(209) DEFAULT NULL,
  `item_service` varchar(159) DEFAULT NULL,
  `duration` varchar(40) DEFAULT NULL,
  `payroll_item_wage` varchar(209) DEFAULT NULL,
  `notes` varchar(4095) DEFAULT NULL,
  `billable_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txn_id` (`txn_id`),
  KEY `customer_full_name` (`customer_full_name`),
  KEY `entity_full_name` (`employee_full_name`),
  KEY `item_service_full_name` (`item_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `timecard_transactions`;
/*!50001 DROP VIEW IF EXISTS `timecard_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `timecard_transactions` AS SELECT 
 1 AS `id`,
 1 AS `holiday_id`,
 1 AS `job_id`,
 1 AS `client_id`,
 1 AS `project_id`,
 1 AS `timecard_id`,
 1 AS `ticket_id`,
 1 AS `employee_id`,
 1 AS `tc_date`,
 1 AS `duration`,
 1 AS `hours_type`,
 1 AS `qb_job_name`,
 1 AS `tc_status`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(255) NOT NULL DEFAULT '',
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `vendor_addr1` varchar(41) DEFAULT NULL,
  `vendor_addr2` varchar(41) DEFAULT NULL,
  `vendor_addr3` varchar(41) DEFAULT NULL,
  `vendor_addr4` varchar(41) DEFAULT NULL,
  `vendor_city` varchar(31) DEFAULT NULL,
  `vendor_state` varchar(21) DEFAULT NULL,
  `vendor_postal_code` varchar(13) DEFAULT NULL,
  `vendor_country` varchar(31) DEFAULT NULL,
  `vendor_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `phone` varchar(41) DEFAULT NULL,
  `alt_phone` varchar(21) DEFAULT NULL,
  `fax` varchar(21) DEFAULT NULL,
  `email` varchar(1023) DEFAULT NULL,
  `cc` varchar(1023) DEFAULT NULL,
  `contact` varchar(41) DEFAULT NULL,
  `alt_contact` varchar(41) DEFAULT NULL,
  `name_on_check` varchar(41) DEFAULT NULL,
  `account_number` varchar(99) DEFAULT NULL,
  `vendor_type` varchar(159) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `credit_limit` decimal(20,5) DEFAULT NULL,
  `vendor_tax_ident` varchar(15) DEFAULT NULL,
  `is_vendor_eligible_for1099` tinyint(1) DEFAULT NULL,
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `billing_rate` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_id` (`list_id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `is_active` (`is_active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50001 DROP VIEW IF EXISTS `employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `employees` AS select `thresher`.`employees`.`Employees_PKEY` AS `id`,`thresher`.`employees`.`list_id` AS `employee_list_id`,`thresher`.`employees`.`Emp_NameFirst` AS `first_name`,`thresher`.`employees`.`Emp_NameLast` AS `last_name`,`thresher`.`employees`.`Emp_NameMiddle` AS `middle_name`,if((`thresher`.`employees`.`Emp_Status` = 'Active'),1,0) AS `is_active` from `thresher`.`employees` where (`thresher`.`employees`.`list_id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `holidays`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `holidays` AS select `thresher`.`holidays`.`Holidays_PKEY` AS `id`,`thresher`.`holidays`.`Holiday_Date` AS `date`,`thresher`.`holidays`.`Holiday_Name` AS `name` from `thresher`.`holidays` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `ticket_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `ticket_types` AS select `thresher`.`tickets_list_type`.`Tickets_List_Type_PKEY` AS `id`,`thresher`.`tickets_list_type`.`Description` AS `description`,`thresher`.`tickets_list_type`.`ParentType` AS `parent_id`,`thresher`.`tickets_list_type`.`ServiceCode` AS `service_code` from `thresher`.`tickets_list_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `tickets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `tickets` AS select `thresher`.`tickets`.`Tickets_PKEY` AS `id`,`thresher`.`tickets`.`Tick_Type` AS `ticket_type_id`,`thresher`.`tickets`.`Tick_subType1` AS `ticket_subtype1_id`,`thresher`.`tickets`.`Tick_subType2` AS `ticket_subtype2_id` from `thresher`.`tickets` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `timecard_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `timecard_transactions` AS select `thresher`.`timecardtrans`.`TimeCardTrans_PKEY` AS `id`,`thresher`.`timecardtrans`.`FK_Holidays_PKEY` AS `holiday_id`,`thresher`.`timecardtrans`.`FK_Jobs_PKEY` AS `job_id`,`thresher`.`timecardtrans`.`FK_Customers_PKEY` AS `client_id`,`thresher`.`timecardtrans`.`FK_Project_PKEY` AS `project_id`,`thresher`.`timecardtrans`.`FK_TimeCards_PKEY` AS `timecard_id`,`thresher`.`timecardtrans`.`FK_Tickets_PKEY` AS `ticket_id`,`thresher`.`timecardtrans`.`FK_Employees_PKEY` AS `employee_id`,`thresher`.`timecardtrans`.`TCT_Date` AS `tc_date`,`thresher`.`timecardtrans`.`TCT_Hours` AS `duration`,`thresher`.`timecardtrans`.`TCT_HoursType` AS `hours_type`,`thresher`.`timecardtrans`.`TCT_QBJobName` AS `qb_job_name`,`thresher`.`timecardtrans`.`TCT_Status` AS `tc_status` from `thresher`.`timecardtrans` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;




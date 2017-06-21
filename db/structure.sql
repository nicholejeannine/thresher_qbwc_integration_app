-- MySQL dump 10.13  Distrib 5.7.18, for osx10.12 (x86_64)
--
-- Host: localhost    Database: railstest_merge_test
-- ------------------------------------------------------
-- Server version	5.7.18

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

--
-- Table structure for table `Classes_Certs`
--

DROP TABLE IF EXISTS `Classes_Certs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classes_Certs` (
  `Classes_Certs_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Vendor_PKEY` int(11) DEFAULT NULL,
  `FK_Classes_Certs_List_Tier_PKEY` int(11) DEFAULT NULL,
  `Cert_Title` text,
  `Cert_Description` text,
  `Cert_Duration` decimal(10,2) DEFAULT NULL,
  `Cert_Type` text,
  `Cert_URL` text,
  `FK_Employees_PKEY` int(11) DEFAULT NULL COMMENT 'For more info contact this person',
  `Cert_Online` text,
  `Cert_Travel` text,
  `Cert_Tier` decimal(11,1) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`Classes_Certs_PKEY`),
  KEY `FK_Vendor_PKEY` (`FK_Vendor_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `Classes_Certs_List_Tier_PKEY` (`FK_Classes_Certs_List_Tier_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Classes_Certs_Join_Req`
--

DROP TABLE IF EXISTS `Classes_Certs_Join_Req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classes_Certs_Join_Req` (
  `Classes_Certs_Join_Req_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Classes_Certs_PKEY` int(11) NOT NULL,
  `FK_Employees_List_Title_PKEY` int(11) NOT NULL,
  `Classes_Certs_Join_Req_Duration` int(11) DEFAULT NULL COMMENT 'Time to complete course pre/post promotion',
  `Classes_Certs_Join_Req_Type` int(11) DEFAULT NULL COMMENT '0 = pre-reqquiste, 1 = post-requisite',
  `Classes_Certs_Join_Req_Tier` decimal(11,1) DEFAULT NULL COMMENT 'Rating system to show heirarchy between Tech1s, Tech2s and Tech3s',
  PRIMARY KEY (`Classes_Certs_Join_Req_PKEY`),
  KEY `FK_Classes_Certs_PKEY` (`FK_Classes_Certs_PKEY`,`FK_Employees_List_Title_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='When a class or certification is required for more than one title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Classes_Certs_List_Tier`
--

DROP TABLE IF EXISTS `Classes_Certs_List_Tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classes_Certs_List_Tier` (
  `Classes_Certs_List_Tier_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text,
  `Color` text,
  PRIMARY KEY (`Classes_Certs_List_Tier_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ConstTracker`
--

DROP TABLE IF EXISTS `ConstTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConstTracker` (
  `ConstTracker_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `FK_Project_PKEY` int(255) NOT NULL,
  `RoomName` tinytext NOT NULL,
  `RI_Field1` tinyint(1) NOT NULL,
  `RI_Field2` tinyint(1) NOT NULL,
  `RI_Field3` tinyint(1) NOT NULL,
  `DI_Field1` tinyint(1) NOT NULL,
  `DI_Field2` tinyint(1) NOT NULL,
  `DI_Field3` tinyint(1) NOT NULL,
  `DI_Field4` tinyint(4) NOT NULL,
  `CM_Field1` tinyint(1) NOT NULL,
  `CM_Field2` tinyint(1) NOT NULL,
  `CM_Field3` tinyint(1) NOT NULL,
  PRIMARY KEY (`ConstTracker_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `Customers_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `Cust_Address1` text,
  `Cust_Address2` text,
  `Cust_BillTo_Address1` text,
  `Cust_BillTo_Address2` text,
  `Cust_BillTo_City` text,
  `Cust_BillTo_Company` text,
  `Cust_BillTo_Country` text,
  `Cust_BillTo_Email` text COMMENT 'A/P Email',
  `Cust_BillTo_Name` text,
  `Cust_AP_Name` text COMMENT 'A/P Name',
  `Cust_BillTo_Phone` text COMMENT 'A/P Phone',
  `Cust_BillTo_State` text,
  `Cust_BillTo_Zip` int(10) DEFAULT NULL,
  `Cust_City` text,
  `Cust_CLNo` text,
  `Cust_Company` text,
  `Cust_CompanyAbr` text COMMENT 'Customer Short Name',
  `Cust_ContactAlt` text,
  `Cust_Country` text,
  `Cust_EmailCC` text,
  `Cust_EmailTo` text,
  `Cust_InactiveFlag` text,
  `Cust_NameAltFull` text,
  `Cust_NameFirst` text,
  `Cust_NameFull` text,
  `Cust_NameLast` text,
  `Cust_NameMiddle` text,
  `Cust_NameSalutation` text,
  `Cust_PhoneAlt` text,
  `Cust_PhoneCell` text,
  `Cust_PhoneFax` text COMMENT 'A/P FAX',
  `Cust_PhoneOffice` text,
  `Cust_PONo` text,
  `Cust_Rep` text,
  `Cust_SaleTaxCode` text,
  `Cust_ShipTo_Address1` text,
  `Cust_ShipTo_Address2` text,
  `Cust_ShipTo_City` text,
  `Cust_ShipTo_Company` text,
  `Cust_ShipTo_Country` text,
  `Cust_ShipTo_Email` text,
  `Cust_ShipTo_Name` text,
  `Cust_ShipTo_Phone` text,
  `Cust_ShipTo_State` text,
  `Cust_ShipTo_Zip` int(10) DEFAULT NULL,
  `Cust_State` text,
  `Cust_Terms` text,
  `Cust_Type` text,
  `Cust_Zip` int(10) DEFAULT NULL,
  PRIMARY KEY (`Customers_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Deliveries`
--

DROP TABLE IF EXISTS `Deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deliveries` (
  `Deliveries_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `Number` text NOT NULL,
  `Date` date DEFAULT NULL,
  `Address` text,
  `Recipient` text,
  `Final` int(1) NOT NULL DEFAULT '0',
  `Memo` text,
  PRIMARY KEY (`Deliveries_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeliveryItems`
--

DROP TABLE IF EXISTS `DeliveryItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeliveryItems` (
  `DeliveryItems_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `FK_Deliveries_PKEY` int(11) DEFAULT NULL,
  `FK_qSalesOrdersTracker_PKEY` int(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`DeliveryItems_PKEY`),
  KEY `FK_Deliveries_PKEY` (`FK_Deliveries_PKEY`),
  KEY `FK_qSalesOrdersTracker_PKEY` (`FK_qSalesOrdersTracker_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=21169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departments` (
  `Departments_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `ShortName` text NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`Departments_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmployeeSupervisors`
--

DROP TABLE IF EXISTS `EmployeeSupervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeSupervisors` (
  `EmployeeSupervisors_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `FK_Employees_PKEY_Supervisor` int(255) DEFAULT NULL,
  `FK_Employees_PKEY_DirectReport` int(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeSupervisors_PKEY`),
  KEY `FK_Employees_PKEY_Supervisor` (`FK_Employees_PKEY_Supervisor`),
  KEY `FK_Employees_PKEY_DirectReport` (`FK_Employees_PKEY_DirectReport`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `Employees_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL,
  `Emp_Address` text,
  `Emp_Birthday` date DEFAULT NULL,
  `Emp_City` text,
  `Emp_Email` text,
  `Emp_Login` text,
  `Emp_NameFirst` text,
  `Emp_NameLast` text,
  `Emp_NameMiddle` text,
  `Emp_NameSalutation` text,
  `Emp_Password` text,
  `Emp_PhoneAlt` text,
  `Emp_PhoneCellular` text,
  `Emp_PhoneHome` text,
  `Emp_PTO` decimal(10,3) DEFAULT NULL,
  `Emp_PTOAccuralRate` decimal(10,3) DEFAULT NULL,
  `Emp_State` text,
  `Emp_Status` text,
  `Emp_Title` int(11) DEFAULT NULL,
  `Emp_Type` text,
  `Emp_Zip` text,
  `Emp_BelowLine` int(11) NOT NULL DEFAULT '0',
  `Emp_Emer_1_Name` text,
  `Emp_Emer_1_Rel` text,
  `Emp_Emer_1_Phone_A` text COMMENT 'Cell Phone',
  `Emp_Emer_1_Phone_B` text COMMENT 'Home/Work Phone',
  `Emp_Emer_2_Name` text,
  `Emp_Emer_2_Rel` text,
  `Emp_Emer_2_Phone_A` text COMMENT 'Cell Phone',
  `Emp_Emer_2_Phone_B` text COMMENT 'Home/Work Phone',
  `Emp_Medical_Info` text,
  `Emp_Crew_Access` tinyint(4) DEFAULT '0' COMMENT '0 = human has access to edit the schedule',
  `FK_Supervisor_PKEY` int(255) DEFAULT NULL,
  `Emp_Email_Personal` text,
  `Emp_BackCheck` text,
  `Emp_BackCheckDate` date DEFAULT NULL,
  `Emp_HireDate` date DEFAULT NULL,
  `Emp_TermDate` date DEFAULT NULL,
  `Emp_T_Shirt_Size` int(11) DEFAULT NULL,
  `Emp_Collared_Shirt_Size` int(11) DEFAULT NULL,
  `Emp_Hat_Size` int(11) DEFAULT NULL,
  `Emp_cellStipend` int(11) DEFAULT NULL,
  `Emp_cpuStipend` text,
  `Emp_cpuStipendDate` date DEFAULT NULL,
  `Emp_keyFob` text,
  PRIMARY KEY (`Employees_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`),
  KEY `Emp_Title` (`Emp_Title`),
  KEY `FK_Supervisor_PKEY` (`FK_Supervisor_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees_Badges`
--

DROP TABLE IF EXISTS `Employees_Badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees_Badges` (
  `Employees_Badges_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  `FK_Customers_PKEY` int(11) NOT NULL,
  PRIMARY KEY (`Employees_Badges_PKEY`),
  UNIQUE KEY `join` (`FK_Employees_PKEY`,`FK_Customers_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees_Cert`
--

DROP TABLE IF EXISTS `Employees_Cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees_Cert` (
  `Employees_Cert_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  `FK_Classes_Certs_PKEY` int(11) NOT NULL,
  `Date_Completed` date DEFAULT NULL,
  `Date_Expire` date DEFAULT NULL,
  `Cert_URL` text,
  PRIMARY KEY (`Employees_Cert_PKEY`),
  UNIQUE KEY `join` (`FK_Employees_PKEY`,`FK_Classes_Certs_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees_Cert_Todo`
--

DROP TABLE IF EXISTS `Employees_Cert_Todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees_Cert_Todo` (
  `Employees_Cert_Todo_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  `FK_Classes_Certs_PKEY` int(11) NOT NULL,
  `Due_Date` date DEFAULT NULL,
  PRIMARY KEY (`Employees_Cert_Todo_PKEY`),
  UNIQUE KEY `join` (`FK_Employees_PKEY`,`FK_Classes_Certs_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees_List_Size`
--

DROP TABLE IF EXISTS `Employees_List_Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees_List_Size` (
  `Employees_List_Size_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text,
  `Clothing_Size` text,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`Employees_List_Size_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees_List_Title`
--

DROP TABLE IF EXISTS `Employees_List_Title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees_List_Title` (
  `Employees_List_Title_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Departments_PKEY` int(11) DEFAULT NULL,
  `Description` text NOT NULL COMMENT 'Employee Status',
  `Color` text,
  `Color_Font` text,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`Employees_List_Title_PKEY`),
  KEY `FK_Departments_PKEY` (`FK_Departments_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employees_NDAs`
--

DROP TABLE IF EXISTS `Employees_NDAs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees_NDAs` (
  `Employees_NDAs_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text NOT NULL,
  `FK_Customers_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  `Employees_NDAs_URL` text,
  PRIMARY KEY (`Employees_NDAs_PKEY`),
  UNIQUE KEY `join` (`FK_Customers_PKEY`,`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FullName`
--

DROP TABLE IF EXISTS `FullName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FullName` (
  `Jobs_PKEY` int(255) NOT NULL DEFAULT '0',
  `FullName` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FullNameFields`
--

DROP TABLE IF EXISTS `FullNameFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FullNameFields` (
  `Jobs_PKEY` int(255) NOT NULL DEFAULT '0',
  `cust` text COMMENT 'Customer Short Name',
  `jp3` text,
  `jp2` text,
  `jp1` text,
  `pj` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Holidays`
--

DROP TABLE IF EXISTS `Holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Holidays` (
  `Holidays_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `Holiday_CompanyName` text,
  `Holiday_CustomerID` text,
  `Holiday_Date` date DEFAULT NULL,
  `Holiday_Hours` int(10) DEFAULT NULL,
  `Holiday_HoursType` int(10) DEFAULT NULL,
  `Holiday_JobID` text,
  `Holiday_JobName` text,
  `Holiday_Name` text,
  PRIMARY KEY (`Holidays_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JoinFM`
--

DROP TABLE IF EXISTS `JoinFM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JoinFM` (
  `JoinFM_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `FK_TickRel_Tickets_PKEY` int(255) DEFAULT NULL,
  `FK_TickRel_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_TickRel_Employees_PKEY` int(255) DEFAULT NULL,
  `FK_TickRel_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_JobRel_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_JobRel_Employees_PKEY` int(255) DEFAULT NULL,
  `FK_JobRel_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_EmpSup_Sup_Employees_PKEY` int(255) DEFAULT NULL,
  `FK_EmpSup_Employees_PKEY` int(255) DEFAULT NULL,
  `EmpSup__FK_EmployeeID` text,
  `EmpSup__FK_EmployeeID_Sup` text,
  `Jobs__FK_CustomerID` text,
  `Jobs__FK_EmployeeID` text,
  `Jobs__FK_JobID` text,
  `Jobs__FK_TicketID` text,
  `Ticket__FK_CustomerID` text,
  `Ticket__FK_EmployeeID` text,
  `Ticket__FK_JobID` text,
  `Ticket__FK_TicketID` text,
  `canIdieNow` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`JoinFM_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=88891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `List_Salutation`
--

DROP TABLE IF EXISTS `List_Salutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `List_Salutation` (
  `List_Salutation_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL COMMENT 'Salutation',
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`List_Salutation_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `Menu_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `RecordSort` int(10) DEFAULT NULL,
  `RecordTag` text,
  PRIMARY KEY (`Menu_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaymentMethod`
--

DROP TABLE IF EXISTS `PaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentMethod` (
  `PaymentMethod_PKEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `NewPaymentMethod` text NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`PaymentMethod_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payments` (
  `Payments_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `FK_qInvoices_PKEY` int(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentNumber` text,
  `FK_PaymentMethod_PKEY` tinyint(4) DEFAULT NULL,
  `URL` text,
  PRIMARY KEY (`Payments_PKEY`),
  KEY `FK_qInvoices_PKEY` (`FK_qInvoices_PKEY`),
  KEY `FK_PaymentMethod_PKEY` (`FK_PaymentMethod_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5947 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pictures`
--

DROP TABLE IF EXISTS `Pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pictures` (
  `Pictures_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_TablePKEY` int(11) NOT NULL,
  `FK_TableName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PicturePath` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Pictures_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=4059 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Project_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` mediumtext,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` mediumtext,
  `Project_full_name` varchar(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(11) NOT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_ProjMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Foreman_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechForeman_Employees_PKEY` int(11) DEFAULT NULL,
  `Project_Name` text,
  `Project_Type` text,
  `Project_DateStartEstimated` date DEFAULT NULL,
  `Project_DateEndEstimated` date DEFAULT NULL,
  `Project_DateStartActual` date DEFAULT NULL,
  `Project_DateEndActual` date DEFAULT NULL,
  `Project_RoughInStart` date DEFAULT NULL,
  `Project_RoughInEnd` date DEFAULT NULL,
  `Project_DeviceInstallStart` date DEFAULT NULL,
  `Project_DeviceInstallEnd` date DEFAULT NULL,
  `Project_CommissioningStart` date DEFAULT NULL,
  `Project_CommissioningEnd` date DEFAULT NULL,
  `Project_ScopeText` text,
  `Project_NameSalutation` text,
  `Project_NameFirst` text,
  `Project_NameMiddle` text,
  `Project_NameLast` text,
  `Project_PhoneMain` text,
  `Project_EmailMain` text,
  `Project_PhoneAlternate` text,
  `Project_EmailCC` text,
  `Project_PhoneCell` text,
  `Project_PhoneFax` text,
  `Project_Address1` text COMMENT 'Project Site Address',
  `Project_Address2` text,
  `Project_Address_Parking1` text COMMENT 'Project Primary Parking',
  `Project_Address_Parking2` text COMMENT 'Project Secondary Parking',
  `Project_City` text,
  `Project_State` text,
  `Project_Zip` text,
  `Project_Park_1_Address` text COMMENT 'Primary Parking',
  `Project_Park_1_Address_City` text COMMENT 'Primary Parking City',
  `Project_Park_1_Address_State` text COMMENT 'Primary Parking State',
  `Project_Park_1_Address_Zip` int(11) DEFAULT NULL COMMENT 'Primary Parking Zip Code',
  `Project_Park_2_Address` text COMMENT 'Secondary Parking Address',
  `Project_Park_2_Address_City` text COMMENT 'Secondary Parking City',
  `Project_Park_2_Address_State` text COMMENT 'Secondary Parking State',
  `Project_Park_2_Address_Zip` int(11) DEFAULT NULL COMMENT 'Secondary Parking Zip Code',
  `Project_PercentComplete` int(11) DEFAULT NULL,
  `Project_IsClosed` text,
  `Project_Status` tinyint(4) DEFAULT NULL,
  `Project_QuotedTechLabor` int(255) DEFAULT NULL,
  `Project_QuotedRILabor` int(255) DEFAULT NULL,
  `Project_QuotedDILabor` int(255) DEFAULT NULL,
  `Project_QuotedCOLabor` int(255) DEFAULT NULL,
  `Project_QuotedEngLabor` int(255) DEFAULT NULL,
  `Project_QuotedPMLabor` int(255) DEFAULT NULL,
  `Project_UseCase` text,
  `Project_QuotedLgstLabor` int(11) DEFAULT NULL,
  `Project_QuotedMaintLabor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Project_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `Project_Status` (`Project_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=2980 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectCrew`
--

DROP TABLE IF EXISTS `ProjectCrew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectCrew` (
  `ProjectCrew_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Employees_List_Title_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_Tickets_PKEY` int(255) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Weekends` tinyint(4) DEFAULT '0',
  `TitleIndex` int(3) DEFAULT NULL,
  PRIMARY KEY (`ProjectCrew_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=41022 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectEstimates`
--

DROP TABLE IF EXISTS `ProjectEstimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectEstimates` (
  `ProjectEstimates_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Project_PKEY` int(11) NOT NULL,
  `FK_qEstimates_PKEY` int(11) NOT NULL,
  PRIMARY KEY (`ProjectEstimates_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_qEstimates_PKEY` (`FK_qEstimates_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=3452 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectFullName`
--

DROP TABLE IF EXISTS `ProjectFullName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectFullName` (
  `Project_PKEY` int(255) NOT NULL DEFAULT '0',
  `project_full_name` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectNoteTypes`
--

DROP TABLE IF EXISTS `ProjectNoteTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectNoteTypes` (
  `ProjectNoteTypes_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ProjectNoteTypes_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectRoleTypes`
--

DROP TABLE IF EXISTS `ProjectRoleTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectRoleTypes` (
  `ProjectRoleTypes_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ShortDescription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProjectRoleTypes_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectRoles`
--

DROP TABLE IF EXISTS `ProjectRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectRoles` (
  `ProjectRoles_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Project_PKEY` int(255) DEFAULT NULL,
  `FK_ProjectRoleTypes_PKEY` int(255) DEFAULT NULL,
  `FK_Employees_PKEY` int(255) DEFAULT NULL,
  PRIMARY KEY (`ProjectRoles_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_ProjectRoleTypes_PKEY` (`FK_ProjectRoleTypes_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProjectSiteAssessment`
--

DROP TABLE IF EXISTS `ProjectSiteAssessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectSiteAssessment` (
  `ProjectSiteAssessment_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModificationUser` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Project_PKEY` int(255) NOT NULL,
  `clientContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clientPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clientEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `siteAddress` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hoursOfOperation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PPE` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PPE_Comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `coiRequired` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `coiSubmitted` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `noiseRestrictions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `noiseRestrictionComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trashLocation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trashPickupNeeded` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `safetyOrientation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `safetyOrientationComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `baseRoom` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `baseRoomComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accessRestrictions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accessRestrictionComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elevatorRestrictions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elevatorRestrictionComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deliveryLogisticsTime` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `freightElevator` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deliveryLocation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jobBoxNeeded` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `onSiteMeetingDates` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gcContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gcContactPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gcContactEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paintContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paintContactPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paintContactEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `electricalContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `electricalContactPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `electricalContactEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dataContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dataContactPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dataContactEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flooringContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flooringContactPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flooringContactEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `furnitureContact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `furnitureContactPhone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `furnitureContactEmail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsTiles` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsConcrete` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ceilingsWood` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsPandeck` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsCloud` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsOpen` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsHeight` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsScissorLiftRequired` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsScissorLiftRequiredComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsPanduit` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsStructureBeams` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsUnistrutWork` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ceilingsProjection` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ceilingsProjectionComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `floorConduitRuns` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `floorOpenWalls` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `floorCores` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `floorConnectrac` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `floorAccessToFloorBelow` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsConduit` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsRingAndString` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsMetal` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsConcrete` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsWoodStuds` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsLoadBearing` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsTypeDrywall` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsTypeCement` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsTypeDoubleSheetRock` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsBacking` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `wallsBackingComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `architecturalInterference` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `architecturalInterferenceComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fireAlarmsSprinklers` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hvacLayout` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `electricalLayout` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cityCodes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `occupiedSpacesAbove` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `occupiedSpacesBelow` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `carts` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ladders` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hardware` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unistrut` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fishTape` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `powerTools` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `changesMade` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `changesMadeComments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sheetRockDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gridInstallationDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tileDropDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flooringDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `furnitureDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `initialOnSiteStartDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `actionItems` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `generalNotes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ProjectSiteAssessment_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Project_List_Status`
--

DROP TABLE IF EXISTS `Project_List_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_List_Status` (
  `Project_List_Status_PKEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`Project_List_Status_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Project_Transactions`
--

DROP TABLE IF EXISTS `Project_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_Transactions` (
  `Project_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_ProjectNoteTypes_PKEY` int(11) DEFAULT NULL,
  `FK_Pictures_PKEY` int(11) DEFAULT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `isSticky` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPicture` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Project_Transactions_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_ProjectNoteTypes_PKEY` (`FK_ProjectNoteTypes_PKEY`),
  KEY `FK_Pictures_PKEY` (`FK_Pictures_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=14864 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA`
--

DROP TABLE IF EXISTS `RMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA` (
  `RMA_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_FT_TableName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Table_PKEY` int(11) DEFAULT NULL,
  `FK_Tech_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_qPurchaseOrders_PKEY` int(255) DEFAULT NULL,
  `FK_qPurchaseOrders_PKEY_Required` int(1) DEFAULT '1',
  `FK_Tickets_PKEY` int(255) DEFAULT NULL,
  `FK_Tickets_PKEY_Required` int(1) DEFAULT '0',
  `RMA_Number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Number_Required` int(1) DEFAULT '0',
  `RMA_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Description_Required` tinyint(4) NOT NULL DEFAULT '0',
  `RMA_Type` int(11) DEFAULT NULL,
  `RMA_subType1` int(11) DEFAULT NULL,
  `RMA_subType2` int(11) DEFAULT NULL,
  `RMA_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Status_Required` int(1) DEFAULT '0',
  `RMA_Escalation` int(11) DEFAULT NULL,
  `RMA_Requestor_Name_First` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Requestor_Name_First_Required` int(1) DEFAULT '0',
  `RMA_Requestor_Name_Last` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Requestor_Name_Last_Required` int(1) DEFAULT '0',
  `RMA_Requestor_Email` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Requestor_Email_Required` int(1) DEFAULT '0',
  `RMA_Tech_Name_First` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Tech_Name_First_Required` int(1) DEFAULT '0',
  `RMA_Tech_Name_Last` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Tech_Name_Last_Required` int(1) DEFAULT '0',
  `RMA_Manufacturer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Manufacturer_Required` int(1) DEFAULT '0',
  `RMA_Model` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Model_Required` int(1) DEFAULT '0',
  `RMA_Serial_Number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Serial_Number_Required` int(1) DEFAULT '0',
  `RMA_Vendor` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Vendor_Required` int(1) DEFAULT '0',
  `RMA_Vendor_Website` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Vendor_Website_Required` int(1) DEFAULT '0',
  `RMA_Vendor_RMA_Number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Vendor_RMA_Number_Required` int(1) DEFAULT '0',
  `RMA_Source` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Source_Required` int(1) DEFAULT '0',
  `RMA_Contact_Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Contact_Name_Required` int(1) DEFAULT '0',
  `RMA_Contact_Phone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Contact_Phone_Required` int(1) DEFAULT '0',
  `RMA_Track_Replace_Number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Track_Replace_Number_Required` int(1) DEFAULT '0',
  `RMA_Replace_Date_Expected` date DEFAULT NULL,
  `RMA_Replace_Date_Expected_Required` int(1) DEFAULT '0',
  `RMA_Track_Return_Number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `RMA_Track_Return_Number_Required` int(1) DEFAULT '0',
  `RMA_Return_Expected_Date` date DEFAULT NULL,
  `RMA_Return_Expected_Date_Required` int(1) DEFAULT '0',
  PRIMARY KEY (`RMA_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_Assignment`
--

DROP TABLE IF EXISTS `RMA_Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_Assignment` (
  `RMA_Assignment_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_RMA_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  PRIMARY KEY (`RMA_Assignment_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_RMA_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_AutoAssignment`
--

DROP TABLE IF EXISTS `RMA_AutoAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_AutoAssignment` (
  `RMA_AutoAssignment_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `DropDown1` int(11) DEFAULT NULL,
  `DropDown2` int(11) DEFAULT NULL,
  `DropDown3` int(11) DEFAULT NULL,
  PRIMARY KEY (`RMA_AutoAssignment_PKEY`),
  KEY `DropDown1` (`DropDown1`),
  KEY `DropDown2` (`DropDown2`),
  KEY `DropDown3` (`DropDown3`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_AutoAssignment_Assignment`
--

DROP TABLE IF EXISTS `RMA_AutoAssignment_Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_AutoAssignment_Assignment` (
  `RMA_AutoAssignment_Assignment_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_RMA_AutoAssignment_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`RMA_AutoAssignment_Assignment_PKEY`),
  KEY `FK_Tickets_AutoAssignment_PKEY` (`FK_RMA_AutoAssignment_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_List_Escalation`
--

DROP TABLE IF EXISTS `RMA_List_Escalation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_List_Escalation` (
  `RMA_List_Escalation_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`RMA_List_Escalation_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_List_Status`
--

DROP TABLE IF EXISTS `RMA_List_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_List_Status` (
  `RMA_List_Status_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  PRIMARY KEY (`RMA_List_Status_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_List_Type`
--

DROP TABLE IF EXISTS `RMA_List_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_List_Type` (
  `RMA_List_Type_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `ParentType` int(11) DEFAULT NULL,
  `ServiceCode` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`RMA_List_Type_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RMA_Transactions`
--

DROP TABLE IF EXISTS `RMA_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RMA_Transactions` (
  `RMA_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime NOT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FK_RMA_PKEY` int(11) NOT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RMA_Transactions_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_RMA_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review` (
  `Review_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime NOT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Sup_Employees_PKEY` int(11) DEFAULT NULL,
  `Review_Date` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL COMMENT 'Title at time of Review',
  `Review_Goal` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Review_Sup_Comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Review_Emp_Comments` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Review_Signed` tinyint(4) NOT NULL DEFAULT '0',
  `Review_Sup_Signed` tinyint(4) NOT NULL DEFAULT '0',
  `Review_Signature` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Employee''s Signature',
  `Review_Sup_Signature` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Supervisor''s Signature',
  `Review_CertsVerified` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Review_PKEY`),
  UNIQUE KEY `FK_Employees_PKEY_2` (`FK_Employees_PKEY`,`FK_Sup_Employees_PKEY`,`Review_Date`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Sup_Employees_PKEY` (`FK_Sup_Employees_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Review_Answers`
--

DROP TABLE IF EXISTS `Review_Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review_Answers` (
  `Review_Answers_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Review_PKEY` int(11) DEFAULT NULL,
  `FK_Review_Questions_PKEY` int(11) DEFAULT NULL,
  `Review_Answers_Score` decimal(10,2) DEFAULT NULL,
  `Review_Answers_Sup_Comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Review_Answers_PKEY`),
  UNIQUE KEY `FK_Review_PKEY_2` (`FK_Review_PKEY`,`FK_Review_Questions_PKEY`),
  KEY `FK_Review_PKEY` (`FK_Review_PKEY`),
  KEY `FK_Review_Questions_PKEY` (`FK_Review_Questions_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=2457 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Review_Categories`
--

DROP TABLE IF EXISTS `Review_Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review_Categories` (
  `Review_Categories_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Review_Categories_Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Review_Categories_Weight` int(11) DEFAULT NULL,
  `Review_Categories_Page_Number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Review_Categories_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Review_Questions`
--

DROP TABLE IF EXISTS `Review_Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review_Questions` (
  `Review_Questions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Review_Categories_PKEY` int(11) DEFAULT NULL,
  `Review_Questions_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Review_Questions_Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  UNIQUE KEY `Review_Questions_PKEY` (`Review_Questions_PKEY`),
  KEY `FK_Review_Categories_PKEY` (`FK_Review_Categories_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Review_Questions_Join_Titles`
--

DROP TABLE IF EXISTS `Review_Questions_Join_Titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review_Questions_Join_Titles` (
  `Review_Questions_Join_Titles_PKEY` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FK_Review_Questions_PKEY` int(11) DEFAULT NULL,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL,
  `Sort_Order` int(11) NOT NULL,
  PRIMARY KEY (`Review_Questions_Join_Titles_PKEY`),
  KEY `FK_Review_Questions_PKEY` (`FK_Review_Questions_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`),
  KEY `FK_Review_Questions_PKEY_2` (`FK_Review_Questions_PKEY`),
  KEY `FK_Employees_List_Title_PKEY_2` (`FK_Employees_List_Title_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SalesDeltas`
--

DROP TABLE IF EXISTS `SalesDeltas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesDeltas` (
  `Cust_CompanyAbr` text,
  `Est_Number` text,
  `Est_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SO_Number` text,
  `SO_Created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Est_SO_Delta` int(7) DEFAULT NULL,
  `Inv_Number` text,
  `Inv_Created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SO_Inv_Delta` int(7) DEFAULT NULL,
  `Pay_Number` int(11) DEFAULT NULL,
  `Pay_Created` date DEFAULT NULL,
  `Inv_Pay_Delta` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SalesLead_Transactions`
--

DROP TABLE IF EXISTS `SalesLead_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SalesLead_Transactions` (
  `SalesLead_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `Title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `isSticky` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SalesLead_Transactions_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `Schedule_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_Tickets_PKEY` int(11) NOT NULL,
  `FK_Employees_List_Title_PKEY` int(11) NOT NULL,
  `TitleIndex` int(11) DEFAULT NULL,
  `FK_Employees_PKEY` int(11) DEFAULT NULL,
  `Sched_Date` date NOT NULL,
  `Sched_Time` time DEFAULT NULL,
  `Sched_Duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`Schedule_PKEY`),
  UNIQUE KEY `no_dupes` (`FK_Tickets_PKEY`,`FK_Employees_PKEY`,`Sched_Date`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `TitleIndex` (`TitleIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=62545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Answers`
--

DROP TABLE IF EXISTS `Skill_Assessment_Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Answers` (
  `Skill_Assessment_Answers_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime NOT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Sup_Employees_PKEY` int(11) DEFAULT NULL,
  `Skill_Assessment_Answers_Date` date DEFAULT NULL,
  `FK_Skill_Assessment_Questions` int(11) DEFAULT NULL,
  `Skill_Assessment_Answers_Score` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Answers_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`,`FK_Sup_Employees_PKEY`,`FK_Skill_Assessment_Questions`),
  KEY `FK_Sup_Employees_PKEY` (`FK_Sup_Employees_PKEY`),
  KEY `FK_Skill_Assessment_Questions` (`FK_Skill_Assessment_Questions`)
) ENGINE=InnoDB AUTO_INCREMENT=13857 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Cat1`
--

DROP TABLE IF EXISTS `Skill_Assessment_Cat1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Cat1` (
  `Skill_Assessment_Cat1_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Cat1_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Cat2`
--

DROP TABLE IF EXISTS `Skill_Assessment_Cat2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Cat2` (
  `Skill_Assessment_Cat2_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Skill_Assessment_Questions_Cat1` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Cat2_PKEY`),
  KEY `FK_Skill_Assessment_Questions_Cat1` (`FK_Skill_Assessment_Questions_Cat1`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Cat3`
--

DROP TABLE IF EXISTS `Skill_Assessment_Cat3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Cat3` (
  `Skill_Assessment_Cat3_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Skill_Assessment_Questions_Cat2` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Cat3_PKEY`),
  KEY `FK_Skill_Assessment_Questions_Cat2` (`FK_Skill_Assessment_Questions_Cat2`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Cat4`
--

DROP TABLE IF EXISTS `Skill_Assessment_Cat4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Cat4` (
  `Skill_Assessment_Cat4_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Skill_Assessment_Questions_Cat3` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Cat4_PKEY`),
  KEY `FK_Skill_Assessment_Questions_Cat3` (`FK_Skill_Assessment_Questions_Cat3`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Questions`
--

DROP TABLE IF EXISTS `Skill_Assessment_Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Questions` (
  `Skill_Assessment_Questions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime NOT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Skill_Assessment_Questions_Cat1` int(11) DEFAULT NULL,
  `FK_Skill_Assessment_Questions_Cat2` int(11) DEFAULT NULL,
  `FK_Skill_Assessment_Questions_Cat3` int(11) DEFAULT NULL,
  `FK_Skill_Assessment_Questions_Cat4` int(11) DEFAULT NULL,
  `Skill_Assessment_Questions_Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Skill_Assessment_Questions_Type` int(11) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Questions_PKEY`),
  KEY `FK_Skill_Assessment_Questions_Cat1` (`FK_Skill_Assessment_Questions_Cat1`),
  KEY `FK_Skill_Assessment_Questions_Cat2` (`FK_Skill_Assessment_Questions_Cat2`),
  KEY `Skill_Assessment_Questions_Type` (`Skill_Assessment_Questions_Type`),
  KEY `FK_Skill_Assessment_Questions_Cat3` (`FK_Skill_Assessment_Questions_Cat3`),
  KEY `FK_Skill_Assessment_Questions_Cat4` (`FK_Skill_Assessment_Questions_Cat4`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Ranges`
--

DROP TABLE IF EXISTS `Skill_Assessment_Ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Ranges` (
  `Skill_Assessment_Ranges_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Employee_List_Title_PKEY` int(11) NOT NULL,
  `FK_Skill_Assessment_Cat1_PKEY` int(11) DEFAULT NULL,
  `FK_Skill_Assessment_Types_PKEY` int(11) DEFAULT NULL,
  `Min` int(11) DEFAULT NULL,
  `Max` int(11) DEFAULT NULL,
  PRIMARY KEY (`Skill_Assessment_Ranges_PKEY`),
  KEY `FK_Employee_List_Title_PKEY` (`FK_Employee_List_Title_PKEY`,`FK_Skill_Assessment_Cat1_PKEY`,`FK_Skill_Assessment_Types_PKEY`),
  KEY `FK_Employee_List_Title_PKEY_2` (`FK_Employee_List_Title_PKEY`),
  KEY `FK_Skill_Assessment_Cat1_PKEY` (`FK_Skill_Assessment_Cat1_PKEY`),
  KEY `FK_FK_Skill_Assessment_Types_PKEY` (`FK_Skill_Assessment_Types_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Skill_Assessment_Types`
--

DROP TABLE IF EXISTS `Skill_Assessment_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill_Assessment_Types` (
  `Skill_Assessment_Types_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Skill_Ass_Color` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Skill_Assessment_Types_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StartPage_Alert`
--

DROP TABLE IF EXISTS `StartPage_Alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StartPage_Alert` (
  `StartPage_Alert_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FK_Tickets_PKEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`StartPage_Alert_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets` (
  `Tickets_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL COMMENT 'Date Created',
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tickets_FT_TableName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Table_PKEY` int(11) DEFAULT NULL,
  `FK_Child_PKEY` int(11) DEFAULT NULL,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `Tick_Address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Company` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_CompanyAbr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Contact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_ContactAlt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_DateEndActual` date DEFAULT NULL,
  `Tick_DateEndProjected` date DEFAULT NULL COMMENT 'Requested Completion Date',
  `Tick_DateLogged` date DEFAULT NULL,
  `Tick_DateStartActual` date DEFAULT NULL,
  `Tick_DateStartProjected` date DEFAULT NULL COMMENT 'Requested Start Date',
  `Tick_DescriptionLong` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_DescriptionShort` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Description',
  `Tick_EmailCC` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_EmailTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Escalation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Escalation Level',
  `Tick_ExpiryDate` date DEFAULT NULL,
  `Tick_InactiveFlag` int(10) DEFAULT NULL,
  `Tick_Manufacturer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Materials` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Model` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Ticket Number',
  `Tick_PhoneAlt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_PhoneFax` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_PhoneOffice` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Room` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_SerialNumber` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Status` tinyint(4) DEFAULT NULL COMMENT 'Status',
  `Tick_TotalHours` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Type` int(11) NOT NULL,
  `Tick_subType1` int(11) NOT NULL,
  `Tick_subType2` int(11) NOT NULL,
  `Tick_WorkPerformed` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Diagnosis` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Reopened` tinyint(4) DEFAULT NULL,
  `Tick_Title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Tick_Maint_Status` tinyint(4) DEFAULT NULL,
  `Tick_EstHours` int(11) DEFAULT NULL,
  `Tick_NightWork` tinyint(11) DEFAULT NULL,
  `Tick_StartTime` time DEFAULT NULL,
  `Tick_Billable` int(11) NOT NULL DEFAULT '0',
  `Tick_Van` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Tickets_PKEY`),
  KEY `Tick_Status` (`Tick_Status`),
  KEY `Tick_Type` (`Tick_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=19369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Assignment`
--

DROP TABLE IF EXISTS `Tickets_Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Assignment` (
  `Tickets_Assignment_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Tickets_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  PRIMARY KEY (`Tickets_Assignment_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=89334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_AutoAssignment`
--

DROP TABLE IF EXISTS `Tickets_AutoAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_AutoAssignment` (
  `Tickets_AutoAssignment_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `DropDown1` int(11) DEFAULT NULL,
  `DropDown2` int(11) DEFAULT NULL,
  `DropDown3` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tickets_AutoAssignment_PKEY`),
  KEY `DropDown1` (`DropDown1`),
  KEY `DropDown2` (`DropDown2`),
  KEY `DropDown3` (`DropDown3`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_AutoAssignment_Assignment`
--

DROP TABLE IF EXISTS `Tickets_AutoAssignment_Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_AutoAssignment_Assignment` (
  `Tickets_AutoAssignment_Assignment_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Tickets_AutoAssignment_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tickets_AutoAssignment_Assignment_PKEY`),
  KEY `FK_Tickets_AutoAssignment_PKEY` (`FK_Tickets_AutoAssignment_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Email_Remind`
--

DROP TABLE IF EXISTS `Tickets_Email_Remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Email_Remind` (
  `Tickets_Email_Remind_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Tickets_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  `Tick_Email_DateTime` timestamp NULL DEFAULT NULL,
  `Tick_Email_Sent` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tickets_Email_Remind_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Flag`
--

DROP TABLE IF EXISTS `Tickets_Flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Flag` (
  `Tickets_Flag_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Tickets_PKEY` int(11) NOT NULL,
  `FK_Employees_PKEY` int(11) NOT NULL,
  PRIMARY KEY (`Tickets_Flag_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_List_Escalation`
--

DROP TABLE IF EXISTS `Tickets_List_Escalation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_List_Escalation` (
  `Tickets_List_Escalation_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`Tickets_List_Escalation_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_List_Maint_Status`
--

DROP TABLE IF EXISTS `Tickets_List_Maint_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_List_Maint_Status` (
  `Tickets_List_Maint_Status_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`Tickets_List_Maint_Status_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_List_Status`
--

DROP TABLE IF EXISTS `Tickets_List_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_List_Status` (
  `Tickets_List_Status_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  PRIMARY KEY (`Tickets_List_Status_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_List_Type`
--

DROP TABLE IF EXISTS `Tickets_List_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_List_Type` (
  `Tickets_List_Type_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `ParentType` int(11) DEFAULT NULL,
  `ServiceCode` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Tickets_List_Type_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tickets_Transactions`
--

DROP TABLE IF EXISTS `Tickets_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets_Transactions` (
  `Tickets_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` datetime NOT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FK_Tickets_PKEY` int(11) NOT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Tickets_Transactions_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=21027 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TimeCardTrans`
--

DROP TABLE IF EXISTS `TimeCardTrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeCardTrans` (
  `TimeCardTrans_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Holidays_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_TimeCards_PKEY` int(255) DEFAULT NULL,
  `FK_Tickets_PKEY` int(255) DEFAULT NULL,
  `FK_Employees_PKEY` int(255) DEFAULT NULL,
  `TCT_Date` date DEFAULT NULL,
  `TCT_Date_01` date DEFAULT NULL,
  `TCT_Date_02` date DEFAULT NULL,
  `TCT_Date_03` date DEFAULT NULL,
  `TCT_Date_04` date DEFAULT NULL,
  `TCT_Date_05` date DEFAULT NULL,
  `TCT_Date_06` date DEFAULT NULL,
  `TCT_Date_07` date DEFAULT NULL,
  `TCT_Hours` decimal(6,2) DEFAULT NULL,
  `TCT_HoursType` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TCT_Log` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TCT_Miles` decimal(6,2) DEFAULT NULL,
  `TCT_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TCT_QBJobName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TCT_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TCT_Approved_FK_Employees_PKEY` int(11) DEFAULT NULL,
  `TCT_Approved_Date` datetime DEFAULT NULL,
  `TCT_TicketNumber` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TCT_JobPhase` int(255) DEFAULT NULL,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`TimeCardTrans_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Holidays_PKEY` (`FK_Holidays_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_TimeCards_PKEY` (`FK_TimeCards_PKEY`),
  KEY `FK_Tickets_PKEY` (`FK_Tickets_PKEY`),
  KEY `FK_Employees_List_Title_PKEY` (`FK_Employees_List_Title_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=165448 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TimeCards`
--

DROP TABLE IF EXISTS `TimeCards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeCards` (
  `TimeCards_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Employees_PKEY` int(255) DEFAULT NULL,
  `TC_Date_01` date DEFAULT NULL,
  `TC_Date_02` date DEFAULT NULL,
  `TC_Date_03` date DEFAULT NULL,
  `TC_Date_04` date DEFAULT NULL,
  `TC_Date_05` date DEFAULT NULL,
  `TC_Date_06` date DEFAULT NULL,
  `TC_Date_07` date DEFAULT NULL,
  `TC_Log` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TC_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TC_Approved_Date` datetime DEFAULT NULL,
  `TC_Approved_FK_Employees_PKEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`TimeCards_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=33203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TimePunch`
--

DROP TABLE IF EXISTS `TimePunch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimePunch` (
  `TimePunch_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TimePunch_DateID` date DEFAULT NULL,
  `FK_Employees_PKEY` int(255) DEFAULT NULL,
  `p_01_BeginDay_Date` date DEFAULT NULL,
  `p_01_BeginDay_Time` time DEFAULT NULL,
  `p_02_Break_01_Out_Date` date DEFAULT NULL,
  `p_02_Break_01_Out_Time` time DEFAULT NULL,
  `p_03_Break_01_In_Date` date DEFAULT NULL,
  `p_03_Break_01_In_Time` time DEFAULT NULL,
  `p_04_Lunch_01_Out_Date` date DEFAULT NULL,
  `p_04_Lunch_01_Out_Time` time DEFAULT NULL,
  `p_05_Lunch_01_In_Date` date DEFAULT NULL,
  `p_05_Lunch_01_In_Time` time DEFAULT NULL,
  `p_06_Break_02_Out_Date` date DEFAULT NULL,
  `p_06_Break_02_Out_Time` time DEFAULT NULL,
  `p_07_Break_02_In_Date` date DEFAULT NULL,
  `p_07_Break_02_In_Time` time DEFAULT NULL,
  `p_08_Break_03_Out_Date` date DEFAULT NULL,
  `p_08_Break_03_Out_Time` time DEFAULT NULL,
  `p_09_Break_03_In_Date` date DEFAULT NULL,
  `p_09_Break_03_In_Time` time DEFAULT NULL,
  `p_10_Lunch_02_Out_Date` date DEFAULT NULL,
  `p_10_Lunch_02_Out_Time` time DEFAULT NULL,
  `p_11_Lunch_02_In_Date` date DEFAULT NULL,
  `p_11_Lunch_02_In_Time` time DEFAULT NULL,
  `p_12_Break_04_Out_Date` date DEFAULT NULL,
  `p_12_Break_04_Out_Time` time DEFAULT NULL,
  `p_13_Break_04_In_Date` date DEFAULT NULL,
  `p_13_Break_04_In_Time` time DEFAULT NULL,
  `p_14_EndDay_Date` date DEFAULT NULL,
  `p_14_EndDay_Time` time DEFAULT NULL,
  `PunchStatus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`TimePunch_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=58011 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `Vendor_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `Vendor_Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Vendor_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_log`
--

DROP TABLE IF EXISTS `access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_log` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(255) NOT NULL,
  UNIQUE KEY `PKEY` (`PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=229943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_combos`
--

DROP TABLE IF EXISTS `client_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_combos` (
  `Customers_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT NULL,
  `total_balance` decimal(20,5) DEFAULT NULL,
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `account_number` varchar(99) DEFAULT NULL,
  `job_type` varchar(159) DEFAULT NULL,
  `preferred_delivery_method` varchar(41) DEFAULT NULL,
  `site_contact` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` text,
  `Cust_Address1` text,
  `Cust_Address2` text,
  `Cust_BillTo_Address1` text,
  `Cust_BillTo_Address2` text,
  `Cust_BillTo_City` text,
  `Cust_BillTo_Company` text,
  `Cust_BillTo_Country` text,
  `Cust_BillTo_Email` text,
  `Cust_BillTo_Name` text,
  `Cust_AP_Name` text,
  `Cust_BillTo_Phone` text,
  `Cust_BillTo_State` text,
  `Cust_BillTo_Zip` int(10) DEFAULT NULL,
  `Cust_City` text,
  `Cust_CLNo` text,
  `Cust_Company` text,
  `Cust_CompanyAbr` text,
  `Cust_ContactAlt` text,
  `Cust_Country` text,
  `Cust_EmailCC` text,
  `Cust_EmailTo` text,
  `Cust_InactiveFlag` text,
  `Cust_NameAltFull` text,
  `Cust_NameFirst` text,
  `Cust_NameFull` text,
  `Cust_NameLast` text,
  `Cust_NameMiddle` text,
  `Cust_NameSalutation` text,
  `Cust_PhoneAlt` text,
  `Cust_PhoneCell` text,
  `Cust_PhoneFax` text,
  `Cust_PhoneOffice` text,
  `Cust_PONo` text,
  `Cust_Rep` text,
  `Cust_SaleTaxCode` text,
  `Cust_ShipTo_Address1` text,
  `Cust_ShipTo_Address2` text,
  `Cust_ShipTo_City` text,
  `Cust_ShipTo_Company` text,
  `Cust_ShipTo_Country` text,
  `Cust_ShipTo_Email` text,
  `Cust_ShipTo_Name` text,
  `Cust_ShipTo_Phone` text,
  `Cust_ShipTo_State` text,
  `Cust_ShipTo_Zip` int(10) DEFAULT NULL,
  `Cust_State` text,
  `Cust_Terms` text,
  `Cust_Type` text,
  `Cust_Zip` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `Customers_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `total_balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `account_number` varchar(99) DEFAULT NULL,
  `job_type` varchar(159) DEFAULT NULL,
  `preferred_delivery_method` varchar(41) DEFAULT NULL,
  `site_contact` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text,
  `Cust_Address1` text,
  `Cust_Address2` text,
  `Cust_BillTo_Address1` text,
  `Cust_BillTo_Address2` text,
  `Cust_BillTo_City` text,
  `Cust_BillTo_Company` text,
  `Cust_BillTo_Country` text,
  `Cust_BillTo_Email` text COMMENT 'A/P Email',
  `Cust_BillTo_Name` text,
  `Cust_AP_Name` text COMMENT 'A/P Name',
  `Cust_BillTo_Phone` text COMMENT 'A/P Phone',
  `Cust_BillTo_State` text,
  `Cust_BillTo_Zip` int(10) DEFAULT NULL,
  `Cust_City` text,
  `Cust_CLNo` text,
  `Cust_Company` text,
  `Cust_CompanyAbr` text COMMENT 'Customer Short Name',
  `Cust_ContactAlt` text,
  `Cust_Country` text,
  `Cust_EmailCC` text,
  `Cust_EmailTo` text,
  `Cust_InactiveFlag` text,
  `Cust_NameAltFull` text,
  `Cust_NameFirst` text,
  `Cust_NameFull` text,
  `Cust_NameLast` text,
  `Cust_NameMiddle` text,
  `Cust_NameSalutation` text,
  `Cust_PhoneAlt` text,
  `Cust_PhoneCell` text,
  `Cust_PhoneFax` text COMMENT 'A/P FAX',
  `Cust_PhoneOffice` text,
  `Cust_PONo` text,
  `Cust_Rep` text,
  `Cust_SaleTaxCode` text,
  `Cust_ShipTo_Address1` text,
  `Cust_ShipTo_Address2` text,
  `Cust_ShipTo_City` text,
  `Cust_ShipTo_Company` text,
  `Cust_ShipTo_Country` text,
  `Cust_ShipTo_Email` text,
  `Cust_ShipTo_Name` text,
  `Cust_ShipTo_Phone` text,
  `Cust_ShipTo_State` text,
  `Cust_ShipTo_Zip` int(10) DEFAULT NULL,
  `Cust_State` text,
  `Cust_Terms` text,
  `Cust_Type` text,
  `Cust_Zip` int(10) DEFAULT NULL,
  PRIMARY KEY (`Customers_PKEY`),
  KEY `id` (`id`),
  KEY `is_active` (`is_active`),
  KEY `full_name` (`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cts_answers`
--

DROP TABLE IF EXISTS `cts_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cts_answers` (
  `cts_answers_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `FK_users_PKEY` int(255) NOT NULL,
  `superemail` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question1` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question2` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question3` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question4` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question5` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question6` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question7` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question8` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question9` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question10` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question11` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question12` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question13` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question14` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question15` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question16` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question17` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question18` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question19` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question20` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question21` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question22` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question23` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question24` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question25` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question26` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question27` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question28` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question29` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question30` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question31` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question32` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question33` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question34` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question35` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question36` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question37` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question38` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question39` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question40` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question41` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question42` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question43` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question44` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question45` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question46` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question47` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question48` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question49` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question50` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question51` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question52` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question53` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question54` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question55` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question56` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question57` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question58` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question59` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question60` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question61` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question62` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question63` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question64` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question65` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question66` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question67` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question68` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question69` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question70` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question71` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question72` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question73` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question74` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question75` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question76` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question77` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question78` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question79` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question80` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question81` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question82` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question83` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question84` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question85` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question86` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question87` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question88` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question89` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question90` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question91` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question92` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question93` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question94` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question95` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question96` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question97` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question98` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question99` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question100` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question101` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question102` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question103` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question104` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question105` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question106` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question107` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question108` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question109` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question110` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question111` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question112` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question113` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question114` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question115` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question116` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question117` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question118` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question119` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question120` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question121` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question122` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question123` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question124` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question125` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question126` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question127` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question128` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question129` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question130` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question131` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question132` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question133` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question134` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question135` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question136` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question137` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question138` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question139` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question140` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question141` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question142` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question143` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question144` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question145` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question146` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question147` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question148` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question149` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question150` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question151` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question152` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question153` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question154` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question155` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question156` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question157` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question158` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question159` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question160` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question161` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question162` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question163` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question164` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question165` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question166` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question167` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question168` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question169` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cts_answers_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estimate_combos`
--

DROP TABLE IF EXISTS `estimate_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimate_combos` (
  `qEstimates_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `template` varchar(159) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(11) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `po_number` varchar(25) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `fob` varchar(13) DEFAULT NULL,
  `subtotal` decimal(20,5) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `sales_tax_percentage` float DEFAULT NULL,
  `sales_tax_total` decimal(20,5) DEFAULT NULL,
  `total_amount` decimal(20,5) DEFAULT NULL,
  `memo` varchar(4095) DEFAULT NULL,
  `customer_msg` varchar(101) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `customer_sales_tax_code` varchar(3) DEFAULT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` text,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `Est_Amount` decimal(10,2) DEFAULT NULL,
  `Est_Company` text,
  `Est_CompanyAbr` text,
  `Est_Contact` text,
  `Est_ContactAlt` text,
  `Est_CPR` text,
  `Est_DateCompletion_Actual` date DEFAULT NULL,
  `Est_DateCompletion_Estimated` date DEFAULT NULL,
  `Est_DateCreated` date DEFAULT NULL,
  `Est_DateFDOB` date DEFAULT NULL,
  `Est_DateStarted_Actual` date DEFAULT NULL,
  `Est_DateStarted_Estimated` date DEFAULT NULL,
  `Est_EmailCC` text,
  `Est_EmailTo` text,
  `Est_NameFirst` text,
  `Est_NameLast` text,
  `Est_NameMiddle` text,
  `Est_NameSalutation` text,
  `Est_Notes` text,
  `Est_Number` text,
  `Est_PercentComplete` int(10) DEFAULT NULL,
  `Est_PhoneAlt` text,
  `Est_PhoneFax` text,
  `Est_PhoneOffice` text,
  `Est_ProjectName` text,
  `Est_Status` text,
  `Est_URL` text,
  `Est_URL BU` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estimate_lines`
--

DROP TABLE IF EXISTS `estimate_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimate_lines` (
  `id` varchar(255) NOT NULL,
  `estimate_id` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `desc` varchar(4095) DEFAULT NULL,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(31) DEFAULT NULL,
  `override_uom_set` varchar(31) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `rate_percent` float DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `inventory_site` varchar(31) DEFAULT NULL,
  `inventory_site_location` varchar(31) DEFAULT NULL,
  `sales_tax_code` varchar(3) DEFAULT NULL,
  `markup_rate` decimal(20,5) DEFAULT NULL,
  `markup_rate_percent` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `estimate_id` (`estimate_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimates` (
  `qEstimates_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `template` varchar(159) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(11) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `po_number` varchar(25) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `fob` varchar(13) DEFAULT NULL,
  `subtotal` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `sales_tax_percentage` float DEFAULT NULL,
  `sales_tax_total` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `memo` varchar(4095) DEFAULT NULL,
  `customer_msg` varchar(101) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `customer_sales_tax_code` varchar(3) DEFAULT NULL,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `Est_Amount` decimal(10,2) DEFAULT NULL,
  `Est_Company` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_CompanyAbr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_Contact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_ContactAlt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_CPR` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_DateCompletion_Actual` date DEFAULT NULL,
  `Est_DateCompletion_Estimated` date DEFAULT NULL,
  `Est_DateCreated` date DEFAULT NULL,
  `Est_DateFDOB` date DEFAULT NULL,
  `Est_DateStarted_Actual` date DEFAULT NULL,
  `Est_DateStarted_Estimated` date DEFAULT NULL,
  `Est_EmailCC` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_EmailTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameFirst` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameLast` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameMiddle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameSalutation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Salutation -',
  `Est_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_Number` text,
  `Est_PercentComplete` int(10) DEFAULT NULL,
  `Est_PhoneAlt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_PhoneFax` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_PhoneOffice` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qEstimates_PKEY`),
  UNIQUE KEY `qEstimates_PKEY` (`qEstimates_PKEY`),
  KEY `id` (`id`),
  KEY `is_active` (`is_active`),
  KEY `ref_number` (`ref_number`),
  KEY `customer_id` (`customer_id`,`customer_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9896 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `asset_id` varchar(30) DEFAULT NULL,
  `serial_number` varchar(30) DEFAULT NULL,
  `machine_name` varchar(30) DEFAULT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `processor` varchar(30) DEFAULT NULL,
  `processor_speed` varchar(30) DEFAULT NULL,
  `memory_type` varchar(30) DEFAULT NULL,
  `memory_size` varchar(30) DEFAULT NULL,
  `display_size` varchar(30) DEFAULT NULL,
  `OS` varchar(30) DEFAULT NULL,
  `checked_out_to` varchar(30) DEFAULT NULL,
  `checked_out_date` mediumtext,
  `check_in_date_expected` mediumtext,
  `date_purchased` date DEFAULT NULL,
  `vendor_purchased_from` varchar(30) DEFAULT NULL,
  `warranty` varchar(30) DEFAULT NULL,
  `warranty_active` varchar(30) DEFAULT NULL,
  `warranty_expiration_date` date DEFAULT NULL,
  `phoneNumber` mediumtext,
  PRIMARY KEY (`PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_combos`
--

DROP TABLE IF EXISTS `invoice_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_combos` (
  `qInvoices_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `estimate_id` varchar(255) DEFAULT NULL,
  `sales_order_id` varchar(255) DEFAULT NULL,
  `ar_account` varchar(159) DEFAULT NULL,
  `template` varchar(31) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(11) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_finance_charge` tinyint(1) DEFAULT NULL,
  `po_number` varchar(25) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `fob` varchar(13) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `ship_method` varchar(15) DEFAULT NULL,
  `subtotal` decimal(20,5) DEFAULT NULL,
  `item_sales_tax` varchar(31) DEFAULT NULL,
  `sales_tax_percentage` float DEFAULT NULL,
  `sales_tax_total` decimal(20,5) DEFAULT NULL,
  `applied_amount` decimal(20,5) DEFAULT NULL,
  `balance_remaining` decimal(20,5) DEFAULT NULL,
  `memo` varchar(4095) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `customer_msg` varchar(101) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `customer_sales_tax_code` varchar(3) DEFAULT NULL,
  `suggested_discount_amount` decimal(20,5) DEFAULT NULL,
  `suggested_discount_date` date DEFAULT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` text,
  `FK_Project_PKEY` int(255) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `Inv_Amount` decimal(10,2) DEFAULT NULL,
  `Inv_DateCreated` date DEFAULT NULL,
  `Inv_DateInvoiceApproved` date DEFAULT NULL,
  `Inv_DateInvoiceConfirmed` date DEFAULT NULL,
  `Inv_DateInvoicePaid` date DEFAULT NULL,
  `Inv_DateScheduled` date DEFAULT NULL,
  `Inv_DateSent` date DEFAULT NULL,
  `Inv_Description` text,
  `Inv_InvConfirmedNote` text,
  `Inv_InvSentTo` text,
  `Inv_InvSentVia` tinyint(4) DEFAULT NULL,
  `Inv_Notes` text,
  `Inv_Number` text,
  `Inv_PaidMethod` text,
  `Inv_PaymentURL` text,
  `Inv_PaymentURL BU` text,
  `Inv_ProjectName` text,
  `Inv_Status` tinyint(4) DEFAULT NULL,
  `Inv_Terms` tinyint(4) DEFAULT NULL,
  `Inv_URL` text,
  `Inv_URL BU` text,
  `AutolinkPDF` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_lines`
--

DROP TABLE IF EXISTS `invoice_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_lines` (
  `id` varchar(255) NOT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `desc` text,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `override_uom_set` varchar(255) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `rate_percent` float DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `inventory_site` varchar(255) DEFAULT NULL,
  `inventory_site_location` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `lot_number` varchar(255) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `sales_tax_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `invoice_id` (`invoice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `qInvoices_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `estimate_id` varchar(255) DEFAULT NULL,
  `sales_order_id` varchar(255) DEFAULT NULL,
  `ar_account` varchar(159) DEFAULT NULL,
  `template` varchar(31) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(11) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_finance_charge` tinyint(1) DEFAULT NULL,
  `po_number` varchar(25) DEFAULT NULL,
  `terms` varchar(31) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(5) DEFAULT NULL,
  `fob` varchar(13) DEFAULT NULL,
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
  `suggested_discount_amount` decimal(20,5) DEFAULT NULL,
  `suggested_discount_date` date DEFAULT NULL,
  `CreationTimeStamp` datetime DEFAULT NULL COMMENT 'Date Created',
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Project_PKEY` int(255) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `Inv_Amount` decimal(10,2) DEFAULT NULL COMMENT 'Inv Amount',
  `Inv_DateCreated` date DEFAULT NULL,
  `Inv_DateInvoiceApproved` date DEFAULT NULL COMMENT 'Date Aprv -',
  `Inv_DateInvoiceConfirmed` date DEFAULT NULL COMMENT 'Date Conf -',
  `Inv_DateInvoicePaid` date DEFAULT NULL,
  `Inv_DateScheduled` date DEFAULT NULL COMMENT 'Sch Date -',
  `Inv_DateSent` date DEFAULT NULL COMMENT 'Date Sent',
  `Inv_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_InvConfirmedNote` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Conf # -',
  `Inv_InvSentTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'To',
  `Inv_InvSentVia` tinyint(4) DEFAULT NULL COMMENT 'Via',
  `Inv_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_Number` text COMMENT 'Inv Number',
  `Inv_PaidMethod` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_PaymentURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_PaymentURL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_Status` tinyint(4) DEFAULT NULL COMMENT 'Inv Status',
  `Inv_Terms` tinyint(4) DEFAULT NULL COMMENT 'Terms',
  `Inv_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Inv URL',
  `Inv_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `AutolinkPDF` int(1) DEFAULT NULL,
  KEY `qInvoices_PKEY` (`qInvoices_PKEY`),
  KEY `id` (`id`),
  KEY `customer_id` (`customer_id`,`customer_type`),
  KEY `estimate_id` (`estimate_id`),
  KEY `sales_order_id` (`sales_order_id`),
  KEY `ref_number` (`ref_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job1s`
--

DROP TABLE IF EXISTS `job1s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job1s` (
  `Jobs_PKEY` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) NOT NULL DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text,
  `FK_JobID_Parent` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `Job_Company` text,
  `Job_CompanyAbr` text,
  `Job_Contact` text,
  `Job_ContactAlt` text,
  `Job_ContactName` text,
  `Job_CustCLNo` text,
  `Job_CustPONo` text,
  `Job_DateEndActual` date DEFAULT NULL COMMENT 'Job Actual End Date',
  `Job_DateEndProjected` date DEFAULT NULL COMMENT 'Job Projected End Date',
  `Job_DateStartActual` date DEFAULT NULL COMMENT 'Job Actual Start Date',
  `Job_DateStartProjected` date DEFAULT NULL COMMENT 'Job Projected Start Date',
  `Job_DefaultJob` text,
  `Job_Description_Long` text,
  `Job_Description_Short` text,
  `Job_DisplayIndent` int(10) DEFAULT NULL,
  `Job_EmailCC` text,
  `Job_EmailTo` text,
  `Job_ExpiryDate` date DEFAULT NULL,
  `Job_HoursAmount_Default` int(10) DEFAULT NULL,
  `Job_HoursAmount_Lock` int(10) DEFAULT NULL,
  `Job_HoursAmount_Max` int(10) DEFAULT NULL,
  `Job_HourType` text,
  `Job_InactiveFlag` text COMMENT 'Job Is Active',
  `Job_NameFirst` text,
  `Job_NameLast` text,
  `Job_NameMiddle` text,
  `Job_NameSalutation` text,
  `Job_Notes` text,
  `Job_PhoneAlt` text,
  `Job_PhoneFax` text,
  `Job_PhoneOffice` text,
  `Job_QB_JobName` text,
  `Portal_Job_Status` text,
  `Portal_Job_Type` text,
  `Job_PhoneCell` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job2s`
--

DROP TABLE IF EXISTS `job2s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job2s` (
  `Jobs_PKEY` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) NOT NULL DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text,
  `FK_JobID_Parent` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `Job_Company` text,
  `Job_CompanyAbr` text,
  `Job_Contact` text,
  `Job_ContactAlt` text,
  `Job_ContactName` text,
  `Job_CustCLNo` text,
  `Job_CustPONo` text,
  `Job_DateEndActual` date DEFAULT NULL COMMENT 'Job Actual End Date',
  `Job_DateEndProjected` date DEFAULT NULL COMMENT 'Job Projected End Date',
  `Job_DateStartActual` date DEFAULT NULL COMMENT 'Job Actual Start Date',
  `Job_DateStartProjected` date DEFAULT NULL COMMENT 'Job Projected Start Date',
  `Job_DefaultJob` text,
  `Job_Description_Long` text,
  `Job_Description_Short` text,
  `Job_DisplayIndent` int(10) DEFAULT NULL,
  `Job_EmailCC` text,
  `Job_EmailTo` text,
  `Job_ExpiryDate` date DEFAULT NULL,
  `Job_HoursAmount_Default` int(10) DEFAULT NULL,
  `Job_HoursAmount_Lock` int(10) DEFAULT NULL,
  `Job_HoursAmount_Max` int(10) DEFAULT NULL,
  `Job_HourType` text,
  `Job_InactiveFlag` text COMMENT 'Job Is Active',
  `Job_NameFirst` text,
  `Job_NameLast` text,
  `Job_NameMiddle` text,
  `Job_NameSalutation` text,
  `Job_Notes` text,
  `Job_PhoneAlt` text,
  `Job_PhoneFax` text,
  `Job_PhoneOffice` text,
  `Job_QB_JobName` text,
  `Portal_Job_Status` text,
  `Portal_Job_Type` text,
  `Job_PhoneCell` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job3s`
--

DROP TABLE IF EXISTS `job3s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job3s` (
  `Jobs_PKEY` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) NOT NULL DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text,
  `FK_JobID_Parent` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `Job_Company` text,
  `Job_CompanyAbr` text,
  `Job_Contact` text,
  `Job_ContactAlt` text,
  `Job_ContactName` text,
  `Job_CustCLNo` text,
  `Job_CustPONo` text,
  `Job_DateEndActual` date DEFAULT NULL COMMENT 'Job Actual End Date',
  `Job_DateEndProjected` date DEFAULT NULL COMMENT 'Job Projected End Date',
  `Job_DateStartActual` date DEFAULT NULL COMMENT 'Job Actual Start Date',
  `Job_DateStartProjected` date DEFAULT NULL COMMENT 'Job Projected Start Date',
  `Job_DefaultJob` text,
  `Job_Description_Long` text,
  `Job_Description_Short` text,
  `Job_DisplayIndent` int(10) DEFAULT NULL,
  `Job_EmailCC` text,
  `Job_EmailTo` text,
  `Job_ExpiryDate` date DEFAULT NULL,
  `Job_HoursAmount_Default` int(10) DEFAULT NULL,
  `Job_HoursAmount_Lock` int(10) DEFAULT NULL,
  `Job_HoursAmount_Max` int(10) DEFAULT NULL,
  `Job_HourType` text,
  `Job_InactiveFlag` text COMMENT 'Job Is Active',
  `Job_NameFirst` text,
  `Job_NameLast` text,
  `Job_NameMiddle` text,
  `Job_NameSalutation` text,
  `Job_Notes` text,
  `Job_PhoneAlt` text,
  `Job_PhoneFax` text,
  `Job_PhoneOffice` text,
  `Job_QB_JobName` text,
  `Portal_Job_Status` text,
  `Portal_Job_Type` text,
  `Job_PhoneCell` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job4s`
--

DROP TABLE IF EXISTS `job4s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job4s` (
  `Jobs_PKEY` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) NOT NULL DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) NOT NULL DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text,
  `FK_JobID_Parent` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `Job_Company` text,
  `Job_CompanyAbr` text,
  `Job_Contact` text,
  `Job_ContactAlt` text,
  `Job_ContactName` text,
  `Job_CustCLNo` text,
  `Job_CustPONo` text,
  `Job_DateEndActual` date DEFAULT NULL COMMENT 'Job Actual End Date',
  `Job_DateEndProjected` date DEFAULT NULL COMMENT 'Job Projected End Date',
  `Job_DateStartActual` date DEFAULT NULL COMMENT 'Job Actual Start Date',
  `Job_DateStartProjected` date DEFAULT NULL COMMENT 'Job Projected Start Date',
  `Job_DefaultJob` text,
  `Job_Description_Long` text,
  `Job_Description_Short` text,
  `Job_DisplayIndent` int(10) DEFAULT NULL,
  `Job_EmailCC` text,
  `Job_EmailTo` text,
  `Job_ExpiryDate` date DEFAULT NULL,
  `Job_HoursAmount_Default` int(10) DEFAULT NULL,
  `Job_HoursAmount_Lock` int(10) DEFAULT NULL,
  `Job_HoursAmount_Max` int(10) DEFAULT NULL,
  `Job_HourType` text,
  `Job_InactiveFlag` text COMMENT 'Job Is Active',
  `Job_NameFirst` text,
  `Job_NameLast` text,
  `Job_NameMiddle` text,
  `Job_NameSalutation` text,
  `Job_Notes` text,
  `Job_PhoneAlt` text,
  `Job_PhoneFax` text,
  `Job_PhoneOffice` text,
  `Job_QB_JobName` text,
  `Portal_Job_Status` text,
  `Portal_Job_Type` text,
  `Job_PhoneCell` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_combos`
--

DROP TABLE IF EXISTS `job_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_combos` (
  `Jobs_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) DEFAULT NULL,
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT NULL,
  `total_balance` decimal(20,5) DEFAULT NULL,
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
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` text,
  `FK_JobID_Parent` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `Job_Company` text,
  `Job_CompanyAbr` text,
  `Job_Contact` text,
  `Job_ContactAlt` text,
  `Job_ContactName` text,
  `Job_CustCLNo` text,
  `Job_CustPONo` text,
  `Job_DateEndActual` date DEFAULT NULL,
  `Job_DateEndProjected` date DEFAULT NULL,
  `Job_DateStartActual` date DEFAULT NULL,
  `Job_DateStartProjected` date DEFAULT NULL,
  `Job_DefaultJob` text,
  `Job_Description_Long` text,
  `Job_Description_Short` text,
  `Job_DisplayIndent` int(10) DEFAULT NULL,
  `Job_EmailCC` text,
  `Job_EmailTo` text,
  `Job_ExpiryDate` date DEFAULT NULL,
  `Job_HoursAmount_Default` int(10) DEFAULT NULL,
  `Job_HoursAmount_Lock` int(10) DEFAULT NULL,
  `Job_HoursAmount_Max` int(10) DEFAULT NULL,
  `Job_HourType` text,
  `Job_InactiveFlag` text,
  `Job_NameFirst` text,
  `Job_NameLast` text,
  `Job_NameMiddle` text,
  `Job_NameSalutation` text,
  `Job_Notes` text,
  `Job_PhoneAlt` text,
  `Job_PhoneFax` text,
  `Job_PhoneOffice` text,
  `Job_QB_JobName` text,
  `Portal_Job_Status` text,
  `Portal_Job_Type` text,
  `Job_PhoneCell` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_phases`
--

DROP TABLE IF EXISTS `job_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_phases` (
  `job_phases_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `job_phases_name` text NOT NULL,
  `job_phases_sort_order` int(255) NOT NULL,
  PRIMARY KEY (`job_phases_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `Jobs_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text,
  `FK_JobID_Parent` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `Job_Company` text,
  `Job_Company_QBName_Display.calc` text,
  `Job_CompanyAbr` text,
  `Job_Contact` text,
  `Job_ContactAlt` text,
  `Job_ContactName` text,
  `Job_CustCLNo` text,
  `Job_CustPONo` text,
  `Job_DateEndActual` date DEFAULT NULL COMMENT 'Job Actual End Date',
  `Job_DateEndProjected` date DEFAULT NULL COMMENT 'Job Projected End Date',
  `Job_DateStartActual` date DEFAULT NULL COMMENT 'Job Actual Start Date',
  `Job_DateStartProjected` date DEFAULT NULL COMMENT 'Job Projected Start Date',
  `Job_DefaultJob` text,
  `Job_Description_Long` text,
  `Job_Description_Short` text,
  `Job_DisplayIndent` int(10) DEFAULT NULL,
  `Job_EmailCC` text,
  `Job_EmailTo` text,
  `Job_ExpiryDate` date DEFAULT NULL,
  `Job_HoursAmount_Default` int(10) DEFAULT NULL,
  `Job_HoursAmount_Lock` int(10) DEFAULT NULL,
  `Job_HoursAmount_Max` int(10) DEFAULT NULL,
  `Job_HourType` text,
  `Job_InactiveFlag` text COMMENT 'Job Is Active',
  `Job_NameFirst` text,
  `Job_NameLast` text,
  `Job_NameMiddle` text,
  `Job_NameSalutation` text,
  `Job_Notes` text,
  `Job_Number.calc` text,
  `Job_PhoneAlt` text,
  `Job_PhoneFax` text,
  `Job_PhoneOffice` text,
  `Job_QB_JobName` text,
  `Job_QB_JobName_Hierarc.calc` text,
  `Job_Status` text,
  `Job_Type` text,
  `Job_PhoneCell` text,
  PRIMARY KEY (`Jobs_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_JobID_Parent` (`FK_JobID_Parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2690 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`PKEY`),
  KEY `userid` (`userid`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `menu_header` varchar(50) NOT NULL,
  `menu_item` varchar(50) NOT NULL,
  `menu_path` varchar(255) NOT NULL,
  `menu_path_mobile` mediumtext,
  `sortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_combo_matches`
--

DROP TABLE IF EXISTS `payment_combo_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_combo_matches` (
  `qInvoices_PKEY` int(255) DEFAULT '0',
  `Payments_PKEY` int(11) NOT NULL DEFAULT '0',
  `QB Payment id` varchar(255) NOT NULL,
  `Portal Amount` decimal(10,2) DEFAULT NULL,
  `QB Amount` varchar(22) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Portal Date` date DEFAULT NULL,
  `QB Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_combos`
--

DROP TABLE IF EXISTS `payment_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_combos` (
  `Payments_PKEY` int(11) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `ar_account` varchar(159) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(20) DEFAULT NULL,
  `total_amount` decimal(20,5) DEFAULT NULL,
  `payment_method` varchar(31) DEFAULT NULL,
  `memo` varchar(4095) DEFAULT NULL,
  `deposit_to_account` varchar(159) DEFAULT NULL,
  `unused_payment` decimal(20,5) DEFAULT NULL,
  `unused_credits` decimal(20,5) DEFAULT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` text,
  `FK_qInvoices_PKEY` int(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentNumber` text,
  `FK_PaymentMethod_PKEY` tinyint(4) DEFAULT NULL,
  `URL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(50) DEFAULT NULL,
  `groupid` int(50) DEFAULT NULL,
  `resourceid` int(50) DEFAULT NULL,
  `menuid` int(50) DEFAULT NULL,
  `pageid` int(255) DEFAULT NULL,
  `access` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `read_access` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `write_access` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_access` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=10143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_combos`
--

DROP TABLE IF EXISTS `project_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_combos` (
  `Project_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) DEFAULT NULL,
  `company_name` varchar(41) DEFAULT NULL,
  `salutation` varchar(15) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `middle_name` varchar(5) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `job_title` varchar(41) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT NULL,
  `total_balance` decimal(20,5) DEFAULT NULL,
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
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` mediumtext,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` mediumtext,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_ProjMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Foreman_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechForeman_Employees_PKEY` int(11) DEFAULT NULL,
  `Project_Name` text,
  `Project_Type` text,
  `Project_DateStartEstimated` date DEFAULT NULL,
  `Project_DateEndEstimated` date DEFAULT NULL,
  `Project_DateStartActual` date DEFAULT NULL,
  `Project_DateEndActual` date DEFAULT NULL,
  `Project_RoughInStart` date DEFAULT NULL,
  `Project_RoughInEnd` date DEFAULT NULL,
  `Project_DeviceInstallStart` date DEFAULT NULL,
  `Project_DeviceInstallEnd` date DEFAULT NULL,
  `Project_CommissioningStart` date DEFAULT NULL,
  `Project_CommissioningEnd` date DEFAULT NULL,
  `Project_ScopeText` text,
  `Project_NameSalutation` text,
  `Project_NameFirst` text,
  `Project_NameMiddle` text,
  `Project_NameLast` text,
  `Project_PhoneMain` text,
  `Project_EmailMain` text,
  `Project_PhoneAlternate` text,
  `Project_EmailCC` text,
  `Project_PhoneCell` text,
  `Project_PhoneFax` text,
  `Project_Address1` text,
  `Project_Address2` text,
  `Project_Address_Parking1` text,
  `Project_Address_Parking2` text,
  `Project_City` text,
  `Project_State` text,
  `Project_Zip` text,
  `Project_Park_1_Address` text,
  `Project_Park_1_Address_City` text,
  `Project_Park_1_Address_State` text,
  `Project_Park_1_Address_Zip` int(11) DEFAULT NULL,
  `Project_Park_2_Address` text,
  `Project_Park_2_Address_City` text,
  `Project_Park_2_Address_State` text,
  `Project_Park_2_Address_Zip` int(11) DEFAULT NULL,
  `Project_PercentComplete` int(11) DEFAULT NULL,
  `Project_IsClosed` text,
  `Project_Status` tinyint(4) DEFAULT NULL,
  `Project_QuotedTechLabor` int(255) DEFAULT NULL,
  `Project_QuotedRILabor` int(255) DEFAULT NULL,
  `Project_QuotedDILabor` int(255) DEFAULT NULL,
  `Project_QuotedCOLabor` int(255) DEFAULT NULL,
  `Project_QuotedEngLabor` int(255) DEFAULT NULL,
  `Project_QuotedPMLabor` int(255) DEFAULT NULL,
  `Project_UseCase` text,
  `Project_QuotedLgstLabor` int(11) DEFAULT NULL,
  `Project_QuotedMaintLabor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_qb_portal_comparisons`
--

DROP TABLE IF EXISTS `project_qb_portal_comparisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_qb_portal_comparisons` (
  `Project_PKEY` int(11) NOT NULL DEFAULT '0',
  `Calculated Portal Full Name` mediumtext,
  `Full name in Quickbooks` varchar(209) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `Project_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` mediumtext,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` mediumtext,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_ProjMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Foreman_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechForeman_Employees_PKEY` int(11) DEFAULT NULL,
  `Project_Name` text,
  `Project_Type` text,
  `Project_DateStartEstimated` date DEFAULT NULL,
  `Project_DateEndEstimated` date DEFAULT NULL,
  `Project_DateStartActual` date DEFAULT NULL,
  `Project_DateEndActual` date DEFAULT NULL,
  `Project_RoughInStart` date DEFAULT NULL,
  `Project_RoughInEnd` date DEFAULT NULL,
  `Project_DeviceInstallStart` date DEFAULT NULL,
  `Project_DeviceInstallEnd` date DEFAULT NULL,
  `Project_CommissioningStart` date DEFAULT NULL,
  `Project_CommissioningEnd` date DEFAULT NULL,
  `Project_ScopeText` text,
  `Project_NameSalutation` text,
  `Project_NameFirst` text,
  `Project_NameMiddle` text,
  `Project_NameLast` text,
  `Project_PhoneMain` text,
  `Project_EmailMain` text,
  `Project_PhoneAlternate` text,
  `Project_EmailCC` text,
  `Project_PhoneCell` text,
  `Project_PhoneFax` text,
  `Project_Address1` text COMMENT 'Project Site Address',
  `Project_Address2` text,
  `Project_Address_Parking1` text COMMENT 'Project Primary Parking',
  `Project_Address_Parking2` text COMMENT 'Project Secondary Parking',
  `Project_City` text,
  `Project_State` text,
  `Project_Zip` text,
  `Project_Park_1_Address` text COMMENT 'Primary Parking',
  `Project_Park_1_Address_City` text COMMENT 'Primary Parking City',
  `Project_Park_1_Address_State` text COMMENT 'Primary Parking State',
  `Project_Park_1_Address_Zip` int(11) DEFAULT NULL COMMENT 'Primary Parking Zip Code',
  `Project_Park_2_Address` text COMMENT 'Secondary Parking Address',
  `Project_Park_2_Address_City` text COMMENT 'Secondary Parking City',
  `Project_Park_2_Address_State` text COMMENT 'Secondary Parking State',
  `Project_Park_2_Address_Zip` int(11) DEFAULT NULL COMMENT 'Secondary Parking Zip Code',
  `Project_PercentComplete` int(11) DEFAULT NULL,
  `Project_IsClosed` text,
  `Project_Status` tinyint(4) DEFAULT NULL,
  `Project_QuotedTechLabor` int(255) DEFAULT NULL,
  `Project_QuotedRILabor` int(255) DEFAULT NULL,
  `Project_QuotedDILabor` int(255) DEFAULT NULL,
  `Project_QuotedCOLabor` int(255) DEFAULT NULL,
  `Project_QuotedEngLabor` int(255) DEFAULT NULL,
  `Project_QuotedPMLabor` int(255) DEFAULT NULL,
  `Project_UseCase` text,
  `Project_QuotedLgstLabor` int(11) DEFAULT NULL,
  `Project_QuotedMaintLabor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Project_PKEY`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `full_name` (`full_name`),
  KEY `is_active` (`is_active`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3495 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_copy`
--

DROP TABLE IF EXISTS `projects_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_copy` (
  `Project_PKEY` int(255) NOT NULL DEFAULT '0',
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` mediumtext,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` mediumtext,
  `FK_Customers_PKEY` int(11) NOT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_ProjMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Foreman_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechForeman_Employees_PKEY` int(11) DEFAULT NULL,
  `Project_Name` text,
  `Project_Type` text,
  `Project_DateStartEstimated` date DEFAULT NULL,
  `Project_DateEndEstimated` date DEFAULT NULL,
  `Project_DateStartActual` date DEFAULT NULL,
  `Project_DateEndActual` date DEFAULT NULL,
  `Project_RoughInStart` date DEFAULT NULL,
  `Project_RoughInEnd` date DEFAULT NULL,
  `Project_DeviceInstallStart` date DEFAULT NULL,
  `Project_DeviceInstallEnd` date DEFAULT NULL,
  `Project_CommissioningStart` date DEFAULT NULL,
  `Project_CommissioningEnd` date DEFAULT NULL,
  `Project_ScopeText` text,
  `Project_NameSalutation` text,
  `Project_NameFirst` text,
  `Project_NameMiddle` text,
  `Project_NameLast` text,
  `Project_PhoneMain` text,
  `Project_EmailMain` text,
  `Project_PhoneAlternate` text,
  `Project_EmailCC` text,
  `Project_PhoneCell` text,
  `Project_PhoneFax` text,
  `Project_Address1` text COMMENT 'Project Site Address',
  `Project_Address2` text,
  `Project_Address_Parking1` text COMMENT 'Project Primary Parking',
  `Project_Address_Parking2` text COMMENT 'Project Secondary Parking',
  `Project_City` text,
  `Project_State` text,
  `Project_Zip` text,
  `Project_Park_1_Address` text COMMENT 'Primary Parking',
  `Project_Park_1_Address_City` text COMMENT 'Primary Parking City',
  `Project_Park_1_Address_State` text COMMENT 'Primary Parking State',
  `Project_Park_1_Address_Zip` int(11) DEFAULT NULL COMMENT 'Primary Parking Zip Code',
  `Project_Park_2_Address` text COMMENT 'Secondary Parking Address',
  `Project_Park_2_Address_City` text COMMENT 'Secondary Parking City',
  `Project_Park_2_Address_State` text COMMENT 'Secondary Parking State',
  `Project_Park_2_Address_Zip` int(11) DEFAULT NULL COMMENT 'Secondary Parking Zip Code',
  `Project_PercentComplete` int(11) DEFAULT NULL,
  `Project_IsClosed` text,
  `Project_Status` tinyint(4) DEFAULT NULL,
  `Project_QuotedTechLabor` int(255) DEFAULT NULL,
  `Project_QuotedRILabor` int(255) DEFAULT NULL,
  `Project_QuotedDILabor` int(255) DEFAULT NULL,
  `Project_QuotedCOLabor` int(255) DEFAULT NULL,
  `Project_QuotedEngLabor` int(255) DEFAULT NULL,
  `Project_QuotedPMLabor` int(255) DEFAULT NULL,
  `Project_UseCase` text,
  `Project_QuotedLgstLabor` int(11) DEFAULT NULL,
  `Project_QuotedMaintLabor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_in_portal_but_not_quickbooks`
--

DROP TABLE IF EXISTS `projects_in_portal_but_not_quickbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_in_portal_but_not_quickbooks` (
  `Project_PKEY` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` mediumtext,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` mediumtext,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_ProjMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Foreman_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechForeman_Employees_PKEY` int(11) DEFAULT NULL,
  `Project_Name` text,
  `Project_Type` text,
  `Project_DateStartEstimated` date DEFAULT NULL,
  `Project_DateEndEstimated` date DEFAULT NULL,
  `Project_DateStartActual` date DEFAULT NULL,
  `Project_DateEndActual` date DEFAULT NULL,
  `Project_RoughInStart` date DEFAULT NULL,
  `Project_RoughInEnd` date DEFAULT NULL,
  `Project_DeviceInstallStart` date DEFAULT NULL,
  `Project_DeviceInstallEnd` date DEFAULT NULL,
  `Project_CommissioningStart` date DEFAULT NULL,
  `Project_CommissioningEnd` date DEFAULT NULL,
  `Project_ScopeText` text,
  `Project_NameSalutation` text,
  `Project_NameFirst` text,
  `Project_NameMiddle` text,
  `Project_NameLast` text,
  `Project_PhoneMain` text,
  `Project_EmailMain` text,
  `Project_PhoneAlternate` text,
  `Project_EmailCC` text,
  `Project_PhoneCell` text,
  `Project_PhoneFax` text,
  `Project_Address1` text COMMENT 'Project Site Address',
  `Project_Address2` text,
  `Project_Address_Parking1` text COMMENT 'Project Primary Parking',
  `Project_Address_Parking2` text COMMENT 'Project Secondary Parking',
  `Project_City` text,
  `Project_State` text,
  `Project_Zip` text,
  `Project_Park_1_Address` text COMMENT 'Primary Parking',
  `Project_Park_1_Address_City` text COMMENT 'Primary Parking City',
  `Project_Park_1_Address_State` text COMMENT 'Primary Parking State',
  `Project_Park_1_Address_Zip` int(11) DEFAULT NULL COMMENT 'Primary Parking Zip Code',
  `Project_Park_2_Address` text COMMENT 'Secondary Parking Address',
  `Project_Park_2_Address_City` text COMMENT 'Secondary Parking City',
  `Project_Park_2_Address_State` text COMMENT 'Secondary Parking State',
  `Project_Park_2_Address_Zip` int(11) DEFAULT NULL COMMENT 'Secondary Parking Zip Code',
  `Project_PercentComplete` int(11) DEFAULT NULL,
  `Project_IsClosed` text,
  `Project_Status` tinyint(4) DEFAULT NULL,
  `Project_QuotedTechLabor` int(255) DEFAULT NULL,
  `Project_QuotedRILabor` int(255) DEFAULT NULL,
  `Project_QuotedDILabor` int(255) DEFAULT NULL,
  `Project_QuotedCOLabor` int(255) DEFAULT NULL,
  `Project_QuotedEngLabor` int(255) DEFAULT NULL,
  `Project_QuotedPMLabor` int(255) DEFAULT NULL,
  `Project_UseCase` text,
  `Project_QuotedLgstLabor` int(11) DEFAULT NULL,
  `Project_QuotedMaintLabor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_null_ids`
--

DROP TABLE IF EXISTS `projects_null_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_null_ids` (
  `Project_PKEY` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `name` varchar(41) DEFAULT NULL,
  `full_name` varchar(209) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `parent_id` varchar(41) DEFAULT NULL,
  `sublevel` int(11) DEFAULT '0',
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
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  `balance` decimal(20,5) DEFAULT '0.00000',
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
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` mediumtext,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` mediumtext,
  `FK_Customers_PKEY` int(11) DEFAULT NULL,
  `FK_Jobs_PKEY` int(11) DEFAULT NULL,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_ProjMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_Foreman_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechForeman_Employees_PKEY` int(11) DEFAULT NULL,
  `Project_Name` text,
  `Project_Type` text,
  `Project_DateStartEstimated` date DEFAULT NULL,
  `Project_DateEndEstimated` date DEFAULT NULL,
  `Project_DateStartActual` date DEFAULT NULL,
  `Project_DateEndActual` date DEFAULT NULL,
  `Project_RoughInStart` date DEFAULT NULL,
  `Project_RoughInEnd` date DEFAULT NULL,
  `Project_DeviceInstallStart` date DEFAULT NULL,
  `Project_DeviceInstallEnd` date DEFAULT NULL,
  `Project_CommissioningStart` date DEFAULT NULL,
  `Project_CommissioningEnd` date DEFAULT NULL,
  `Project_ScopeText` text,
  `Project_NameSalutation` text,
  `Project_NameFirst` text,
  `Project_NameMiddle` text,
  `Project_NameLast` text,
  `Project_PhoneMain` text,
  `Project_EmailMain` text,
  `Project_PhoneAlternate` text,
  `Project_EmailCC` text,
  `Project_PhoneCell` text,
  `Project_PhoneFax` text,
  `Project_Address1` text COMMENT 'Project Site Address',
  `Project_Address2` text,
  `Project_Address_Parking1` text COMMENT 'Project Primary Parking',
  `Project_Address_Parking2` text COMMENT 'Project Secondary Parking',
  `Project_City` text,
  `Project_State` text,
  `Project_Zip` text,
  `Project_Park_1_Address` text COMMENT 'Primary Parking',
  `Project_Park_1_Address_City` text COMMENT 'Primary Parking City',
  `Project_Park_1_Address_State` text COMMENT 'Primary Parking State',
  `Project_Park_1_Address_Zip` int(11) DEFAULT NULL COMMENT 'Primary Parking Zip Code',
  `Project_Park_2_Address` text COMMENT 'Secondary Parking Address',
  `Project_Park_2_Address_City` text COMMENT 'Secondary Parking City',
  `Project_Park_2_Address_State` text COMMENT 'Secondary Parking State',
  `Project_Park_2_Address_Zip` int(11) DEFAULT NULL COMMENT 'Secondary Parking Zip Code',
  `Project_PercentComplete` int(11) DEFAULT NULL,
  `Project_IsClosed` text,
  `Project_Status` tinyint(4) DEFAULT NULL,
  `Project_QuotedTechLabor` int(255) DEFAULT NULL,
  `Project_QuotedRILabor` int(255) DEFAULT NULL,
  `Project_QuotedDILabor` int(255) DEFAULT NULL,
  `Project_QuotedCOLabor` int(255) DEFAULT NULL,
  `Project_QuotedEngLabor` int(255) DEFAULT NULL,
  `Project_QuotedPMLabor` int(255) DEFAULT NULL,
  `Project_UseCase` text,
  `Project_QuotedLgstLabor` int(11) DEFAULT NULL,
  `Project_QuotedMaintLabor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_combos`
--

DROP TABLE IF EXISTS `purchase_order_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_combos` (
  `qPurchaseOrders_PKEY` int(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(255) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `sales_order_id` varchar(255) DEFAULT NULL,
  `inventory_site` varchar(255) DEFAULT NULL,
  `ship_to_entity` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `vendor_addr1` varchar(41) DEFAULT NULL,
  `vendor_addr2` varchar(41) DEFAULT NULL,
  `vendor_addr3` varchar(41) DEFAULT NULL,
  `vendor_addr4` varchar(41) DEFAULT NULL,
  `vendor_addr5` varchar(41) DEFAULT NULL,
  `vendor_city` varchar(31) DEFAULT NULL,
  `vendor_state` varchar(21) DEFAULT NULL,
  `vendor_postal_code` varchar(13) DEFAULT NULL,
  `vendor_country` varchar(31) DEFAULT NULL,
  `vendor_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `ship_method` varchar(255) DEFAULT NULL,
  `fob` varchar(255) DEFAULT NULL,
  `total_amount` decimal(20,5) DEFAULT NULL,
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  `is_fully_received` tinyint(1) DEFAULT NULL,
  `memo` text,
  `vendor_msg` varchar(255) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreationUser` text,
  `LastModificationTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModificationUser` text,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `PO_Amount` decimal(10,2) DEFAULT NULL,
  `PO_ConfirmationNo` text,
  `PO_DateComplete` date DEFAULT NULL,
  `PO_DateConfirmed` date DEFAULT NULL,
  `PO_DateCreation` date DEFAULT NULL,
  `PO_DateDelivered` date DEFAULT NULL,
  `PO_DateETA` date DEFAULT NULL,
  `PO_DateReceived` date DEFAULT NULL,
  `PO_DateSent` date DEFAULT NULL,
  `PO_DateShipped` date DEFAULT NULL,
  `PO_ETA` date DEFAULT NULL,
  `PO_Notes` text,
  `PO_Number` text,
  `PO_ProjectName` text,
  `PO_ShippedTo` text,
  `PO_Status` text,
  `PO_URL` text,
  `PO_URL BU` text,
  `PO_Vendor` text,
  `PO_NBD` date DEFAULT NULL,
  `PO_Bundle` text,
  `PO_OrderByDate` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_lines`
--

DROP TABLE IF EXISTS `purchase_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_lines` (
  `id` varchar(255) NOT NULL,
  `purchase_order_id` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `manufacturer_part_number` varchar(255) DEFAULT NULL,
  `desc` text,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `override_uom_set` varchar(255) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `inventory_site_location` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `received_quantity` decimal(20,5) DEFAULT NULL,
  `unbilled_quantity` decimal(20,5) DEFAULT NULL,
  `is_billed` tinyint(1) DEFAULT NULL,
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `purchase_order_id` (`purchase_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `qPurchaseOrders_PKEY` int(255) DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(255) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `sales_order_id` varchar(255) DEFAULT NULL,
  `inventory_site` varchar(255) DEFAULT NULL,
  `ship_to_entity` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `vendor_addr1` varchar(41) DEFAULT NULL,
  `vendor_addr2` varchar(41) DEFAULT NULL,
  `vendor_addr3` varchar(41) DEFAULT NULL,
  `vendor_addr4` varchar(41) DEFAULT NULL,
  `vendor_addr5` varchar(41) DEFAULT NULL,
  `vendor_city` varchar(31) DEFAULT NULL,
  `vendor_state` varchar(21) DEFAULT NULL,
  `vendor_postal_code` varchar(13) DEFAULT NULL,
  `vendor_country` varchar(31) DEFAULT NULL,
  `vendor_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `ship_method` varchar(255) DEFAULT NULL,
  `fob` varchar(255) DEFAULT NULL,
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  `is_fully_received` tinyint(1) DEFAULT NULL,
  `memo` text,
  `vendor_msg` varchar(255) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `PO_Amount` decimal(10,2) DEFAULT NULL,
  `PO_ConfirmationNo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_DateComplete` date DEFAULT NULL,
  `PO_DateConfirmed` date DEFAULT NULL,
  `PO_DateCreation` date DEFAULT NULL,
  `PO_DateDelivered` date DEFAULT NULL,
  `PO_DateETA` date DEFAULT NULL,
  `PO_DateReceived` date DEFAULT NULL,
  `PO_DateSent` date DEFAULT NULL,
  `PO_DateShipped` date DEFAULT NULL,
  `PO_ETA` date DEFAULT NULL,
  `PO_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Number` text,
  `PO_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_ShippedTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Vendor` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_NBD` date DEFAULT NULL,
  `PO_Bundle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_OrderByDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  KEY `qPurchaseOrders_PKEY` (`qPurchaseOrders_PKEY`),
  KEY `id` (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `sales_order_id` (`sales_order_id`),
  KEY `ref_number` (`ref_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_orders_copy`
--

DROP TABLE IF EXISTS `purchase_orders_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders_copy` (
  `qPurchaseOrders_PKEY` int(255) DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(255) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `sales_order_id` varchar(255) DEFAULT NULL,
  `inventory_site` varchar(255) DEFAULT NULL,
  `ship_to_entity` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `vendor_addr1` varchar(41) DEFAULT NULL,
  `vendor_addr2` varchar(41) DEFAULT NULL,
  `vendor_addr3` varchar(41) DEFAULT NULL,
  `vendor_addr4` varchar(41) DEFAULT NULL,
  `vendor_addr5` varchar(41) DEFAULT NULL,
  `vendor_city` varchar(31) DEFAULT NULL,
  `vendor_state` varchar(21) DEFAULT NULL,
  `vendor_postal_code` varchar(13) DEFAULT NULL,
  `vendor_country` varchar(31) DEFAULT NULL,
  `vendor_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `ship_method` varchar(255) DEFAULT NULL,
  `fob` varchar(255) DEFAULT NULL,
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  `is_fully_received` tinyint(1) DEFAULT NULL,
  `memo` text,
  `vendor_msg` varchar(255) DEFAULT NULL,
  `is_to_be_printed` tinyint(1) DEFAULT NULL,
  `is_to_be_emailed` tinyint(1) DEFAULT NULL,
  `CreationTimeStamp` datetime DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `PO_Amount` decimal(10,2) DEFAULT NULL,
  `PO_ConfirmationNo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_DateComplete` date DEFAULT NULL,
  `PO_DateConfirmed` date DEFAULT NULL,
  `PO_DateCreation` date DEFAULT NULL,
  `PO_DateDelivered` date DEFAULT NULL,
  `PO_DateETA` date DEFAULT NULL,
  `PO_DateReceived` date DEFAULT NULL,
  `PO_DateSent` date DEFAULT NULL,
  `PO_DateShipped` date DEFAULT NULL,
  `PO_ETA` date DEFAULT NULL,
  `PO_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Number` text,
  `PO_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_ShippedTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Vendor` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_NBD` date DEFAULT NULL,
  `PO_Bundle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_OrderByDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  KEY `qPurchaseOrders_PKEY` (`qPurchaseOrders_PKEY`),
  KEY `id` (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `sales_order_id` (`sales_order_id`),
  KEY `ref_number` (`ref_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qDocuments`
--

DROP TABLE IF EXISTS `qDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qDocuments` (
  `qDocuments_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Employees_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_qInvoices_PKEY` int(255) DEFAULT NULL,
  `FK_qPurchaseOrders_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_customerClient_PKEY` int(255) DEFAULT NULL,
  `Doc_Date` date DEFAULT NULL,
  `Doc_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Doc_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Doc_Type` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Doc_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Document URL',
  PRIMARY KEY (`qDocuments_PKEY`),
  KEY `FK_Employees_PKEY` (`FK_Employees_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_qInvoices_PKEY` (`FK_qInvoices_PKEY`),
  KEY `FK_qPurchaseOrders_PKEY` (`FK_qPurchaseOrders_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`),
  KEY `FK_qEstimates_PKEY` (`FK_qEstimates_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=7484 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qDocuments_Transactions`
--

DROP TABLE IF EXISTS `qDocuments_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qDocuments_Transactions` (
  `qDocuments_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_qDocuments_PKEY` int(11) DEFAULT NULL,
  `FK_TableName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_TablePKEY` int(11) DEFAULT NULL,
  `FK_TableSubType` int(11) DEFAULT NULL,
  PRIMARY KEY (`qDocuments_Transactions_PKEY`),
  KEY `FK_TablePKEY` (`FK_TablePKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5992 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qEstimates`
--

DROP TABLE IF EXISTS `qEstimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qEstimates` (
  `qEstimates_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `Est_Amount` decimal(10,2) DEFAULT NULL,
  `Est_Company` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_CompanyAbr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_Contact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_ContactAlt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_CPR` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_DateCompletion_Actual` date DEFAULT NULL,
  `Est_DateCompletion_Estimated` date DEFAULT NULL,
  `Est_DateCreated` date DEFAULT NULL,
  `Est_DateFDOB` date DEFAULT NULL,
  `Est_DateStarted_Actual` date DEFAULT NULL,
  `Est_DateStarted_Estimated` date DEFAULT NULL,
  `Est_EmailCC` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_EmailTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameFirst` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameLast` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameMiddle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_NameSalutation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Salutation -',
  `Est_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_Number` text,
  `Est_PercentComplete` int(10) DEFAULT NULL,
  `Est_PhoneAlt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_PhoneFax` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_PhoneOffice` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Est_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qEstimates_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qEstimates_Transactions`
--

DROP TABLE IF EXISTS `qEstimates_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qEstimates_Transactions` (
  `qEstimates_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_qEstimates_PKEY` int(11) DEFAULT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qEstimates_Transactions_PKEY`),
  KEY `FK_qInvoices_PKEY` (`FK_qEstimates_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qInvoices`
--

DROP TABLE IF EXISTS `qInvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qInvoices` (
  `qInvoices_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL COMMENT 'Date Created',
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Project_PKEY` int(255) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `Inv_Amount` decimal(10,2) DEFAULT NULL COMMENT 'Inv Amount',
  `Inv_DateCreated` date DEFAULT NULL,
  `Inv_DateInvoiceApproved` date DEFAULT NULL COMMENT 'Date Aprv -',
  `Inv_DateInvoiceConfirmed` date DEFAULT NULL COMMENT 'Date Conf -',
  `Inv_DateInvoicePaid` date DEFAULT NULL,
  `Inv_DateScheduled` date DEFAULT NULL COMMENT 'Sch Date -',
  `Inv_DateSent` date DEFAULT NULL COMMENT 'Date Sent',
  `Inv_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_InvConfirmedNote` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Conf # -',
  `Inv_InvSentTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'To',
  `Inv_InvSentVia` tinyint(4) DEFAULT NULL COMMENT 'Via',
  `Inv_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_Number` text COMMENT 'Inv Number',
  `Inv_PaidMethod` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_PaymentURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_PaymentURL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Inv_Status` tinyint(4) DEFAULT NULL COMMENT 'Inv Status',
  `Inv_Terms` tinyint(4) DEFAULT NULL COMMENT 'Terms',
  `Inv_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Inv URL',
  `Inv_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `AutolinkPDF` int(1) DEFAULT NULL,
  PRIMARY KEY (`qInvoices_PKEY`),
  KEY `Inv_Status` (`Inv_Status`),
  KEY `Inv_InvSentVia` (`Inv_InvSentVia`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_qEstimates_PKEY` (`FK_qEstimates_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`),
  KEY `Inv_Terms` (`Inv_Terms`)
) ENGINE=InnoDB AUTO_INCREMENT=6036 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qInvoices_List_Status`
--

DROP TABLE IF EXISTS `qInvoices_List_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qInvoices_List_Status` (
  `qInvoices_List_Status_PKEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Inv Status',
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`qInvoices_List_Status_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qInvoices_List_Terms`
--

DROP TABLE IF EXISTS `qInvoices_List_Terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qInvoices_List_Terms` (
  `qInvoices_List_Terms_PKEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`qInvoices_List_Terms_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qInvoices_List_Via`
--

DROP TABLE IF EXISTS `qInvoices_List_Via`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qInvoices_List_Via` (
  `qInvoices_List_Via_PKEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`qInvoices_List_Via_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qInvoices_Log`
--

DROP TABLE IF EXISTS `qInvoices_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qInvoices_Log` (
  `qInvoices_Log_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `FK_qInvoices_PKEY` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `queryString` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qInvoices_Log_PKEY`),
  KEY `FK_qInvoices_PKEY` (`FK_qInvoices_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6521 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qInvoices_Transactions`
--

DROP TABLE IF EXISTS `qInvoices_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qInvoices_Transactions` (
  `qInvoices_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_qInvoices_PKEY` int(11) DEFAULT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Notes',
  PRIMARY KEY (`qInvoices_Transactions_PKEY`),
  KEY `FK_qInvoices_PKEY` (`FK_qInvoices_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=878 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qPurchaseOrders`
--

DROP TABLE IF EXISTS `qPurchaseOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qPurchaseOrders` (
  `qPurchaseOrders_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `PO_Amount` decimal(10,2) DEFAULT NULL,
  `PO_ConfirmationNo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_DateComplete` date DEFAULT NULL,
  `PO_DateConfirmed` date DEFAULT NULL,
  `PO_DateCreation` date DEFAULT NULL,
  `PO_DateDelivered` date DEFAULT NULL,
  `PO_DateETA` date DEFAULT NULL,
  `PO_DateReceived` date DEFAULT NULL,
  `PO_DateSent` date DEFAULT NULL,
  `PO_DateShipped` date DEFAULT NULL,
  `PO_ETA` date DEFAULT NULL,
  `PO_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Number` text,
  `PO_ProjectName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_ShippedTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_Vendor` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_NBD` date DEFAULT NULL,
  `PO_Bundle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `PO_OrderByDate` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qPurchaseOrders_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_qEstimates_PKEY` (`FK_qEstimates_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=16756 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qPurchaseOrders_Transactions`
--

DROP TABLE IF EXISTS `qPurchaseOrders_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qPurchaseOrders_Transactions` (
  `qPurchaseOrders_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_qPurchaseOrders_PKEY` int(11) DEFAULT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qPurchaseOrders_Transactions_PKEY`),
  KEY `FK_qPurchaseOrders_PKEY` (`FK_qPurchaseOrders_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qSalesOrders`
--

DROP TABLE IF EXISTS `qSalesOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qSalesOrders` (
  `qSalesOrders_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL COMMENT 'Date Created',
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `SO_Amount` decimal(10,2) DEFAULT NULL COMMENT 'Amount',
  `SO_ClientPOAmount` decimal(10,2) DEFAULT NULL COMMENT 'Amount',
  `SO_ClientPODate` date DEFAULT NULL COMMENT 'Date',
  `SO_ClientPONo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Number',
  `SO_ClientPOURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'URL to PO',
  `SO_ClientPOURL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_DateCompleted_Actual` date DEFAULT NULL COMMENT 'Act. Completion',
  `SO_DateCompleted_Estimated` date DEFAULT NULL COMMENT 'Est. Completion',
  `SO_DateCreated` date DEFAULT NULL,
  `SO_DateFDOB` date DEFAULT NULL COMMENT 'FDOB',
  `SO_DateStarted_Actual` date DEFAULT NULL COMMENT 'Act. Start',
  `SO_DateStarted_Estimated` date DEFAULT NULL COMMENT 'Est. Start',
  `SO_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Notes',
  `SO_Number` text COMMENT 'Number',
  `SO_PercentComplete` int(10) DEFAULT NULL COMMENT '% Complete',
  `SO_ProjectForeman` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_ProjectManager` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_Status` tinyint(4) DEFAULT NULL COMMENT 'SO Status',
  `SO_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'URL to SO',
  `SO_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_MaterialsDateNeededBy` date DEFAULT NULL,
  `SO_MaterialsStatus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_LOM_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `SO_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qSalesOrders_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_qEstimates_PKEY` (`FK_qEstimates_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `SO_Status` (`SO_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=5603 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qSalesOrdersTracker`
--

DROP TABLE IF EXISTS `qSalesOrdersTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qSalesOrdersTracker` (
  `qSalesOrdersTracker_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_qPurchaseOrders_PKEY` int(11) DEFAULT NULL,
  `Manufacturer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Model` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Vendor` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `VendorPO` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `TotalNeeded` int(11) NOT NULL DEFAULT '0',
  `TotalStaged` int(11) NOT NULL DEFAULT '0',
  `UnitsOnClient` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  `ETA` date DEFAULT NULL,
  `NBD` date DEFAULT NULL,
  PRIMARY KEY (`qSalesOrdersTracker_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`),
  KEY `FK_qPurchaseOrders_PKEY` (`FK_qPurchaseOrders_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=31874 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qSalesOrders_List_Status`
--

DROP TABLE IF EXISTS `qSalesOrders_List_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qSalesOrders_List_Status` (
  `qSalesOrders_List_Status_PKEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  PRIMARY KEY (`qSalesOrders_List_Status_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qSalesOrders_Transactions`
--

DROP TABLE IF EXISTS `qSalesOrders_Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qSalesOrders_Transactions` (
  `qSalesOrders_Transactions_PKEY` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_qSalesOrders_PKEY` int(11) NOT NULL,
  `Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qSalesOrders_Transactions_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1619 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qShipments`
--

DROP TABLE IF EXISTS `qShipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qShipments` (
  `qShipments_PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` timestamp NULL DEFAULT NULL,
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qSalesOrders_PKEY` int(255) DEFAULT NULL,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `FK_qPurchaseOrders_PKEY` int(255) DEFAULT NULL,
  `Ship_Carrier` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Ship_DateAccepted` date DEFAULT NULL,
  `Ship_DateETA` date DEFAULT NULL,
  `Ship_DateReceived` date DEFAULT NULL,
  `Ship_DateShip` date DEFAULT NULL,
  `Ship_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Ship_Method` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Ship_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Ship_NumberBoxes` int(10) DEFAULT NULL,
  `Ship_Qty` int(10) DEFAULT NULL,
  `Ship_ShipTo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Ship_Status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Ship_TrackingNumber` text,
  `Ship_TrackingURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qShipments_PKEY`),
  KEY `FK_Project_PKEY` (`FK_Project_PKEY`),
  KEY `FK_qSalesOrders_PKEY` (`FK_qSalesOrders_PKEY`),
  KEY `FK_Jobs_PKEY` (`FK_Jobs_PKEY`),
  KEY `FK_qEstimates_PKEY` (`FK_qEstimates_PKEY`),
  KEY `FK_Customers_PKEY` (`FK_Customers_PKEY`),
  KEY `FK_qPurchaseOrders_PKEY` (`FK_qPurchaseOrders_PKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qbwc_errors`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qbwc_history`
--

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
  KEY `status_code_id` (`status_code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qbwc_jobs`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qbwc_sessions`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `receive_payments`
--

DROP TABLE IF EXISTS `receive_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receive_payments` (
  `Payments_PKEY` int(11) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(16) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `ar_account` varchar(159) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(20) DEFAULT NULL,
  `total_amount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `payment_method` varchar(31) DEFAULT NULL,
  `memo` varchar(4095) DEFAULT NULL,
  `deposit_to_account` varchar(159) DEFAULT NULL,
  `unused_payment` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `unused_credits` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `URL` text,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer_id`,`customer_type`) USING BTREE,
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  KEY `Payments_PKEY` (`Payments_PKEY`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_lines`
--

DROP TABLE IF EXISTS `sales_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_lines` (
  `id` varchar(255) NOT NULL,
  `sales_order_id` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `desc` text,
  `quantity` decimal(20,5) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `override_uom_set` varchar(255) DEFAULT NULL,
  `rate` decimal(20,5) DEFAULT NULL,
  `rate_percent` float DEFAULT NULL,
  `amount` decimal(20,5) DEFAULT NULL,
  `inventory_site` varchar(255) DEFAULT NULL,
  `inventory_site_location` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `lot_number` varchar(255) DEFAULT NULL,
  `sales_tax_code` varchar(255) DEFAULT NULL,
  `invoiced` decimal(20,5) DEFAULT NULL,
  `is_manually_closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sales_order_id` (`sales_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_orders`
--

DROP TABLE IF EXISTS `sales_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_orders` (
  `qSalesOrders_PKEY` int(255) DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `time_modified` datetime DEFAULT NULL,
  `edit_sequence` varchar(255) DEFAULT NULL,
  `txn_number` int(11) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `customer_type` varchar(209) DEFAULT NULL,
  `estimate_id` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `txn_date` date DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `bill_addr1` varchar(41) DEFAULT NULL,
  `bill_addr2` varchar(41) DEFAULT NULL,
  `bill_addr3` varchar(41) DEFAULT NULL,
  `bill_addr4` varchar(41) DEFAULT NULL,
  `bill_addr5` varchar(41) DEFAULT NULL,
  `bill_city` varchar(31) DEFAULT NULL,
  `bill_state` varchar(21) DEFAULT NULL,
  `bill_postal_code` varchar(13) DEFAULT NULL,
  `bill_country` varchar(31) DEFAULT NULL,
  `bill_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
  `ship_city` varchar(31) DEFAULT NULL,
  `ship_state` varchar(21) DEFAULT NULL,
  `ship_postal_code` varchar(13) DEFAULT NULL,
  `ship_country` varchar(31) DEFAULT NULL,
  `ship_note` varchar(41) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_rep` varchar(255) DEFAULT NULL,
  `fob` varchar(255) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `ship_method` varchar(255) DEFAULT NULL,
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
  `CreationTimeStamp` datetime DEFAULT NULL COMMENT 'Date Created',
  `CreationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `LastModificationTimeStamp` datetime DEFAULT NULL,
  `LastModificationUser` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Jobs_PKEY` int(255) DEFAULT NULL,
  `FK_Project_PKEY` int(11) DEFAULT NULL,
  `FK_qEstimates_PKEY` int(255) DEFAULT NULL,
  `FK_Customers_PKEY` int(255) DEFAULT NULL,
  `SO_Amount` decimal(10,2) DEFAULT NULL COMMENT 'Amount',
  `SO_ClientPOAmount` decimal(10,2) DEFAULT NULL COMMENT 'Amount',
  `SO_ClientPODate` date DEFAULT NULL COMMENT 'Date',
  `SO_ClientPONo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Number',
  `SO_ClientPOURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'URL to PO',
  `SO_ClientPOURL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_DateCompleted_Actual` date DEFAULT NULL COMMENT 'Act. Completion',
  `SO_DateCompleted_Estimated` date DEFAULT NULL COMMENT 'Est. Completion',
  `SO_DateCreated` date DEFAULT NULL,
  `SO_DateFDOB` date DEFAULT NULL COMMENT 'FDOB',
  `SO_DateStarted_Actual` date DEFAULT NULL COMMENT 'Act. Start',
  `SO_DateStarted_Estimated` date DEFAULT NULL COMMENT 'Est. Start',
  `SO_Notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Notes',
  `SO_Number` text COMMENT 'Number',
  `SO_PercentComplete` int(10) DEFAULT NULL COMMENT '% Complete',
  `SO_ProjectForeman` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_ProjectManager` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_Status` tinyint(4) DEFAULT NULL COMMENT 'SO Status',
  `SO_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'URL to SO',
  `SO_URL BU` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_MaterialsDateNeededBy` date DEFAULT NULL,
  `SO_MaterialsStatus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `SO_LOM_URL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_ProgMan_Employees_PKEY` int(11) DEFAULT NULL,
  `FK_TechLead_Employees_PKEY` int(11) DEFAULT NULL,
  `SO_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  KEY `qSalesOrders_PKEY` (`qSalesOrders_PKEY`),
  KEY `id` (`id`),
  KEY `customer_type` (`customer_type`,`customer_id`),
  KEY `estimate_id` (`estimate_id`),
  KEY `ref_number` (`ref_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `PKEY` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ldap_pass` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Client_JobID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`PKEY`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` varchar(255) NOT NULL,
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
  `vendor_addr5` varchar(41) DEFAULT NULL,
  `vendor_city` varchar(31) DEFAULT NULL,
  `vendor_state` varchar(21) DEFAULT NULL,
  `vendor_postal_code` varchar(13) DEFAULT NULL,
  `vendor_country` varchar(31) DEFAULT NULL,
  `vendor_note` varchar(41) DEFAULT NULL,
  `ship_addr1` varchar(41) DEFAULT NULL,
  `ship_addr2` varchar(41) DEFAULT NULL,
  `ship_addr3` varchar(41) DEFAULT NULL,
  `ship_addr4` varchar(41) DEFAULT NULL,
  `ship_addr5` varchar(41) DEFAULT NULL,
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
  KEY `is_active` (`is_active`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viewpagequestions`
--

DROP TABLE IF EXISTS `viewpagequestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewpagequestions` (
  `Review_Categories_PKEY` int(11) NOT NULL DEFAULT '0',
  `Review_Categories_Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pageNumber` int(10) unsigned NOT NULL,
  `Review_Questions_PKEY` int(11) NOT NULL DEFAULT '0',
  `Review_Questions_Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `FK_Employees_List_Title_PKEY` int(11) DEFAULT NULL,
  `Review_Questions_Text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Sort_Order` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'railstest_merge_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-21  2:46:25

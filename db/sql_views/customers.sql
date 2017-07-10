CREATE OR REPLACE
ALGORITHM = UNDEFINED
VIEW `Customers`
AS SELECT id as Customers_PKEY, time_created as CreationTimeStamp, CreationUser, time_modified as LastModificationTimeStamp, LastModificationUser, "" As Cust_Address1, "" As Cust_Address2, bill_addr3 AS Cust_BillTo_Address1, bill_addr4 AS Cust_BillTo_Address2, bill_city AS Cust_BillTo_City, bill_addr1 AS Cust_BillTo_Company, bill_country AS Cust_BillTo_Country, email AS Cust_BillTo_Email, bill_addr2 AS Cust_BillTo_Name, site_contact AS Cust_AP_Name, phone AS Cust_BillTo_Phone, bill_state AS Cust_BillTo_State, bill_postal_code AS Cust_BillTo_Zip, "" Cust_City, "" AS Cust_CLNoAS, company_name AS Cust_Company, full_name AS Cust_CompanyAbr, alt_contact AS Cust_ContactAlt, "" AS Cust_Country, cc AS Cust_EmailCC, site_email AS Cust_EmailTo, is_active AS Cust_InactiveFlag, "" AS Cust_NameAltFull, first_name AS Cust_NameFirst, "" AS  Cust_NameFull, last_name AS Cust_NameLast, middle_name AS Cust_NameMiddle, salutation as Cust_NameSalutation, alt_phone AS Cust_PhoneAlt, site_phone AS Cust_PhoneCell, fax AS  Cust_PhoneFax, phone AS Cust_PhoneOffice, "" AS Cust_PONo, sales_rep AS Cust_Rep, sales_tax_code AS Cust_SaleTaxCode, ship_addr3 AS Cust_ShipTo_Address1, ship_addr4 AS Cust_ShipTo_Address2, ship_city AS Cust_ShipTo_City, ship_addr1
AS Cust_ShipTo_Company, ship_country AS Cust_ShipTo_Country, "" AS Cust_ShipTo_Email, ship_addr2 AS Cust_ShipTo_Name, "" AS Cust_ShipTo_Phone, ship_state AS Cust_ShipTo_State, ship_postal_code AS Cust_ShipTo_Zip, "" as Cust_State, terms as Cust_Terms, customer_type as Cust_Type, "" as Cust_Zip FROM clients
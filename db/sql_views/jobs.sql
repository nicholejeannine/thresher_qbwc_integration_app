CREATE OR REPLACE
ALGORITHM = UNDEFINED
SQL SECURITY INVOKER
VIEW `Jobs`
AS SELECT id AS Jobs_PKEY, time_created AS CreationTimeStamp, CreationUser, time_modified AS LastModificationTimeStamp, LastModificationUser, FK_JobID_Parent, FK_Customers_PKEY, company_name AS Job_Company, Job_CompanyAbr, contact AS Job_Contact, alt_contact AS Job_ContactAlt, site_contact AS Job_ContactName, "" AS Job_CustCLNo, "" AS Job_CustPONo, job_end_date AS Job_DateEndActual, job_projected_end_date AS Job_DateEndProjected, Job_DateStartActual, job_start_date AS Job_DateStartProjected, "" AS Job_DefaultJob, Job_Description_Long, job_desc AS Job_Description_Short, sublevel AS Job_DisplayIndent, cc AS Job_EmailCC, site_email AS Job_EmailTo, Job_ExpiryDate, Job_HoursAmount_Default, Job_HoursAmount_Lock, Job_HoursAmount_Max, Job_HourType, (case is_active when 0 then "1" else "0" end) AS Job_InactiveFlag, first_name AS Job_NameFirst, last_name AS Job_NameLast, middle_name AS Job_NameMiddle, salutation AS Job_NameSalutation, Job_Notes, alt_phone AS Job_PhoneAlt, fax AS Job_PhoneFax, phone AS Job_PhoneOffice, name AS Job_QB_JobName, job_status AS Job_Status, job_type AS Job_Type, site_phone AS Job_PhoneCell FROM jobs
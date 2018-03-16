# HOW DO I USE THIS THING?

The web connector has different "things it can do" at this point. 
 Key things to know: 
 
## How to change databases the web connector will point to:
 
In the file  `config/database.yml`, change the development database by finding this:
   
   
   ``
   development:
     <<: *default
     database: taco_database
   ``

   and replacing `taco_database` with the ACTUAL name of database you want to point this to.
   
  The 3 databases, and the branches they should be unsed in conjunction with, are as follows:
  
  1. `railstest_development` - This database should only be used with the current master branch.  The data is PURELY Quickbooks data; there are views that contain merged QB/portal data, but all of the TABLES are from Quickbooks (or part of mysql/ActiveRecord, or they belong to the Quickbooks Web Connector).
  2. `railstest_merge_test` - This is an experimental database, in a state where the tables are "merged quickbooks/portal tables". This is essentially the ThresherCS database, with the "duplicate data" and "zombie records" arbitrarily "resolved" (e.g., Nichole deleted one or the other randomly, as a way to build a program able to cope with realities of "a post-ops-sync world".)  Currently this database should be used in conjunction with the `master` branch ONLY! 
  3. `railstest_test` - This is an experimental database, which is being used in conjunction with the `qb_ids` branch.  The `qb_ids` branch is an attempt to reshape the quickbooks web connector code to use portal primary keys instead of Quickbooks-generated "txn ids" and "list ids".  When ops has finished with data cleanup, and "transition day" (see below) has occured, this branch can be run with the "query" job enabled.  (See below section on qbwc_jobs)
  
  
  ## QBWC_JOBS
  
  There are 2 things you can really do with the web connector right now:  You can import ALL the data, from the beginning of time, or you can import ALL the data FROM a specific point in time.  (This is the script that the web connector will use if you choose to autorun the script every `x` number of minutes).
  
  _PRIOR TO RUNNING THE WEB CONNECTOR!__
  
  1. Make sure you are on the latest master (or whatever branch you want to be on).  Make sure your database is set to the right development database, per the instructions above.  Then run the commands, from the root of the project, in order:  `rails restart`, `rails db:seed`, and `rails log:clear`.  Then go into the `qbwc_jobs` table in the database and set the `enable` value to 1 to enable the job you prefer.
   
  * _FULL SYNC_ The "initial" query can be run to do a FULL SYNC, for all Quickbooks data, active and inactive, from all time. 
  
  * _PARTIAL OR RECURRING SYNC_ The "query" job can be used to grab only new data (data which has been modified in Quickbooks only since the last time this job was updated).  If you need to back up and re-import any data (maybe due to an error, and you want to get "the last few days again just in case", change the "updated at" value for the "query" job in the qbwc_jobs table.  Quickbooks will attempt to pull in any data after that time. (The other jobs are experimental or incomplete at this time and should not be run in production. You may delete them if you like). 


# TRANSITION DAY STEPS:

1. Stop the QB web connector for awhile. Point the config/database.yml file's development database to whatever database is going to become the  the "final, new" database. 
# General Notes:
1. When importing projects from Quickbooks, they must ALREADY exist in the projects table, or they will NOT be saved to the projects table (they will show up in the qbwc_errors table as "No match found").


# STEPS IN ATTEMPT TO REFORMULATE QB SYNC IN QB_IDS BRANCH:

1. Stop the QB web connector for awhile. Point the config/database.yml file's development database to whatever database is currently the "test" or perhaps even the "final, new" database. 
2. Stop the QB web connector for awhile. Point the config/database.yml file's development database to whatever database is currently the "test" or perhaps even the "final, new" database. Disable (don't delete) all jobs in the qbwc_jobs table except either the 'initial' or 'query' job ("initial" for a "brave test", "query" for a "not sure about this" level of braveness test), truncate the qbwc_errors, qbwc_sessions, and qbwc_history tables. These tables should be most updated in the railstest_development database so use those table strucutres if necessary.
2. Follow the instructions posted [here](http://bucket.alopias.com:7990/projects/WSS/repos/portal/browse/Login/include/Class/models/README.md?at=refs%2Fheads%2Ffeature%2FnewCompanyDisplay) to convert all view data into view. The important points:
  * Copy view data (e.g., `client_combos`)as SQL statements. Tuncate the corresponding merged table (`clients`), remove primary key indexes, and replace the original data with the view data. back up the table (`clients_backup`).   
  * In the merged table, delete all records with null quickbooks_id fields. Rename the primary key column to "id", set it to be a true primary key (type string, not null, autoincrement), and reset the autoincrement value to the last ID. Also index all columns needed for joins, handle datetime/timestamp/null foreign key value issues as documented in the README. 
  * In the backup table, delete all records with null portal primary keys. Copy and paste these records into the merge table (e.g., `clients`.)  Drop extra foreign keys, unused columns, permit nulls on foreign keys if needed to prevenet errors, and alias or handle removal of columns that reference duplicate information.
  * Repeat for other tables!
  * Replace keys for polymorphic joins in portal tables with the new table types (e.g., Tickets with ticket_type "Customer" can now read "Client").
  * Ensure permissions are set.

1. Nichole's additional steps on this branch:
- Delete JoinFM and EmployeeSupervisors tables. Remove from schema.
2. Delete combo views and ops sync cleanup views from schema.
3. CAREFULLY ENSURE INDEXES ARE SET UP RIGHT. All portal primary keys should be named "id" and set to an auto-incrementing primary key index. The quickbooks id should be called either "list_id" (for customers and vendors, or other list types), or "txn_id" (for all transaction types). This field should be a UNIQUE index. Additionally, the full_name fields on clients and vendors should be given a unique index. Keep trying to set the index to unique; when "duplicate entry" errors occur, keep deleting the "wrong" row of data until it succeeds.
4. FOR PROJECTS: The process is similar; first `DELETE FROM projects WHERE list_id IS NULL`, followed by `DELETE FROM projects_copy WHERE list_id IS NOT NULL`.  Then, copy the known QB full_name matches to the backup table, using a statement like `UPDATE railstest_merge_test.projects_copy P JOIN Thresher.project_qb_portal_comparisons T ON T.Project_PKEY = P.id SET P.full_name = T.'Full name in Quickbooks'` Then copy/paste the contents of the `projects_backup` table into the `projects` table. Many entries will still be blank on all the Quickbooks fields, but some now will have the Quickbooks full_name, so the next web connnector update should fill in some of the missing data.
5. (Delete old non-qb tables to minimize confusion, since all tables have now been merged. In real life we probably won't do this, until we're sure all references to the old tables have been updated or replaced, but this will minimize the confusion for now in this demo/trial).
4. Rework the QBWC script to use :list_id and :txn_id instead of :id. Use :id for the portal id fields, and try to force foreign key updates on save.


# BASIC INSTALLATION (for first-time config on new machine or to replicate locally for funsies)

This README file is going to assume that you have a Bitbucket account for the Thresher IT department, and that you have Rails (including Bundler, Rubygems, and Ruby), Git, Mysql, and Node installed and configured on your system, or have a VM set up with the same.  If you don't, please see [Carel Strey](cstrey@alopias.com) and if you're on Windows may God help you.

Clone this repo from bitbucket if you haven't already. As of December 2016, this can be accomplished by opening your terminal, navigating to your favorite Threshery folder, and running `git clone http://YOUR-NAME-HERE@bucket.alopias.com:7990/scm/rbquic/railstest.git`.

The next step is to open up your terminal window and run the command `bin/setup`.  This command will attempt to download and configure everything you need to get going, including your local database.  If this command fails, don't panic - there may be some additional libraries you need to install before the process will complete. Follow the error prompts to download additional libraries as required (note: depending on your setup, you may have to use `sudo` in order to install local gems), and afterward re-run the command `bin/setup`.

If you encounter a database configuration error such as `Mysql2::Error:`, or see `== Command ["bin/rails db:environment:set RAILS_ENV=development"] failed ==`, you should open the config/database.yml file and modify the lines corresponding to `username`, `password`, and `socket` (under the `development` environment) your local mysql configuration settings.  Rerun `bin/setup` when complete.

If this completes without errors, you're good to go! In your local environment, you can run the application now from the command line by running:

  `rails s` (or `rails server`, if you're not into the whole brevity thing)

Now open your browser to the location specified in the console, typicially [http://localhost:3000](http://localhost:3000)


## IMPORTANT NOTES REGARDING WORKING WITH QUICKBOOKS DATA:
Credit for this section to [Keith Palmer](http://wiki.consolibyte.com/wiki/doku.php/quickbooks_qbxml_questions#how_does_qbxml_handle_special_characters_accents_non-us_non-ascii_characters_etc)

#### ORDER MATTERS
It's worth noting that order matters when building qbXML requests. If your XML elements are not ordered precisely as outlined in the [Quickbooks OSR](https://developer-static.intuit.com/qbsdk-current/common/newosr/index.html), your request will fail with a parsing error.

#### Edit Sequences
 An __EditSequence__ value is a token that keeps track of the sequence of edits of a record. Every time a record is modified (whether via the SDK, or via the QuickBooks GUI), the EditSequence changes. When you submit a request to modify an object, you *must* specify the *latest* EditSequence value. This is QuickBooks' way of ensuring that you have first retrieved the latest revision of the record, before trying to update it.  (This value is queried for all import requests, but must be specified for update requests).

#### Special characters (accents, non-US/non-ASCII characters, etc.),

  * `&`, `<`, and `>` must be html encoded (e.g., `&amp;` `&lt;` `&gt;`).

  * This does not work: (it fails with a “QuickBooks found an error with the XML” error)
  ```
  <CompanyName>Steel Décor</CompanyName>
  ```
  Here's an example of a correctly encoded request: (notice the encoded e with the accent symbol):
```
<CompanyName>Steel D&#233;cor</CompanyName>
```
 The response will be returned in encoded form: `<CompanyName>Steel D&#233;cor</CompanyName>`

#### Addresses

1. Is there anything special about the Addr4 and Addr5 fields?

With qbXML, you have to use *either* Addr4 and Addr5 *OR* City, State, PostalCode, and Country. As long as the fields you use do not total to more than 5 address lines when printed in a standard address format, you'll be OK. If you try to use an address that would display as six address lines, the request will be rejected by QuickBooks.

i.e. This is valid:

```
<ShipAddress>
   <Addr1>56 Cowles Road</Addr1>
   <Addr2>Suite D</Addr2>
   <Addr3>Attn: Keith Palmer Jr.</Addr3>
   <City>Willington</City>
   <State>Connecticut</State>
   <PostalCode>06279</PostalCode>
   <Country>USA</Country>
</ShipAddress>
```

And this is valid:

```
<ShipAddress>
   <Addr1>56 Cowles Road</Addr1>
   <Addr2>Suite D</Addr2>
   <Addr3>Attn: Keith Palmer Jr.</Addr3>
   <Addr4>Willington, Connecticut 06279</Addr4>
   <Addr5>USA</Addr5>
</ShipAddress>
```

But this *is not valid* (because is uses Addr4 *and* the City, State, PostalCode, and Country fields):

```
<ShipAddress>
   <Addr1>56 Cowles Road</Addr1>
   <Addr2>Suite D</Addr2>
   <Addr3>Attn: Keith Palmer Jr.</Addr3>
   <Addr4>Ref: 1234</Addr4>
   <City>Willington</City>
   <State>Connecticut</State>
   <PostalCode>06279</PostalCode>
   <Country>USA</Country>
</ShipAddress>
```

2. Is there anything special about addresses in QuickBooks in general?

Yes, they are very strange. Here's an article from an Intuit developer about how QuickBooks stores addresses:
```
QuickBooks stores addresses as a single string. It does not store address details in separate fields. QuickBooks relies on parsing to separate out the address details so whatever shows up in the “Address Detail” window is not guaranteed to appear in the same way again. This is why Croatia, or any other text string we don't have in our list of countries will not be recognized as such, and thus placed in the field that will be determined at run time by the parser.
```

3. What is the difference between `ship_address` and `ship_to_address`?

The ship_to_address field will return an array of shipping addresses that have been previously used for that customer (or job, etc).  Whichever shipping address has been declared the "default" (in the Quickbooks GUI) will be returned as the `ship_address` value.



# Quickbooks TimeCard Entry
Weekly Timesheet used.

- Customer Job is customer job
- Service Item is Video:0100 is the default service item unless we're able to derive what that item is from the ticket types OR holiday/PTO/TWOP
- Notes is the Ticket #
- Payroll Item is always Hourly Level 1.
- Class is Cabling thing (look at pre-existing) for anything NOT [Holiday, TWOP, PTO]
- Notes: Either the holiday name or the ticket # (Look at previous stuffs)
- Billable Field: Always "NotBillable"


PTO: "Hourly PTO Rate" also "Hourly TWOP Rate"
- HOLIDAYS: Put Payroll Item to "Hourly Holiday Rate"
- grey out button after click on QB Export


19838  Types:  1  99  0   code: video 0300

type 1 service code = 3
type 99 service code = 

# Put this error on a title attribute in HTML on views/timecard_transactions/new
QbwcTimecardError.create(:worker_class => "TimeTrackingsController#create", :model_id => t.id, :error_message => "No Quickbooks customer found for request TimecardTrans #{t.id}, project_id #{t.project_id}, job_id #{t.job_id}, customer #{t.client_id}, employee #{t&.employee&.employee_list_id}, date #{t.tc_date}")
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
=======
>>>>>>> master



## HOW TO SELECT/GROUP BY CLIENTS (OUT OF ALL CUSTOMERS/JOBS/PROJECTS):

`SELECT SUBSTRING_INDEX(customer_full_name, ':', 1 ) FROM TABLE`

FULL QUERY (without date ranges) for estimates:

`SELECT SUBSTRING_INDEX(customer_full_name, ':', 1 ) AS client, sales_rep, COUNT(*) AS count, SUM(total_amount) AS amount FROM `estimates` GROUP BY sales_rep, client`

FULL QUERY WITH VARIABLE DATE RANGES:

given date1 and date2:

SELECT SUBSTRING_INDEX(customer_full_name, ':', 1 ) AS client, sales_rep, COUNT(*) AS count, SUM(total_amount) AS amount FROM `estimates` WHERE time_created BETWEEN 'date1' AND 'date2' GROUP BY sales_rep, client

WITHOUT VARIABLES AT ALL:

```
SELECT EXTRACT(YEAR_MONTH FROM `time_created`) AS monthyear, SUBSTRING**_INDEX(customer_full_name, ':', 1 ) AS client, sales_rep, COUNT(*) AS count, SUM(total_amount) AS amount FROM `estimates` GROUP BY sales_rep, client, monthyear
```

ESTIMATES (with formatting $)
``` 
sql = "SELECT EXTRACT(YEAR_MONTH FROM `time_created`) AS monthyear, SUBSTRING_INDEX(customer_full_name, ':', 1 ) AS client, sales_rep, COUNT(*) AS count, CONCAT('$', TRUNCATE(SUM(total_amount), 2)) AS amount FROM `estimates` WHERE time_created BETWEEN '2017-01-01' AND '2018-12-31' GROUP BY sales_rep, client, monthyear"
records_array = ActiveRecord::Base.connection.execute(sql).to_a
```


### COMPLETE HASH WITH ALL FIELDS WE NEED FOR CLIENT
{"xml_attributes"=>{}, "list_id"=>"80000FEE-1430232657", "time_created"=>"2015-04-28T07:50:57-08:00", "time_modified"=>"2018-02-26T15:23:00-08:00", "edit_sequence"=>"1519687380", "name"=>"99Designs", "full_name"=>"99Designs", "is_active"=>true, "sublevel"=>0, "company_name"=>"99Designs", "first_name"=>"Paul", "last_name"=>"Annesley", "bill_address"=>{"xml_attributes"=>{}, "addr1"=>"99Designs", "addr2"=>"Gareth Tilley", "addr3"=>"2201 Broadway Avenue", "city"=>"Oakland", "state"=>"CA", "postal_code"=>"94612"}, "bill_address_block"=>{"xml_attributes"=>{}, "addr1"=>"99Designs", "addr2"=>"Gareth Tilley", "addr3"=>"2201 Broadway Avenue", "addr4"=>"Oakland, CA 94612"}, "ship_address"=>{"xml_attributes"=>{}, "addr1"=>"99Designs", "addr2"=>"Gareth Tilley", "addr3"=>"2201 Broadway Avenue", "city"=>"Oakland", "state"=>"CA", "postal_code"=>"94612"}, "ship_address_block"=>{"xml_attributes"=>{}, "addr1"=>"99Designs", "addr2"=>"Gareth Tilley", "addr3"=>"2201 Broadway Avenue", "addr4"=>"Oakland, CA 94612"}, "ship_to_address"=>[{"xml_attributes"=>{}, "name"=>"99Design", "addr1"=>"99Designs", "addr2"=>"Gareth Tilley", "addr3"=>"2201 Broadway Avenue", "city"=>"Oakland", "state"=>"CA", "postal_code"=>"94612", "default_ship_to"=>true}], "phone"=>"415-994-0598", "email"=>"Paul.Annesley@99designs.com", "additional_contact_ref"=>[{"xml_attributes"=>{}, "contact_name"=>"Main Phone", "contact_value"=>"415-994-0598"}, {"xml_attributes"=>{}, "contact_name"=>"Mobile", "contact_value"=>"999-999-9999"}, {"xml_attributes"=>{}, "contact_name"=>"Main Email", "contact_value"=>"Paul.Annesley@99designs.com"}], "terms_ref"=>{"xml_attributes"=>{}, "list_id"=>"20000-875338872", "full_name"=>"Net 30"}, "sales_rep_ref"=>{"xml_attributes"=>{}, "list_id"=>"8000000C-1380320671", "full_name"=>"ILK"}, "balance"=>0.0, "total_balance"=>0.0, "sales_tax_code_ref"=>{"xml_attributes"=>{}, "list_id"=>"10000-1009221895", "full_name"=>"Tax"}, "item_sales_tax_ref"=>{"xml_attributes"=>{}, "list_id"=>"48F0000-1024441649", "full_name"=>"AL/CA"}, "job_status"=>"None", "preferred_delivery_method"=>"None", "data_ext_ret"=>[{"xml_attributes"=>{}, "owner_id"=>"0", "data_ext_name"=>"Site Contact", "data_ext_type"=>"STR255TYPE", "data_ext_value"=>"site"}, {"xml_attributes"=>{}, "owner_id"=>"0", "data_ext_name"=>"Site Email", "data_ext_type"=>"STR255TYPE", "data_ext_value"=>"email"}, {"xml_attributes"=>{}, "owner_id"=>"0", "data_ext_name"=>"Site Phone", "data_ext_type"=>"STR255TYPE", "data_ext_value"=>"999-999-9999"}]}



## TODO:
  1. If the physical address (THE SHIP ADDRESS) of the job site is within the city or county of San Francisco, the class should be set to "SF Labor" otherwise it's going to be blank (TODO BY MARCH 31 IF POSSIBLE)
  
  
# QBWC Corrina Meeting
## Wish List
  
  - some kind of "In Progress" indicator that shows the web connector is still processing jobs for the week.
  - when the green button clicks, needs to say "this many successful entries" out of "how many"
  
1. NAMES:
  Modules: QbListType, QbTxnType, QbCanPushtoPortal, PortalCanPushToQb
  
  "Match and push to portal"
  "Push to portal"
;


## ADDING NEW TABLES
 - Every table that syncs data with the portal needs to define a hash constant, called FIELD_MAP.  The hash keys are sybmols with the names of the portal columns that the web connector can update. The hash values are "lookups" values, e.g., they specify where and how to obtain the correct values from the Quickbooks query hash.  Each value should be either a string, a hash, or a proc (a proc is simply a method that can be called to do perform any complicated logic needed to obtain the correct value).
 
 
# dblord user full permission set (updated after Jobs sync)

``` 
GRANT USAGE ON *.* TO 'dblord'@'%' IDENTIFIED BY PASSWORD '*2651A4DBDE9BBF739FFCF042D56F453ADF219AF7';

GRANT SELECT ON `qb`.* TO 'dblord'@'%';

GRANT ALL PRIVILEGES ON `WordpressIT`.* TO 'dblord'@'%';

GRANT SELECT, REFERENCES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, ALTER ROUTINE, EVENT, TRIGGER ON `Thresher`.* TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`groups` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ProjectEstimates` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Classes_Certs` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees_Cert` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`inventory` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qEstimates_Transactions` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`qbwc_errors` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA` TO 'dblord'@'%';

GRANT SELECT, UPDATE (LastModificationTimeStamp, CreationTimeStamp, Job_Description_Long, CreationUser, Job_Description_Short, Job_CompanyAbr, Job_Contact, LastModificationUser, Job_ContactAlt, Job_DateStartProjected), REFERENCES ON `Thresher`.`Jobs` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`SalesDeltas` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qEstimates` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_List_Maint_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qInvoices_List_Via` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Project_List_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Project_Serials` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_Assignment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ProjectCrew` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees_List_Size` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`weekly_crew_notes` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Pictures` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`viewpagequestions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Review_Answers` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`DeliveryItems` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`qbwc_timecard_errors` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Payments` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`SalesLead_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qInvoices_Log` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_AutoAssignment_Assignment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees_List_Title` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qInvoices_List_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Project_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Project` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`StartPage_Alert` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Review_Dates` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`TimeCardTrans` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ProjectRoleTypes` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qSalesOrders_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qDocuments` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Review_Categories` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Menu` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ProjectNoteTypes` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees_NDAs` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`TimeCards` TO 'dblord'@'%';

GRANT SELECT, UPDATE (LastModificationTimeStamp, CreationTimeStamp, LastModificationUser, CreationUser, Cust_BillTo_Phone, Cust_BillTo_Email, Cust_AP_Name), REFERENCES ON `Thresher`.`Customers` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qSalesOrdersTracker` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees_Cert_Todo` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_List_Escalation` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Customers_Logos` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_List_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ConstTracker` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Holidays` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_List_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`menu_items` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_AutoAssignment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_List_Type` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Deliveries` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qDocuments_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`permissions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Classes_Certs_List_Tier` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Types` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`qb_employees` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_Email_Remind` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qInvoices_List_Terms` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qSalesOrders_List_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Departments` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`List_Salutation` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`users` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_Flag` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Schedule` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_List_Type` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qSalesOrders` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Review_Questions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ProjectRoles` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`PaymentMethod` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees_Badges` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`membership` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qShipments` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`ProjectSiteAssessment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`access_log` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qPurchaseOrders` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`qb_customers` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Cat3` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qInvoices_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`job_phases` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Cat1` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Questions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Employees` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qPurchaseOrders_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_AutoAssignment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Cat4` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Answers` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Ranges` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`time_trackings` TO 'dblord'@'%';

GRANT SELECT ON `Thresher`.`customer_full_names` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Review` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qInvoices` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Review_Questions_Join_Titles` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qPurchaseOrders_List_Status` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Skill_Assessment_Cat2` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_List_Escalation` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Vendor` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`cts_answers` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_AutoAssignment_Assignment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`TimePunch` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets_Transactions` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`RMA_Assignment` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Tickets` TO 'dblord'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`Classes_Certs_Join_Req` TO 'dblord'@'%';
```

# qb user FULL PERMISSION SET (updated after jobs sync):

``` 
GRANT USAGE ON *.* TO 'qb'@'%' IDENTIFIED BY PASSWORD '*8492754520D051E94E213E09EA1E2D224AD23B6E';

GRANT ALL PRIVILEGES ON `qb`.* TO 'qb'@'%';

GRANT SELECT ON `ThresherSB`.* TO 'qb'@'%';

GRANT SELECT, CREATE ON `Thresher`.* TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`Project` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qbwc_sessions` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`Tickets_List_Type` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qbwc_history` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE (Job_Company, CreationTimeStamp, Job_InactiveFlag, CreationUser, LastModificationUser, bill_city, ship_addr1, LastModificationTimeStamp, Job_DateEndProjected, FK_JobID_Parent, mobile, Job_DateStartActual, bill_addr2, bill_postal_code, Job_Status, Job_QB_JobName, Job_PhoneOffice, Job_NameFirst, sales_rep, Job_PhoneFax, ship_city, Job_EmailTo, ship_addr4, Job_NameSalutation, Job_DateEndActual, Job_NameMiddle, list_id, bill_addr1, Job_NameLast, Job_EmailCC, ship_state, FK_Customers_PKEY, bill_addr3, bill_addr4, Job_PhoneAlt, ship_addr2, full_name, bill_state, ship_addr3, ship_postal_code) ON `Thresher`.`Jobs` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE (Cust_ShipTo_Address2, Cust_BillTo_Address1, Cust_ShipTo_City, Cust_NameMiddle, Cust_PhoneOffice, Cust_BillTo_Company, site_phone, Cust_BillTo_City, Cust_BillTo_Name, Cust_EmailCC, Cust_NameLast, Cust_CompanyAbr, Cust_NameFirst, Cust_Company, Cust_ShipTo_Zip, Cust_NameSalutation, Cust_ShipTo_Company, Cust_BillTo_Zip, sales_rep, Cust_PhoneCell, site_email, Cust_BillTo_Address2, Cust_ShipTo_Name, Cust_InactiveFlag, Cust_PhoneAlt, Cust_BillTo_State, Cust_PhoneFax, Cust_EmailTo, site_contact, Cust_ShipTo_State, Cust_ShipTo_Address1) ON `ThresherSB`.`Customers` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`FullNameFields` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qb_employees` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`qInvoices` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`Tickets` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`Employees` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE (Cust_EmailTo, Cust_NameMiddle, Cust_ShipTo_State, LastModificationTimeStamp, LastModificationUser, Cust_NameSalutation, site_phone, Cust_BillTo_Company, Cust_PhoneOffice, CreationUser, Cust_NameLast, Cust_BillTo_Address1, Cust_BillTo_Name, Cust_BillTo_City, Cust_ShipTo_Zip, Cust_CompanyAbr, Cust_ShipTo_Company, Cust_Company, sales_rep, Cust_EmailCC, site_email, Cust_BillTo_Zip, Cust_ShipTo_Name, Cust_PhoneCell, Cust_PhoneAlt, Cust_BillTo_Address2, list_id, Cust_InactiveFlag, site_contact, Cust_BillTo_State, Cust_ShipTo_Address1, Cust_PhoneFax, Cust_ShipTo_Address2, Cust_NameFirst, Cust_ShipTo_City, CreationTimeStamp) ON `Thresher`.`Customers` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`qSalesOrders` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`qPurchaseOrders` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`Holidays` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`FullName` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qbwc_errors` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qbwc_jobs` TO 'qb'@'%';

GRANT SELECT, UPDATE (TCT_Status) ON `Thresher`.`TimeCardTrans` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`time_trackings` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qbwc_timecard_errors` TO 'qb'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON `Thresher`.`qb_customers` TO 'qb'@'%';

GRANT SELECT ON `Thresher`.`qEstimates` TO 'qb'@'%';
```

# STEPS IN ATTEMPT TO REFORMULATE QB SYNC IN THIS BRANCH:

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


-- TODO: sales_orders, vendors




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


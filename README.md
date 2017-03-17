# Quickbooks Web Connector Project 
#### (Aka "What is Quickbooks syncing??")

## TODO:

____ CODING TASKS _____

1. Correct all of the database column types.
2. Document the shit out of this. 
____ DESIGN TASKS (for everyone) ____

1. Decide how to handle customers/jobs/projects. It's OUR web connnector, so we can totally have the script save to different tables (clients, jobs, projects) depending on the data - we don't have to write it all to a single table (pros and cons each way).








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


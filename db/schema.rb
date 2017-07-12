# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170712030051) do

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "list_id",                                                          default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.string   "full_name",                 limit: 209
    t.boolean  "is_active",                                                        default: true,  null: false
    t.string   "company_name",              limit: 41
    t.string   "salutation",                limit: 15
    t.string   "first_name",                limit: 25
    t.string   "middle_name",               limit: 25
    t.string   "last_name",                 limit: 25
    t.string   "job_title",                 limit: 41
    t.string   "bill_addr1",                limit: 41
    t.string   "bill_addr2",                limit: 41
    t.string   "bill_addr3",                limit: 41
    t.string   "bill_addr4",                limit: 41
    t.string   "bill_addr5",                limit: 41
    t.string   "bill_city",                 limit: 31
    t.string   "bill_state",                limit: 21
    t.string   "bill_postal_code",          limit: 13
    t.string   "bill_country",              limit: 31
    t.string   "bill_note",                 limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
    t.string   "ship_addr5",                limit: 41
    t.string   "ship_city",                 limit: 31
    t.string   "ship_state",                limit: 21
    t.string   "ship_postal_code",          limit: 13
    t.string   "ship_country",              limit: 31
    t.string   "ship_note",                 limit: 41
    t.string   "phone",                     limit: 21
    t.string   "alt_phone",                 limit: 21
    t.string   "fax",                       limit: 21
    t.string   "email",                     limit: 1023
    t.string   "cc",                        limit: 1023
    t.string   "contact",                   limit: 41
    t.string   "alt_contact",               limit: 41
    t.string   "customer_type",             limit: 159
    t.string   "terms",                     limit: 31
    t.string   "sales_rep",                 limit: 5
    t.decimal  "balance",                                 precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "total_balance",                           precision: 20, scale: 5, default: "0.0", null: false
    t.string   "sales_tax_code",            limit: 3
    t.string   "item_sales_tax",            limit: 31
    t.string   "account_number",            limit: 99
    t.string   "job_type",                  limit: 159
    t.string   "preferred_delivery_method", limit: 41
    t.string   "site_contact"
    t.string   "site_email"
    t.string   "site_phone"
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535
    t.text     "Cust_Address1",             limit: 65535
    t.text     "Cust_Address2",             limit: 65535
    t.text     "Cust_BillTo_Address1",      limit: 65535
    t.text     "Cust_BillTo_Address2",      limit: 65535
    t.text     "Cust_BillTo_City",          limit: 65535
    t.text     "Cust_BillTo_Company",       limit: 65535
    t.text     "Cust_BillTo_Country",       limit: 65535
    t.text     "Cust_BillTo_Email",         limit: 65535,                                                       comment: "A/P Email"
    t.text     "Cust_BillTo_Name",          limit: 65535
    t.text     "Cust_AP_Name",              limit: 65535,                                                       comment: "A/P Name"
    t.text     "Cust_BillTo_Phone",         limit: 65535,                                                       comment: "A/P Phone"
    t.text     "Cust_BillTo_State",         limit: 65535
    t.integer  "Cust_BillTo_Zip"
    t.text     "Cust_City",                 limit: 65535
    t.text     "Cust_CLNo",                 limit: 65535
    t.text     "Cust_Company",              limit: 65535
    t.text     "Cust_CompanyAbr",           limit: 65535,                                                       comment: "Customer Short Name"
    t.text     "Cust_ContactAlt",           limit: 65535
    t.text     "Cust_Country",              limit: 65535
    t.text     "Cust_EmailCC",              limit: 65535
    t.text     "Cust_EmailTo",              limit: 65535
    t.text     "Cust_InactiveFlag",         limit: 65535
    t.text     "Cust_NameAltFull",          limit: 65535
    t.text     "Cust_NameFirst",            limit: 65535
    t.text     "Cust_NameFull",             limit: 65535
    t.text     "Cust_NameLast",             limit: 65535
    t.text     "Cust_NameMiddle",           limit: 65535
    t.text     "Cust_NameSalutation",       limit: 65535
    t.text     "Cust_PhoneAlt",             limit: 65535
    t.text     "Cust_PhoneCell",            limit: 65535
    t.text     "Cust_PhoneFax",             limit: 65535,                                                       comment: "A/P FAX"
    t.text     "Cust_PhoneOffice",          limit: 65535
    t.text     "Cust_PONo",                 limit: 65535
    t.text     "Cust_Rep",                  limit: 65535
    t.text     "Cust_SaleTaxCode",          limit: 65535
    t.text     "Cust_ShipTo_Address1",      limit: 65535
    t.text     "Cust_ShipTo_Address2",      limit: 65535
    t.text     "Cust_ShipTo_City",          limit: 65535
    t.text     "Cust_ShipTo_Company",       limit: 65535
    t.text     "Cust_ShipTo_Country",       limit: 65535
    t.text     "Cust_ShipTo_Email",         limit: 65535
    t.text     "Cust_ShipTo_Name",          limit: 65535
    t.text     "Cust_ShipTo_Phone",         limit: 65535
    t.text     "Cust_ShipTo_State",         limit: 65535
    t.integer  "Cust_ShipTo_Zip"
    t.text     "Cust_State",                limit: 65535
    t.text     "Cust_Terms",                limit: 65535
    t.text     "Cust_Type",                 limit: 65535
    t.integer  "Cust_Zip"
    t.index ["full_name"], name: "full_name", unique: true, using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
  end

  create_table "estimate_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "estimate_id"
    t.string  "item"
    t.string  "desc",                    limit: 4095
    t.decimal "quantity",                             precision: 20, scale: 5
    t.string  "unit_of_measure",         limit: 31
    t.string  "override_uom_set",        limit: 31
    t.decimal "rate",                                 precision: 20, scale: 5
    t.float   "rate_percent",            limit: 24
    t.decimal "amount",                               precision: 20, scale: 5, default: "0.0", null: false
    t.string  "inventory_site",          limit: 31
    t.string  "inventory_site_location", limit: 31
    t.string  "sales_tax_code",          limit: 3
    t.decimal "markup_rate",                          precision: 20, scale: 5
    t.float   "markup_rate_percent",     limit: 24
    t.index ["estimate_id"], name: "estimate_id", using: :btree
  end

  create_table "estimates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                              default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                limit: 16
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_type",                limit: 209
    t.string   "template",                     limit: 159
    t.date     "txn_date"
    t.string   "ref_number",                   limit: 11
    t.string   "bill_addr1",                   limit: 41
    t.string   "bill_addr2",                   limit: 41
    t.string   "bill_addr3",                   limit: 41
    t.string   "bill_addr4",                   limit: 41
    t.string   "bill_addr5",                   limit: 41
    t.string   "bill_city",                    limit: 31
    t.string   "bill_state",                   limit: 21
    t.string   "bill_postal_code",             limit: 13
    t.string   "bill_country",                 limit: 31
    t.string   "bill_note",                    limit: 41
    t.string   "ship_addr1",                   limit: 41
    t.string   "ship_addr2",                   limit: 41
    t.string   "ship_addr3",                   limit: 41
    t.string   "ship_addr4",                   limit: 41
    t.string   "ship_addr5",                   limit: 41
    t.string   "ship_city",                    limit: 31
    t.string   "ship_state",                   limit: 21
    t.string   "ship_postal_code",             limit: 13
    t.string   "ship_country",                 limit: 31
    t.string   "ship_note",                    limit: 41
    t.boolean  "is_active",                                                           default: true,  null: false
    t.string   "po_number",                    limit: 25
    t.string   "terms",                        limit: 31
    t.date     "due_date"
    t.string   "sales_rep",                    limit: 5
    t.string   "fob",                          limit: 13
    t.decimal  "subtotal",                                   precision: 20, scale: 5, default: "0.0", null: false
    t.string   "item_sales_tax",               limit: 31
    t.float    "sales_tax_percentage",         limit: 24
    t.decimal  "sales_tax_total",                            precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "total_amount",                               precision: 20, scale: 5, default: "0.0", null: false
    t.string   "memo",                         limit: 4095
    t.string   "customer_msg",                 limit: 101
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code",      limit: 3
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.decimal  "Est_Amount",                                 precision: 10, scale: 2
    t.text     "Est_Company",                  limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_CompanyAbr",               limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_Contact",                  limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_ContactAlt",               limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_CPR",                      limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.date     "Est_DateCompletion_Actual"
    t.date     "Est_DateCompletion_Estimated"
    t.date     "Est_DateCreated"
    t.date     "Est_DateFDOB"
    t.date     "Est_DateStarted_Actual"
    t.date     "Est_DateStarted_Estimated"
    t.text     "Est_EmailCC",                  limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_EmailTo",                  limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_NameFirst",                limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_NameLast",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_NameMiddle",               limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_NameSalutation",           limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "Salutation -"
    t.text     "Est_Notes",                    limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_Number",                   limit: 65535
    t.integer  "Est_PercentComplete"
    t.text     "Est_PhoneAlt",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_PhoneFax",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_PhoneOffice",              limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_ProjectName",              limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_Status",                   limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_URL",                      limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Est_URL BU",                   limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.index ["customer_id", "customer_type"], name: "customer_id", using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "invoice_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "invoice_id"
    t.string  "item"
    t.text    "desc",                    limit: 65535
    t.decimal "quantity",                              precision: 20, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set"
    t.decimal "rate",                                  precision: 20, scale: 5
    t.float   "rate_percent",            limit: 24
    t.decimal "amount",                                precision: 20, scale: 5, default: "0.0", null: false
    t.string  "inventory_site"
    t.string  "inventory_site_location"
    t.string  "serial_number"
    t.string  "lot_number"
    t.date    "service_date"
    t.string  "sales_tax_code"
    t.index ["invoice_id"], name: "invoice_id", using: :btree
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                                           null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_type",             limit: 209
    t.string   "estimate_id"
    t.string   "sales_order_id"
    t.string   "ar_account",                limit: 159
    t.string   "template",                  limit: 31
    t.date     "txn_date"
    t.string   "ref_number",                limit: 11
    t.string   "bill_addr1",                limit: 41
    t.string   "bill_addr2",                limit: 41
    t.string   "bill_addr3",                limit: 41
    t.string   "bill_addr4",                limit: 41
    t.string   "bill_addr5",                limit: 41
    t.string   "bill_city",                 limit: 31
    t.string   "bill_state",                limit: 21
    t.string   "bill_postal_code",          limit: 13
    t.string   "bill_country",              limit: 31
    t.string   "bill_note",                 limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
    t.string   "ship_addr5",                limit: 41
    t.string   "ship_city",                 limit: 31
    t.string   "ship_state",                limit: 21
    t.string   "ship_postal_code",          limit: 13
    t.string   "ship_country",              limit: 31
    t.string   "ship_note",                 limit: 41
    t.boolean  "is_pending"
    t.boolean  "is_finance_charge"
    t.string   "po_number",                 limit: 25
    t.string   "terms",                     limit: 31
    t.date     "due_date"
    t.string   "sales_rep",                 limit: 5
    t.string   "fob",                       limit: 13
    t.date     "ship_date"
    t.string   "ship_method",               limit: 15
    t.decimal  "subtotal",                                precision: 20, scale: 5, default: "0.0", null: false
    t.string   "item_sales_tax",            limit: 31
    t.float    "sales_tax_percentage",      limit: 24
    t.decimal  "sales_tax_total",                         precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "applied_amount",                          precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "balance_remaining",                       precision: 20, scale: 5, default: "0.0", null: false
    t.string   "memo",                      limit: 4095
    t.boolean  "is_paid"
    t.string   "customer_msg",              limit: 101
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code",   limit: 3
    t.decimal  "suggested_discount_amount",               precision: 20, scale: 5
    t.date     "suggested_discount_date"
    t.datetime "CreationTimeStamp",                                                                                                           comment: "Date Created"
    t.text     "CreationUser",              limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_qSalesOrders_PKEY"
    t.decimal  "Inv_Amount",                              precision: 10, scale: 2,                                                            comment: "Inv Amount"
    t.date     "Inv_DateCreated"
    t.date     "Inv_DateInvoiceApproved",                                                                                                     comment: "Date Aprv -"
    t.date     "Inv_DateInvoiceConfirmed",                                                                                                    comment: "Date Conf -"
    t.date     "Inv_DateInvoicePaid"
    t.date     "Inv_DateScheduled",                                                                                                           comment: "Sch Date -"
    t.text     "Inv_DateSent",              limit: 65535,                                                                                     comment: "Date Sent"
    t.text     "Inv_Description",           limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Inv_InvConfirmedNote",      limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "Conf # -"
    t.text     "Inv_InvSentTo",             limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "To"
    t.integer  "Inv_InvSentVia",            limit: 1,                                                                                         comment: "Via"
    t.text     "Inv_Notes",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Inv_Number",                limit: 65535,                                                                                     comment: "Inv Number"
    t.text     "Inv_PaidMethod",            limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Inv_PaymentURL",            limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Inv_PaymentURL BU",         limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "Inv_ProjectName",           limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "Inv_Status",                limit: 1,                                                                                         comment: "Inv Status"
    t.integer  "Inv_Terms",                 limit: 1,                                                                                         comment: "Terms"
    t.text     "Inv_URL",                   limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "Inv URL"
    t.text     "Inv_URL BU",                limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "AutolinkPDF"
    t.index ["customer_id", "customer_type"], name: "customer_id", using: :btree
    t.index ["estimate_id"], name: "estimate_id", using: :btree
    t.index ["is_paid"], name: "is_paid", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["sales_order_id"], name: "sales_order_id", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "list_id",                                                          default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.string   "name",                      limit: 41
    t.string   "full_name",                 limit: 209
    t.boolean  "is_active",                                                        default: true,  null: false
    t.string   "parent_id",                 limit: 41
    t.integer  "sublevel",                                                         default: 0,     null: false
    t.string   "company_name",              limit: 41
    t.string   "salutation",                limit: 15
    t.string   "first_name",                limit: 25
    t.string   "middle_name",               limit: 25
    t.string   "last_name",                 limit: 25
    t.string   "job_title",                 limit: 41
    t.string   "bill_addr1",                limit: 41
    t.string   "bill_addr2",                limit: 41
    t.string   "bill_addr3",                limit: 41
    t.string   "bill_addr4",                limit: 41
    t.string   "bill_addr5",                limit: 41
    t.string   "bill_city",                 limit: 31
    t.string   "bill_state",                limit: 21
    t.string   "bill_postal_code",          limit: 13
    t.string   "bill_country",              limit: 31
    t.string   "bill_note",                 limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
    t.string   "ship_addr5",                limit: 41
    t.string   "ship_city",                 limit: 31
    t.string   "ship_state",                limit: 21
    t.string   "ship_postal_code",          limit: 13
    t.string   "ship_country",              limit: 31
    t.string   "ship_note",                 limit: 41
    t.string   "phone",                     limit: 21
    t.string   "alt_phone",                 limit: 21
    t.string   "fax",                       limit: 21
    t.string   "email",                     limit: 1023
    t.string   "cc",                        limit: 1023
    t.string   "contact",                   limit: 41
    t.string   "alt_contact",               limit: 41
    t.string   "customer_type",             limit: 159
    t.string   "terms",                     limit: 31
    t.string   "sales_rep",                 limit: 5
    t.decimal  "balance",                                 precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "total_balance",                           precision: 20, scale: 5, default: "0.0", null: false
    t.string   "sales_tax_code",            limit: 3
    t.string   "item_sales_tax",            limit: 31
    t.string   "account_number",            limit: 99
    t.string   "job_status",                limit: 41
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                  limit: 99
    t.string   "job_type",                  limit: 159
    t.string   "preferred_delivery_method", limit: 41
    t.string   "site_contact"
    t.string   "site_email"
    t.string   "site_phone"
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535
    t.integer  "FK_JobID_Parent"
    t.integer  "FK_Customers_PKEY"
    t.text     "Job_Company",               limit: 65535
    t.text     "Job_CompanyAbr",            limit: 65535
    t.text     "Job_Contact",               limit: 65535
    t.text     "Job_ContactAlt",            limit: 65535
    t.text     "Job_ContactName",           limit: 65535
    t.text     "Job_CustCLNo",              limit: 65535
    t.text     "Job_CustPONo",              limit: 65535
    t.date     "Job_DateEndActual",                                                                             comment: "Job Actual End Date"
    t.date     "Job_DateEndProjected",                                                                          comment: "Job Projected End Date"
    t.date     "Job_DateStartActual",                                                                           comment: "Job Actual Start Date"
    t.date     "Job_DateStartProjected",                                                                        comment: "Job Projected Start Date"
    t.text     "Job_DefaultJob",            limit: 65535
    t.text     "Job_Description_Long",      limit: 65535
    t.text     "Job_Description_Short",     limit: 65535
    t.integer  "Job_DisplayIndent"
    t.text     "Job_EmailCC",               limit: 65535
    t.text     "Job_EmailTo",               limit: 65535
    t.date     "Job_ExpiryDate"
    t.integer  "Job_HoursAmount_Default"
    t.integer  "Job_HoursAmount_Lock"
    t.integer  "Job_HoursAmount_Max"
    t.text     "Job_HourType",              limit: 65535
    t.text     "Job_InactiveFlag",          limit: 65535,                                                       comment: "Job Is Active"
    t.text     "Job_NameFirst",             limit: 65535
    t.text     "Job_NameLast",              limit: 65535
    t.text     "Job_NameMiddle",            limit: 65535
    t.text     "Job_NameSalutation",        limit: 65535
    t.text     "Job_Notes",                 limit: 65535
    t.text     "Job_PhoneAlt",              limit: 65535
    t.text     "Job_PhoneFax",              limit: 65535
    t.text     "Job_PhoneOffice",           limit: 65535
    t.text     "Job_QB_JobName",            limit: 65535
    t.text     "Portal_Job_Status",         limit: 65535
    t.text     "Portal_Job_Type",           limit: 65535
    t.text     "Job_PhoneCell",             limit: 65535
    t.index ["full_name"], name: "full_name", unique: true, using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
    t.index ["parent_id"], name: "parent_id", using: :btree
    t.index ["sublevel"], name: "sublevel", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "list_id"
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                 limit: 16
    t.string   "name",                          limit: 41
    t.string   "full_name",                     limit: 209
    t.boolean  "is_active",                                                               default: true
    t.string   "parent_id",                     limit: 41
    t.integer  "sublevel",                                                                default: 0
    t.string   "company_name",                  limit: 41
    t.string   "salutation",                    limit: 15
    t.string   "first_name",                    limit: 25
    t.string   "middle_name",                   limit: 25
    t.string   "last_name",                     limit: 25
    t.string   "job_title",                     limit: 41
    t.string   "bill_addr1",                    limit: 41
    t.string   "bill_addr2",                    limit: 41
    t.string   "bill_addr3",                    limit: 41
    t.string   "bill_addr4",                    limit: 41
    t.string   "bill_addr5",                    limit: 41
    t.string   "bill_city",                     limit: 31
    t.string   "bill_state",                    limit: 21
    t.string   "bill_postal_code",              limit: 13
    t.string   "bill_country",                  limit: 31
    t.string   "bill_note",                     limit: 41
    t.string   "ship_addr1",                    limit: 41
    t.string   "ship_addr2",                    limit: 41
    t.string   "ship_addr3",                    limit: 41
    t.string   "ship_addr4",                    limit: 41
    t.string   "ship_addr5",                    limit: 41
    t.string   "ship_city",                     limit: 31
    t.string   "ship_state",                    limit: 21
    t.string   "ship_postal_code",              limit: 13
    t.string   "ship_country",                  limit: 31
    t.string   "ship_note",                     limit: 41
    t.string   "phone",                         limit: 21
    t.string   "alt_phone",                     limit: 21
    t.string   "fax",                           limit: 21
    t.string   "email",                         limit: 1023
    t.string   "cc",                            limit: 1023
    t.string   "contact",                       limit: 41
    t.string   "alt_contact",                   limit: 41
    t.string   "customer_type",                 limit: 159
    t.string   "terms",                         limit: 31
    t.string   "sales_rep",                     limit: 5
    t.decimal  "balance",                                        precision: 20, scale: 5, default: "0.0"
    t.decimal  "total_balance",                                  precision: 20, scale: 5, default: "0.0"
    t.string   "sales_tax_code",                limit: 3
    t.string   "item_sales_tax",                limit: 31
    t.string   "account_number",                limit: 99
    t.string   "job_status",                    limit: 41
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                      limit: 99
    t.string   "job_type",                      limit: 159
    t.string   "preferred_delivery_method",     limit: 41
    t.string   "site_contact"
    t.string   "site_email"
    t.string   "site_phone"
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                  limit: 16777215
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",          limit: 16777215
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_ProgMan_Employees_PKEY"
    t.integer  "FK_ProjMan_Employees_PKEY"
    t.integer  "FK_TechLead_Employees_PKEY"
    t.integer  "FK_Foreman_Employees_PKEY"
    t.integer  "FK_TechForeman_Employees_PKEY"
    t.text     "Project_Name",                  limit: 65535
    t.text     "Project_Type",                  limit: 65535
    t.date     "Project_DateStartEstimated"
    t.date     "Project_DateEndEstimated"
    t.date     "Project_DateStartActual"
    t.date     "Project_DateEndActual"
    t.date     "Project_RoughInStart"
    t.date     "Project_RoughInEnd"
    t.date     "Project_DeviceInstallStart"
    t.date     "Project_DeviceInstallEnd"
    t.date     "Project_CommissioningStart"
    t.date     "Project_CommissioningEnd"
    t.text     "Project_ScopeText",             limit: 65535
    t.text     "Project_NameSalutation",        limit: 65535
    t.text     "Project_NameFirst",             limit: 65535
    t.text     "Project_NameMiddle",            limit: 65535
    t.text     "Project_NameLast",              limit: 65535
    t.text     "Project_PhoneMain",             limit: 65535
    t.text     "Project_EmailMain",             limit: 65535
    t.text     "Project_PhoneAlternate",        limit: 65535
    t.text     "Project_EmailCC",               limit: 65535
    t.text     "Project_PhoneCell",             limit: 65535
    t.text     "Project_PhoneFax",              limit: 65535
    t.text     "Project_Address1",              limit: 65535,                                             comment: "Project Site Address"
    t.text     "Project_Address2",              limit: 65535
    t.text     "Project_Address_Parking1",      limit: 65535,                                             comment: "Project Primary Parking"
    t.text     "Project_Address_Parking2",      limit: 65535,                                             comment: "Project Secondary Parking"
    t.text     "Project_City",                  limit: 65535
    t.text     "Project_State",                 limit: 65535
    t.text     "Project_Zip",                   limit: 65535
    t.text     "Project_Park_1_Address",        limit: 65535,                                             comment: "Primary Parking"
    t.text     "Project_Park_1_Address_City",   limit: 65535,                                             comment: "Primary Parking City"
    t.text     "Project_Park_1_Address_State",  limit: 65535,                                             comment: "Primary Parking State"
    t.integer  "Project_Park_1_Address_Zip",                                                              comment: "Primary Parking Zip Code"
    t.text     "Project_Park_2_Address",        limit: 65535,                                             comment: "Secondary Parking Address"
    t.text     "Project_Park_2_Address_City",   limit: 65535,                                             comment: "Secondary Parking City"
    t.text     "Project_Park_2_Address_State",  limit: 65535,                                             comment: "Secondary Parking State"
    t.integer  "Project_Park_2_Address_Zip",                                                              comment: "Secondary Parking Zip Code"
    t.integer  "Project_PercentComplete"
    t.text     "Project_IsClosed",              limit: 65535
    t.integer  "Project_Status",                limit: 1
    t.integer  "Project_QuotedTechLabor"
    t.integer  "Project_QuotedRILabor"
    t.integer  "Project_QuotedDILabor"
    t.integer  "Project_QuotedCOLabor"
    t.integer  "Project_QuotedEngLabor"
    t.integer  "Project_QuotedPMLabor"
    t.text     "Project_UseCase",               limit: 65535
    t.integer  "Project_QuotedLgstLabor"
    t.integer  "Project_QuotedMaintLabor"
    t.index ["full_name"], name: "full_name", unique: true, using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
    t.index ["parent_id"], name: "parent_id", using: :btree
    t.index ["sublevel"], name: "sublevel", using: :btree
  end

  create_table "purchase_order_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "purchase_order_id"
    t.string  "item"
    t.string  "manufacturer_part_number"
    t.text    "desc",                     limit: 65535
    t.decimal "quantity",                               precision: 20, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set"
    t.decimal "rate",                                   precision: 20, scale: 5
    t.decimal "amount",                                 precision: 20, scale: 5, default: "0.0", null: false
    t.string  "inventory_site_location"
    t.string  "customer_id"
    t.string  "customer_type",            limit: 209
    t.date    "service_date"
    t.decimal "received_quantity",                      precision: 20, scale: 5
    t.decimal "unbilled_quantity",                      precision: 20, scale: 5
    t.boolean "is_billed"
    t.boolean "is_manually_closed"
    t.index ["customer_id", "customer_type"], name: "customer_id", using: :btree
    t.index ["purchase_order_id"], name: "purchase_order_id", using: :btree
  end

  create_table "purchase_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                           default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "vendor_id"
    t.string   "sales_order_id"
    t.string   "inventory_site"
    t.string   "ship_to_entity"
    t.string   "template"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "vendor_addr1",              limit: 41
    t.string   "vendor_addr2",              limit: 41
    t.string   "vendor_addr3",              limit: 41
    t.string   "vendor_addr4",              limit: 41
    t.string   "vendor_addr5",              limit: 41
    t.string   "vendor_city",               limit: 31
    t.string   "vendor_state",              limit: 21
    t.string   "vendor_postal_code",        limit: 13
    t.string   "vendor_country",            limit: 31
    t.string   "vendor_note",               limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
    t.string   "ship_addr5",                limit: 41
    t.string   "ship_city",                 limit: 31
    t.string   "ship_state",                limit: 21
    t.string   "ship_postal_code",          limit: 13
    t.string   "ship_country",              limit: 31
    t.string   "ship_note",                 limit: 41
    t.string   "terms"
    t.date     "due_date"
    t.date     "expected_date"
    t.string   "ship_method"
    t.string   "fob"
    t.decimal  "total_amount",                            precision: 20, scale: 5, default: "0.0", null: false
    t.boolean  "is_manually_closed"
    t.boolean  "is_fully_received"
    t.text     "memo",                      limit: 65535
    t.string   "vendor_msg"
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_qSalesOrders_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.decimal  "PO_Amount",                               precision: 10, scale: 2
    t.text     "PO_ConfirmationNo",         limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.date     "PO_DateComplete"
    t.date     "PO_DateConfirmed"
    t.date     "PO_DateCreation"
    t.date     "PO_DateDelivered"
    t.date     "PO_DateETA"
    t.date     "PO_DateReceived"
    t.date     "PO_DateSent"
    t.date     "PO_DateShipped"
    t.date     "PO_ETA"
    t.text     "PO_Notes",                  limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_Number",                 limit: 65535
    t.text     "PO_ProjectName",            limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_ShippedTo",              limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_Status",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_URL",                    limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_URL BU",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_Vendor",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.date     "PO_NBD"
    t.text     "PO_Bundle",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "PO_OrderByDate",            limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.index ["is_fully_received"], name: "is_fully_received", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["sales_order_id"], name: "sales_order_id", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
    t.index ["vendor_id"], name: "vendor_id", using: :btree
  end

  create_table "qbwc_errors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "worker_class",                null: false
    t.string   "model_id"
    t.text     "error_message", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "qbwc_history", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "began_at"
    t.string   "ticket"
    t.string   "run_time"
    t.text     "error",                limit: 65535
    t.string   "status_code_id"
    t.string   "status_code_severity"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["status_code_id"], name: "status_code_id", using: :btree
  end

  create_table "qbwc_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "company",                          limit: 1000
    t.string   "worker_class",                     limit: 100
    t.boolean  "enabled",                                        default: false, null: false
    t.text     "request_index",                    limit: 65535
    t.text     "requests",                         limit: 65535
    t.boolean  "requests_provided_when_job_added",               default: false, null: false
    t.text     "data",                             limit: 65535
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.index ["company"], name: "index_qbwc_jobs_on_company", length: { company: 150 }, using: :btree
    t.index ["name"], name: "index_qbwc_jobs_on_name", unique: true, using: :btree
  end

  create_table "qbwc_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ticket"
    t.string   "user"
    t.string   "company",      limit: 1000
    t.integer  "progress",                   default: 0, null: false
    t.string   "current_job"
    t.string   "iterator_id"
    t.text     "error",        limit: 65535
    t.text     "pending_jobs", limit: 65535,             null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "receive_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                    default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",      limit: 16
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_type",      limit: 209
    t.string   "invoice_id"
    t.string   "ar_account",         limit: 159
    t.date     "txn_date"
    t.string   "ref_number",         limit: 20
    t.decimal  "total_amount",                     precision: 20, scale: 5, default: "0.0", null: false
    t.string   "payment_method",     limit: 31
    t.string   "memo",               limit: 4095
    t.string   "deposit_to_account", limit: 159
    t.decimal  "unused_payment",                   precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "unused_credits",                   precision: 20, scale: 5, default: "0.0", null: false
    t.text     "URL",                limit: 65535
    t.index ["customer_id", "customer_type"], name: "customer", using: :btree
    t.index ["invoice_id"], name: "invoice_id", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "sales_order_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "sales_order_id"
    t.string  "item"
    t.text    "desc",                    limit: 65535
    t.decimal "quantity",                              precision: 20, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set"
    t.decimal "rate",                                  precision: 20, scale: 5
    t.float   "rate_percent",            limit: 24
    t.decimal "amount",                                precision: 20, scale: 5
    t.string  "inventory_site"
    t.string  "inventory_site_location"
    t.string  "serial_number"
    t.string  "lot_number"
    t.string  "sales_tax_code"
    t.decimal "invoiced",                              precision: 20, scale: 5
    t.boolean "is_manually_closed"
    t.index ["sales_order_id"], name: "sales_order_id", using: :btree
  end

  create_table "sales_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                            default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_type",              limit: 209
    t.string   "estimate_id",                limit: 209,                            default: ""
    t.string   "template"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "bill_addr1",                 limit: 41
    t.string   "bill_addr2",                 limit: 41
    t.string   "bill_addr3",                 limit: 41
    t.string   "bill_addr4",                 limit: 41
    t.string   "bill_addr5",                 limit: 41
    t.string   "bill_city",                  limit: 31
    t.string   "bill_state",                 limit: 21
    t.string   "bill_postal_code",           limit: 13
    t.string   "bill_country",               limit: 31
    t.string   "bill_note",                  limit: 41
    t.string   "ship_addr1",                 limit: 41
    t.string   "ship_addr2",                 limit: 41
    t.string   "ship_addr3",                 limit: 41
    t.string   "ship_addr4",                 limit: 41
    t.string   "ship_addr5",                 limit: 41
    t.string   "ship_city",                  limit: 31
    t.string   "ship_state",                 limit: 21
    t.string   "ship_postal_code",           limit: 13
    t.string   "ship_country",               limit: 31
    t.string   "ship_note",                  limit: 41
    t.string   "po_number"
    t.string   "terms"
    t.date     "due_date"
    t.string   "sales_rep"
    t.string   "fob"
    t.date     "ship_date"
    t.string   "ship_method"
    t.decimal  "subtotal",                                 precision: 20, scale: 5, default: "0.0", null: false
    t.string   "item_sales_tax"
    t.float    "sales_tax_percentage",       limit: 24
    t.decimal  "sales_tax_total",                          precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "total_amount",                             precision: 20, scale: 5, default: "0.0", null: false
    t.boolean  "is_manually_closed"
    t.boolean  "is_fully_invoiced"
    t.text     "memo",                       limit: 65535
    t.string   "customer_msg"
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code"
    t.datetime "CreationTimeStamp",                                                                                                            comment: "Date Created"
    t.text     "CreationUser",               limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",       limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.decimal  "SO_Amount",                                precision: 10, scale: 2,                                                            comment: "Amount"
    t.decimal  "SO_ClientPOAmount",                        precision: 10, scale: 2,                                                            comment: "Amount"
    t.date     "SO_ClientPODate",                                                                                                              comment: "Date"
    t.text     "SO_ClientPONo",              limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "Number"
    t.text     "SO_ClientPOURL",             limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "URL to PO"
    t.text     "SO_ClientPOURL BU",          limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.date     "SO_DateCompleted_Actual",                                                                                                      comment: "Act. Completion"
    t.date     "SO_DateCompleted_Estimated",                                                                                                   comment: "Est. Completion"
    t.date     "SO_DateCreated"
    t.date     "SO_DateFDOB",                                                                                                                  comment: "FDOB"
    t.date     "SO_DateStarted_Actual",                                                                                                        comment: "Act. Start"
    t.date     "SO_DateStarted_Estimated",                                                                                                     comment: "Est. Start"
    t.text     "SO_Notes",                   limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "Notes"
    t.text     "SO_Number",                  limit: 65535,                                                                                     comment: "Number"
    t.integer  "SO_PercentComplete",                                                                                                           comment: "% Complete"
    t.text     "SO_ProjectForeman",          limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "SO_ProjectManager",          limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "SO_Status",                  limit: 1,                                                                                         comment: "SO Status"
    t.text     "SO_URL",                     limit: 65535,                                                       collation: "utf8_unicode_ci", comment: "URL to SO"
    t.text     "SO_URL BU",                  limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.date     "SO_MaterialsDateNeededBy"
    t.text     "SO_MaterialsStatus",         limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.text     "SO_LOM_URL",                 limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.integer  "FK_ProgMan_Employees_PKEY"
    t.integer  "FK_TechLead_Employees_PKEY"
    t.text     "SO_Description",             limit: 65535,                                                       collation: "utf8_unicode_ci"
    t.index ["customer_id", "customer_type"], name: "customer_id", using: :btree
    t.index ["estimate_id"], name: "estimate_id", using: :btree
    t.index ["is_fully_invoiced"], name: "is_fully_invoiced", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "list_id",                                                          default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",              limit: 16
    t.string   "name",                       limit: 41
    t.boolean  "is_active",                                                        default: true,  null: false
    t.string   "company_name",               limit: 41
    t.string   "salutation",                 limit: 15
    t.string   "first_name",                 limit: 25
    t.string   "middle_name",                limit: 5
    t.string   "last_name",                  limit: 25
    t.string   "job_title",                  limit: 41
    t.string   "vendor_addr1",               limit: 41
    t.string   "vendor_addr2",               limit: 41
    t.string   "vendor_addr3",               limit: 41
    t.string   "vendor_addr4",               limit: 41
    t.string   "vendor_addr5",               limit: 41
    t.string   "vendor_city",                limit: 31
    t.string   "vendor_state",               limit: 21
    t.string   "vendor_postal_code",         limit: 13
    t.string   "vendor_country",             limit: 31
    t.string   "vendor_note",                limit: 41
    t.string   "ship_addr1",                 limit: 41
    t.string   "ship_addr2",                 limit: 41
    t.string   "ship_addr3",                 limit: 41
    t.string   "ship_addr4",                 limit: 41
    t.string   "ship_addr5",                 limit: 41
    t.string   "ship_city",                  limit: 31
    t.string   "ship_state",                 limit: 21
    t.string   "ship_postal_code",           limit: 13
    t.string   "ship_country",               limit: 31
    t.string   "ship_note",                  limit: 41
    t.string   "phone",                      limit: 21
    t.string   "alt_phone",                  limit: 21
    t.string   "fax",                        limit: 21
    t.string   "email",                      limit: 1023
    t.string   "cc",                         limit: 1023
    t.string   "contact",                    limit: 41
    t.string   "alt_contact",                limit: 41
    t.string   "name_on_check",              limit: 41
    t.string   "account_number",             limit: 99
    t.string   "vendor_type",                limit: 159
    t.string   "terms",                      limit: 31
    t.decimal  "credit_limit",                            precision: 20, scale: 5
    t.string   "vendor_tax_ident",           limit: 15
    t.boolean  "is_vendor_eligible_for1099"
    t.decimal  "balance",                                 precision: 20, scale: 5, default: "0.0", null: false
    t.string   "billing_rate",               limit: 31
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
    t.index ["name"], name: "name", unique: true, using: :btree
  end

end

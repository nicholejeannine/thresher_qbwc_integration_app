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

ActiveRecord::Schema.define(version: 0) do

  create_table "Customers", primary_key: "Customers_PKEY", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.timestamp "CreationTimeStamp"
    t.text "CreationUser"
    t.timestamp "LastModificationTimeStamp"
    t.text "LastModificationUser"
    t.text "Cust_BillTo_Address1"
    t.text "Cust_BillTo_Address2"
    t.text "Cust_BillTo_City"
    t.text "Cust_BillTo_Company"
    t.text "Cust_BillTo_Email"
    t.text "Cust_BillTo_Name"
    t.text "Cust_AP_Name", comment: "A/P Name"
    t.text "Cust_BillTo_Phone", comment: "A/P Phone"
    t.text "Cust_BillTo_State"
    t.integer "Cust_BillTo_Zip"
    t.text "Cust_Company"
    t.text "Cust_CompanyAbr", comment: "Customer Short Name"
    t.text "Cust_EmailCC"
    t.text "Cust_EmailTo"
    t.text "Cust_InactiveFlag"
    t.text "Cust_NameFirst"
    t.text "Cust_NameLast"
    t.text "Cust_NameMiddle"
    t.text "Cust_NameSalutation"
    t.text "Cust_PhoneAlt"
    t.text "Cust_PhoneCell"
    t.text "Cust_PhoneFax", comment: "A/P FAX"
    t.text "Cust_PhoneOffice"
    t.string "sales_rep", limit: 5, default: ""
    t.text "Cust_ShipTo_Address1"
    t.text "Cust_ShipTo_Address2"
    t.text "Cust_ShipTo_City"
    t.text "Cust_ShipTo_Company"
    t.text "Cust_ShipTo_Name"
    t.text "Cust_ShipTo_State"
    t.integer "Cust_ShipTo_Zip"
    t.string "site_contact"
    t.string "site_email"
    t.string "site_phone"
    t.string "list_id", limit: 41
    t.index ["CreationTimeStamp", "list_id"], name: "CreationTimeStamp", unique: true
  end

  create_table "Jobs", primary_key: "Jobs_PKEY", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.timestamp "CreationTimeStamp"
    t.text "CreationUser"
    t.timestamp "LastModificationTimeStamp"
    t.text "LastModificationUser"
    t.integer "FK_JobID_Parent"
    t.integer "FK_Customers_PKEY"
    t.text "Job_Company"
    t.text "Job_CompanyAbr"
    t.text "Job_Contact"
    t.text "Job_ContactAlt"
    t.date "Job_DateEndActual", comment: "Job Actual End Date"
    t.date "Job_DateEndProjected", comment: "Job Projected End Date"
    t.date "Job_DateStartActual", comment: "Job Actual Start Date"
    t.date "Job_DateStartProjected", comment: "Job Projected Start Date"
    t.text "Job_Description_Long"
    t.text "Job_Description_Short"
    t.text "Job_EmailCC"
    t.text "Job_EmailTo"
    t.text "Job_InactiveFlag", comment: "Job Is Active"
    t.text "Job_NameFirst"
    t.text "Job_NameLast"
    t.text "Job_NameMiddle"
    t.text "Job_NameSalutation"
    t.text "Job_PhoneAlt"
    t.text "Job_PhoneFax"
    t.text "Job_PhoneOffice"
    t.text "Job_QB_JobName"
    t.text "Job_Status"
    t.string "list_id", limit: 41
    t.string "full_name", limit: 209
    t.string "mobile"
    t.string "bill_addr1", limit: 41
    t.string "bill_addr2", limit: 41
    t.string "bill_addr3", limit: 41
    t.string "bill_addr4", limit: 41
    t.string "bill_city", limit: 31
    t.string "bill_state", limit: 41
    t.string "bill_postal_code", limit: 31
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 41
    t.string "ship_postal_code", limit: 31
    t.string "sales_rep", limit: 5
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY"
    t.index ["FK_JobID_Parent"], name: "FK_JobID_Parent"
    t.index ["full_name"], name: "full_name", unique: true
    t.index ["list_id"], name: "list_id", unique: true
  end

  create_table "clients", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "list_id", default: "", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.string "full_name", limit: 209
    t.boolean "is_active", default: true, null: false
    t.string "company_name", limit: 41
    t.string "salutation", limit: 15
    t.string "first_name", limit: 25
    t.string "middle_name", limit: 25
    t.string "last_name", limit: 25
    t.string "job_title", limit: 41
    t.string "bill_addr1", limit: 41
    t.string "bill_addr2", limit: 41
    t.string "bill_addr3", limit: 41
    t.string "bill_addr4", limit: 41
    t.string "bill_city", limit: 31
    t.string "bill_state", limit: 21
    t.string "bill_postal_code", limit: 13
    t.string "bill_country", limit: 31
    t.string "bill_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.string "phone", limit: 21
    t.string "alt_phone", limit: 21
    t.string "fax", limit: 21
    t.string "email", limit: 1023
    t.string "cc", limit: 1023
    t.string "contact", limit: 41
    t.string "alt_contact", limit: 41
    t.string "customer_type", limit: 159
    t.string "terms", limit: 31
    t.string "sales_rep", limit: 5
    t.decimal "total_balance", precision: 20, scale: 5, default: "0.0", null: false
    t.string "sales_tax_code", limit: 3
    t.string "item_sales_tax", limit: 31
    t.string "account_number", limit: 99
    t.string "preferred_delivery_method", limit: 41
    t.string "site_contact"
    t.string "site_email"
    t.string "site_phone"
    t.index ["full_name"], name: "full_name", unique: true
    t.index ["is_active"], name: "is_active"
    t.index ["list_id"], name: "list_id", unique: true
  end

  create_table "estimates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "txn_id", default: "", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.integer "txn_number"
    t.string "customer_full_name", limit: 209
    t.string "template", limit: 159
    t.date "txn_date"
    t.string "ref_number", limit: 11
    t.string "bill_addr1", limit: 41
    t.string "bill_addr2", limit: 41
    t.string "bill_addr3", limit: 41
    t.string "bill_addr4", limit: 41
    t.string "bill_city", limit: 31
    t.string "bill_state", limit: 21
    t.string "bill_postal_code", limit: 13
    t.string "bill_country", limit: 31
    t.string "bill_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.boolean "is_active", default: true, null: false
    t.string "terms", limit: 31
    t.date "due_date"
    t.string "sales_rep", limit: 5
    t.decimal "subtotal", precision: 20, scale: 5, default: "0.0", null: false
    t.string "item_sales_tax", limit: 31
    t.float "sales_tax_percentage", limit: 24
    t.decimal "sales_tax_total", precision: 20, scale: 5, default: "0.0", null: false
    t.decimal "total_amount", precision: 20, scale: 5, default: "0.0", null: false
    t.string "memo", limit: 4095
    t.string "customer_msg", limit: 101
    t.boolean "is_to_be_emailed"
    t.string "customer_sales_tax_code", limit: 3
    t.index ["customer_full_name"], name: "customer_full_name"
    t.index ["customer_full_name"], name: "customer_full_name_2"
    t.index ["is_active"], name: "is_active"
    t.index ["ref_number"], name: "ref_number"
    t.index ["txn_id"], name: "txn_id", unique: true
  end

  create_table "invoices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "txn_id", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.integer "txn_number"
    t.string "customer_full_name", limit: 209
    t.integer "sales_order_id"
    t.string "template", limit: 31
    t.date "txn_date"
    t.string "ref_number", limit: 11
    t.string "bill_addr1", limit: 41
    t.string "bill_addr2", limit: 41
    t.string "bill_addr3", limit: 41
    t.string "bill_addr4", limit: 41
    t.string "bill_city", limit: 31
    t.string "bill_state", limit: 21
    t.string "bill_postal_code", limit: 13
    t.string "bill_country", limit: 31
    t.string "bill_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.string "po_number", limit: 25
    t.string "terms", limit: 31
    t.date "due_date"
    t.string "sales_rep", limit: 5
    t.date "ship_date"
    t.string "ship_method", limit: 15
    t.decimal "subtotal", precision: 20, scale: 5, default: "0.0", null: false
    t.string "item_sales_tax", limit: 31
    t.float "sales_tax_percentage", limit: 24
    t.decimal "sales_tax_total", precision: 20, scale: 5, default: "0.0", null: false
    t.decimal "applied_amount", precision: 20, scale: 5, default: "0.0", null: false
    t.decimal "balance_remaining", precision: 20, scale: 5, default: "0.0", null: false
    t.string "memo", limit: 4095
    t.boolean "is_paid"
    t.string "customer_msg", limit: 101
    t.boolean "is_to_be_printed"
    t.boolean "is_to_be_emailed"
    t.string "customer_sales_tax_code", limit: 3
    t.index ["customer_full_name"], name: "customer_full_name"
    t.index ["ref_number"], name: "ref_number"
    t.index ["sales_order_id"], name: "sales_order_id"
    t.index ["txn_id"], name: "txn_id", unique: true
  end

  create_table "projects", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "list_id"
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.string "name", limit: 41
    t.string "full_name", limit: 209
    t.boolean "is_active", default: true, null: false
    t.string "parent_list_id"
    t.string "company_name", limit: 41
    t.string "salutation", limit: 15
    t.string "first_name", limit: 25
    t.string "middle_name", limit: 25
    t.string "last_name", limit: 25
    t.string "job_title", limit: 41
    t.string "bill_addr1", limit: 41
    t.string "bill_addr2", limit: 41
    t.string "bill_addr3", limit: 41
    t.string "bill_addr4", limit: 41
    t.string "bill_city", limit: 31
    t.string "bill_state", limit: 21
    t.string "bill_postal_code", limit: 13
    t.string "bill_country", limit: 31
    t.string "bill_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.string "phone", limit: 21
    t.string "alt_phone", limit: 21
    t.string "fax", limit: 21
    t.string "email", limit: 1023
    t.string "cc", limit: 1023
    t.string "contact", limit: 41
    t.string "alt_contact", limit: 41
    t.string "customer_type", limit: 159
    t.string "terms", limit: 31
    t.string "sales_rep", limit: 5
    t.decimal "total_balance", precision: 20, scale: 5, default: "0.0"
    t.string "sales_tax_code", limit: 3
    t.string "item_sales_tax", limit: 31
    t.string "account_number", limit: 99
    t.string "job_status", limit: 41
    t.date "job_start_date"
    t.date "job_projected_end_date"
    t.date "job_end_date"
    t.string "job_desc", limit: 99
    t.string "job_type", limit: 159
    t.string "preferred_delivery_method", limit: 41
    t.string "site_contact"
    t.string "site_email"
    t.string "site_phone"
    t.index ["full_name"], name: "full_name", unique: true
    t.index ["is_active"], name: "is_active"
    t.index ["list_id"], name: "list_id", unique: true
    t.index ["parent_list_id"], name: "parent_list_id"
  end

  create_table "purchase_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "txn_id", default: "", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence"
    t.integer "txn_number"
    t.string "vendor_name", limit: 41
    t.integer "estimate_id"
    t.integer "sales_order_id"
    t.string "inventory_site"
    t.string "ship_to_entity"
    t.string "template"
    t.date "txn_date"
    t.string "ref_number"
    t.string "vendor_addr1", limit: 41
    t.string "vendor_addr2", limit: 41
    t.string "vendor_addr3", limit: 41
    t.string "vendor_addr4", limit: 41
    t.string "vendor_city", limit: 31
    t.string "vendor_state", limit: 21
    t.string "vendor_postal_code", limit: 13
    t.string "vendor_country", limit: 31
    t.string "vendor_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.string "terms"
    t.date "due_date"
    t.date "expected_date"
    t.decimal "total_amount", precision: 20, scale: 5, default: "0.0", null: false
    t.boolean "is_manually_closed"
    t.boolean "is_fully_received"
    t.text "memo"
    t.string "vendor_msg"
    t.boolean "is_to_be_printed"
    t.boolean "is_to_be_emailed"
    t.index ["estimate_id"], name: "estimate_id"
    t.index ["ref_number"], name: "ref_number"
    t.index ["sales_order_id"], name: "sales_order_id"
    t.index ["time_created"], name: "time_created"
    t.index ["time_modified"], name: "time_modified"
    t.index ["txn_id"], name: "txn_id", unique: true
    t.index ["vendor_name"], name: "vendor"
  end

  create_table "qb_customers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "list_id", limit: 209, null: false
    t.string "full_name", limit: 209
    t.index ["full_name"], name: "full_name", unique: true
    t.index ["list_id"], name: "list_id", unique: true
  end

  create_table "qb_employees", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "list_id", limit: 209, null: false
    t.string "name", limit: 41
    t.string "first_name", limit: 25
    t.string "middle_name", limit: 5
    t.string "last_name", limit: 25
    t.boolean "is_active", default: true, null: false
    t.index ["list_id"], name: "list_id", unique: true
  end

  create_table "qbwc_errors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "worker_class", null: false
    t.string "model_id"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qbwc_history", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "began_at"
    t.string "ticket"
    t.string "run_time"
    t.text "error"
    t.string "status_code_id"
    t.string "status_code_severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_code_id"], name: "status_code_id"
  end

  create_table "qbwc_jobs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "company", limit: 1000
    t.string "worker_class", limit: 100
    t.boolean "enabled", default: false, null: false
    t.text "request_index"
    t.text "requests"
    t.boolean "requests_provided_when_job_added", default: false, null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company"], name: "index_qbwc_jobs_on_company", length: { company: 150 }
    t.index ["name"], name: "index_qbwc_jobs_on_name", unique: true
  end

  create_table "qbwc_sessions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ticket"
    t.string "user"
    t.string "company", limit: 1000
    t.integer "progress", default: 0, null: false
    t.string "current_job"
    t.string "iterator_id"
    t.text "error"
    t.text "pending_jobs", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qbwc_timecard_errors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "worker_class", null: false
    t.string "model_id"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receive_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "txn_id", default: "", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.integer "txn_number"
    t.string "customer_full_name", limit: 209
    t.date "txn_date"
    t.string "ref_number", limit: 20
    t.decimal "total_amount", precision: 20, scale: 5, default: "0.0", null: false
    t.string "payment_method", limit: 31
    t.string "memo", limit: 4095
    t.string "deposit_to_account", limit: 159
    t.decimal "unused_payment", precision: 20, scale: 5, default: "0.0", null: false
    t.decimal "unused_credits", precision: 20, scale: 5, default: "0.0", null: false
    t.index ["customer_full_name"], name: "customer_full_name"
    t.index ["ref_number"], name: "ref_number"
    t.index ["txn_id"], name: "txn_id", unique: true
  end

  create_table "sales_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "txn_id", default: "", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence"
    t.integer "txn_number"
    t.string "customer_full_name", limit: 209
    t.integer "estimate_id"
    t.string "template"
    t.date "txn_date"
    t.string "ref_number"
    t.string "bill_addr1", limit: 41
    t.string "bill_addr2", limit: 41
    t.string "bill_addr3", limit: 41
    t.string "bill_addr4", limit: 41
    t.string "bill_city", limit: 31
    t.string "bill_state", limit: 21
    t.string "bill_postal_code", limit: 13
    t.string "bill_country", limit: 31
    t.string "bill_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.string "po_number"
    t.string "terms"
    t.date "due_date"
    t.string "sales_rep"
    t.date "ship_date"
    t.decimal "subtotal", precision: 20, scale: 5, default: "0.0", null: false
    t.string "item_sales_tax"
    t.float "sales_tax_percentage", limit: 24
    t.decimal "sales_tax_total", precision: 20, scale: 5, default: "0.0", null: false
    t.decimal "total_amount", precision: 20, scale: 5, default: "0.0", null: false
    t.boolean "is_manually_closed"
    t.boolean "is_fully_invoiced"
    t.text "memo"
    t.string "customer_msg"
    t.boolean "is_to_be_printed"
    t.boolean "is_to_be_emailed"
    t.string "customer_sales_tax_code"
    t.index ["customer_full_name"], name: "customer_full_name"
    t.index ["estimate_id"], name: "estimate_id"
    t.index ["is_fully_invoiced"], name: "is_fully_invoiced"
    t.index ["ref_number"], name: "ref_number"
    t.index ["txn_id"], name: "txn_id", unique: true
  end

  create_table "time_trackings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "txn_id", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.date "txn_date"
    t.string "employee_list_id", limit: 209
    t.string "employee_full_name", limit: 209
    t.string "customer_full_name", limit: 209
    t.string "item_service", limit: 159
    t.string "duration", limit: 40
    t.string "payroll_item_wage", limit: 209
    t.string "notes", limit: 4095
    t.string "billable_status", limit: 20
    t.index ["customer_full_name"], name: "customer_full_name"
    t.index ["employee_full_name"], name: "entity_full_name"
    t.index ["item_service"], name: "item_service_full_name"
    t.index ["txn_id"], name: "txn_id", unique: true
  end

  create_table "vendors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "list_id", default: "", null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string "edit_sequence", limit: 16
    t.string "name", limit: 41
    t.boolean "is_active", default: true, null: false
    t.string "company_name", limit: 41
    t.string "salutation", limit: 15
    t.string "first_name", limit: 25
    t.string "middle_name", limit: 5
    t.string "last_name", limit: 25
    t.string "job_title", limit: 41
    t.string "vendor_addr1", limit: 41
    t.string "vendor_addr2", limit: 41
    t.string "vendor_addr3", limit: 41
    t.string "vendor_addr4", limit: 41
    t.string "vendor_city", limit: 31
    t.string "vendor_state", limit: 21
    t.string "vendor_postal_code", limit: 13
    t.string "vendor_country", limit: 31
    t.string "vendor_note", limit: 41
    t.string "ship_addr1", limit: 41
    t.string "ship_addr2", limit: 41
    t.string "ship_addr3", limit: 41
    t.string "ship_addr4", limit: 41
    t.string "ship_city", limit: 31
    t.string "ship_state", limit: 21
    t.string "ship_postal_code", limit: 13
    t.string "ship_country", limit: 31
    t.string "ship_note", limit: 41
    t.string "phone", limit: 41
    t.string "alt_phone", limit: 21
    t.string "fax", limit: 21
    t.string "email", limit: 1023
    t.string "cc", limit: 1023
    t.string "contact", limit: 41
    t.string "alt_contact", limit: 41
    t.string "name_on_check", limit: 41
    t.string "account_number", limit: 99
    t.string "vendor_type", limit: 159
    t.string "terms", limit: 31
    t.decimal "credit_limit", precision: 20, scale: 5
    t.string "vendor_tax_ident", limit: 15
    t.boolean "is_vendor_eligible_for1099"
    t.decimal "balance", precision: 20, scale: 5, default: "0.0", null: false
    t.string "billing_rate", limit: 31
    t.index ["is_active"], name: "is_active"
    t.index ["list_id"], name: "list_id", unique: true
    t.index ["name"], name: "name", unique: true
  end

end

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

ActiveRecord::Schema.define(version: 20170712220110) do

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
    t.string   "bill_city",                 limit: 31
    t.string   "bill_state",                limit: 21
    t.string   "bill_postal_code",          limit: 13
    t.string   "bill_country",              limit: 31
    t.string   "bill_note",                 limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
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
    t.decimal  "total_balance",                           precision: 20, scale: 5, default: "0.0", null: false
    t.string   "sales_tax_code",            limit: 3
    t.string   "item_sales_tax",            limit: 31
    t.string   "account_number",            limit: 99
    t.string   "preferred_delivery_method", limit: 41
    t.string   "site_contact"
    t.string   "site_email"
    t.string   "site_phone"
    t.index ["full_name"], name: "full_name", unique: true, using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
  end

  create_table "estimate_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "txn_line_id", default: "", null: false
    t.integer  "estimate_id"
    t.string  "item"
    t.string  "desc",                    limit: 4095
    t.decimal "quantity",                             precision: 20, scale: 5
    t.string  "unit_of_measure",         limit: 31
    t.string  "override_uom_set",        limit: 31
    t.decimal "rate",                                 precision: 20, scale: 5
    t.float   "rate_percent",            limit: 24
    t.decimal "amount",                               precision: 20, scale: 5, default: "0.0", null: false
    t.string  "inventory_site",          limit: 31
    t.string  "sales_tax_code",          limit: 3
    t.decimal "markup_rate",                          precision: 20, scale: 5
    t.float   "markup_rate_percent",     limit: 24
    t.index ["estimate_id"], name: "estimate_id", using: :btree
    t.index ["txn_line_id"], name: "index_estimate_lines_on_txn_line_id", unique: true, using: :btree
  end

  create_table "estimates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                              default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                limit: 16
    t.integer  "txn_number"
    t.string   "customer",                limit: 209
    t.string   "template",                     limit: 159
    t.date     "txn_date"
    t.string   "ref_number",                   limit: 11
    t.string   "bill_addr1",                   limit: 41
    t.string   "bill_addr2",                   limit: 41
    t.string   "bill_addr3",                   limit: 41
    t.string   "bill_addr4",                   limit: 41
    t.string   "bill_city",                    limit: 31
    t.string   "bill_state",                   limit: 21
    t.string   "bill_postal_code",             limit: 13
    t.string   "bill_country",                 limit: 31
    t.string   "bill_note",                    limit: 41
    t.string   "ship_addr1",                   limit: 41
    t.string   "ship_addr2",                   limit: 41
    t.string   "ship_addr3",                   limit: 41
    t.string   "ship_addr4",                   limit: 41
    t.string   "ship_city",                    limit: 31
    t.string   "ship_state",                   limit: 21
    t.string   "ship_postal_code",             limit: 13
    t.string   "ship_country",                 limit: 31
    t.string   "ship_note",                    limit: 41
    t.boolean  "is_active",                                                           default: true,  null: false
    t.string   "terms",                        limit: 31
    t.date     "due_date"
    t.string   "sales_rep",                    limit: 5
    t.decimal  "subtotal",                                   precision: 20, scale: 5, default: "0.0", null: false
    t.string   "item_sales_tax",               limit: 31
    t.float    "sales_tax_percentage",         limit: 24
    t.decimal  "sales_tax_total",                            precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "total_amount",                               precision: 20, scale: 5, default: "0.0", null: false
    t.string   "memo",                         limit: 4095
    t.string   "customer_msg",                 limit: 101
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code",      limit: 3
    t.index ["customer"], name: "customer_full_name", using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "invoice_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "txn_line_id", default: "", null: false
    t.integer  "invoice_id"
    t.string  "item"
    t.text    "desc",                    limit: 65535
    t.decimal "quantity",                              precision: 20, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set"
    t.decimal "rate",                                  precision: 20, scale: 5
    t.float   "rate_percent",            limit: 24
    t.decimal "amount",                                precision: 20, scale: 5, default: "0.0", null: false
    t.string  "inventory_site"
    t.date    "service_date"
    t.string  "sales_tax_code"
    t.index ["invoice_id"], name: "invoice_id", using: :btree
    t.index ["txn_line_id"], name: "index_invoice_lines_on_txn_line_id", unique: true, using: :btree
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                                           null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.integer  "txn_number"
    t.string   "customer",             limit: 209
    t.integer   "sales_order_id"
    t.string   "ar_account",                limit: 159
    t.string   "template",                  limit: 31
    t.date     "txn_date"
    t.string   "ref_number",                limit: 11
    t.string   "bill_addr1",                limit: 41
    t.string   "bill_addr2",                limit: 41
    t.string   "bill_addr3",                limit: 41
    t.string   "bill_addr4",                limit: 41
    t.string   "bill_city",                 limit: 31
    t.string   "bill_state",                limit: 21
    t.string   "bill_postal_code",          limit: 13
    t.string   "bill_country",              limit: 31
    t.string   "bill_note",                 limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
    t.string   "ship_city",                 limit: 31
    t.string   "ship_state",                limit: 21
    t.string   "ship_postal_code",          limit: 13
    t.string   "ship_country",              limit: 31
    t.string   "ship_note",                 limit: 41
    t.string   "po_number",                 limit: 25
    t.string   "terms",                     limit: 31
    t.date     "due_date"
    t.string   "sales_rep",                 limit: 5
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
    t.index ["customer"], name: "customer_full_name", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["sales_order_id"], name: "sales_order_id", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "invoices_receive_payments", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "invoice_id",         null: false
    t.integer "receive_payment_id", null: false
    t.index ["receive_payment_id", "invoice_id"], name: "invoice_payment", unique: true, using: :btree
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "list_id",                                                          default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.string   "name",                      limit: 41
    t.string   "full_name",                 limit: 209
    t.boolean  "is_active",                                                        default: true,  null: false
    t.string   "parent_list_id"
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
    t.string   "bill_city",                 limit: 31
    t.string   "bill_state",                limit: 21
    t.string   "bill_postal_code",          limit: 13
    t.string   "bill_country",              limit: 31
    t.string   "bill_note",                 limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
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
    t.index ["full_name"], name: "full_name", unique: true, using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
    t.index ["parent_list_id"], name: "parent_list_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "list_id"
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                 limit: 16
    t.string   "name",                          limit: 41
    t.string   "full_name",                     limit: 209
    t.boolean  "is_active",                                                               default: true
    t.string   "parent_list_id"
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
    t.string   "bill_city",                     limit: 31
    t.string   "bill_state",                    limit: 21
    t.string   "bill_postal_code",              limit: 13
    t.string   "bill_country",                  limit: 31
    t.string   "bill_note",                     limit: 41
    t.string   "ship_addr1",                    limit: 41
    t.string   "ship_addr2",                    limit: 41
    t.string   "ship_addr3",                    limit: 41
    t.string   "ship_addr4",                    limit: 41
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
    t.index ["full_name"], name: "full_name", unique: true, using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
    t.index ["list_id"], name: "list_id", unique: true, using: :btree
    t.index ["parent_list_id"], name: "parent_list_id", using: :btree
  end

  create_table "purchase_order_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "txn_line_id", default: "", null: false
    t.integer  "purchase_order_id"
    t.string  "item"
    t.string  "manufacturer_part_number"
    t.text    "desc",                     limit: 65535
    t.decimal "quantity",                               precision: 20, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set"
    t.decimal "rate",                                   precision: 20, scale: 5
    t.decimal "amount",                                 precision: 20, scale: 5, default: "0.0", null: false
    t.string  "customer",            limit: 209
    t.date    "service_date"
    t.decimal "received_quantity",                      precision: 20, scale: 5
    t.decimal "unbilled_quantity",                      precision: 20, scale: 5
    t.boolean "is_billed"
    t.boolean "is_manually_closed"
    t.index ["customer"], name: "customer_full_name", using: :btree
    t.index ["purchase_order_id"], name: "purchase_order_id", using: :btree
    t.index ["txn_line_id"], name: "index_purchase_order_lines_on_txn_line_id", unique: true, using: :btree
  end

  create_table "purchase_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                           default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.integer   "vendor_id"
    t.integer   "sales_order_id"
    t.string   "inventory_site"
    t.string   "ship_to_entity"
    t.string   "template"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "vendor_addr1",              limit: 41
    t.string   "vendor_addr2",              limit: 41
    t.string   "vendor_addr3",              limit: 41
    t.string   "vendor_addr4",              limit: 41
    t.string   "vendor_city",               limit: 31
    t.string   "vendor_state",              limit: 21
    t.string   "vendor_postal_code",        limit: 13
    t.string   "vendor_country",            limit: 31
    t.string   "vendor_note",               limit: 41
    t.string   "ship_addr1",                limit: 41
    t.string   "ship_addr2",                limit: 41
    t.string   "ship_addr3",                limit: 41
    t.string   "ship_addr4",                limit: 41
    t.string   "ship_city",                 limit: 31
    t.string   "ship_state",                limit: 21
    t.string   "ship_postal_code",          limit: 13
    t.string   "ship_country",              limit: 31
    t.string   "ship_note",                 limit: 41
    t.string   "terms"
    t.date     "due_date"
    t.date     "expected_date"
    t.string   "ship_method"
    t.decimal  "total_amount",                            precision: 20, scale: 5, default: "0.0", null: false
    t.boolean  "is_manually_closed"
    t.boolean  "is_fully_received"
    t.text     "memo",                      limit: 65535
    t.string   "vendor_msg"
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
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
    t.string   "customer",      limit: 209
    t.string   "ar_account",         limit: 159
    t.date     "txn_date"
    t.string   "ref_number",         limit: 20
    t.decimal  "total_amount",                     precision: 20, scale: 5, default: "0.0", null: false
    t.string   "payment_method",     limit: 31
    t.string   "memo",               limit: 4095
    t.string   "deposit_to_account", limit: 159
    t.decimal  "unused_payment",                   precision: 20, scale: 5, default: "0.0", null: false
    t.decimal  "unused_credits",                   precision: 20, scale: 5, default: "0.0", null: false
    t.index ["customer"], name: "customer_full_name", using: :btree
    t.index ["ref_number"], name: "ref_number", using: :btree
    t.index ["txn_id"], name: "txn_id", unique: true, using: :btree
  end

  create_table "sales_order_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "txn_line_id", default: "", null: false
    t.integer  "sales_order_id"
    t.string  "item"
    t.text    "desc",                    limit: 65535
    t.decimal "quantity",                              precision: 20, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set"
    t.decimal "rate",                                  precision: 20, scale: 5
    t.float   "rate_percent",            limit: 24
    t.decimal "amount",                                precision: 20, scale: 5
    t.string  "inventory_site"
    t.string  "serial_number"
    t.string  "lot_number"
    t.string  "sales_tax_code"
    t.decimal "invoiced",                              precision: 20, scale: 5
    t.boolean "is_manually_closed"
    t.index ["sales_order_id"], name: "sales_order_id", using: :btree
    t.index ["txn_line_id"], name: "index_sales_order_lines_on_txn_line_id", unique: true, using: :btree
  end

  create_table "sales_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "txn_id",                                                            default: "",    null: false
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer",              limit: 209
    t.integer   "estimate_id"
    t.string   "template"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "bill_addr1",                 limit: 41
    t.string   "bill_addr2",                 limit: 41
    t.string   "bill_addr3",                 limit: 41
    t.string   "bill_addr4",                 limit: 41
    t.string   "bill_city",                  limit: 31
    t.string   "bill_state",                 limit: 21
    t.string   "bill_postal_code",           limit: 13
    t.string   "bill_country",               limit: 31
    t.string   "bill_note",                  limit: 41
    t.string   "ship_addr1",                 limit: 41
    t.string   "ship_addr2",                 limit: 41
    t.string   "ship_addr3",                 limit: 41
    t.string   "ship_addr4",                 limit: 41
    t.string   "ship_city",                  limit: 31
    t.string   "ship_state",                 limit: 21
    t.string   "ship_postal_code",           limit: 13
    t.string   "ship_country",               limit: 31
    t.string   "ship_note",                  limit: 41
    t.string   "po_number"
    t.string   "terms"
    t.date     "due_date"
    t.string   "sales_rep"
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
    t.index ["customer"], name: "customer_full_name", using: :btree
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
    t.string   "vendor_city",                limit: 31
    t.string   "vendor_state",               limit: 21
    t.string   "vendor_postal_code",         limit: 13
    t.string   "vendor_country",             limit: 31
    t.string   "vendor_note",                limit: 41
    t.string   "ship_addr1",                 limit: 41
    t.string   "ship_addr2",                 limit: 41
    t.string   "ship_addr3",                 limit: 41
    t.string   "ship_addr4",                 limit: 41
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

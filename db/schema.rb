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

ActiveRecord::Schema.define(version: 20170315231156) do

  create_table "bill_addresses", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "addressable_type"
    t.string "addr1",            limit: 41
    t.string "addr2",            limit: 41
    t.string "addr3",            limit: 41
    t.string "addr4",            limit: 41
    t.string "addr5",            limit: 41
    t.string "city",             limit: 31
    t.string "state",            limit: 21
    t.string "postal_code",      limit: 13
    t.string "country",          limit: 31
    t.string "note",             limit: 41
    t.index ["id", "addressable_type"], name: "id", unique: true, using: :btree
  end

  create_table "contacts", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "contact_type"
    t.string "salutation",      limit: 15
    t.string "first_name",      limit: 25
    t.string "middle_name",     limit: 25
    t.string "last_name",       limit: 25
    t.string "job_title",       limit: 41
    t.string "phone",           limit: 21
    t.string "alt_phone",       limit: 21
    t.string "fax",             limit: 21
    t.string "email",           limit: 1023
    t.string "cc",              limit: 1023
    t.string "contact",         limit: 41
    t.string "alt_contact",     limit: 41
    t.string "primary_contact"
    t.string "primary_email"
    t.string "primary_phone"
    t.index ["id", "contact_type"], name: "id", unique: true, using: :btree
  end

  create_table "customers", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.string   "name",                   limit: 41
    t.string   "full_name",              limit: 209
    t.boolean  "is_active",                                                   default: true, null: false
    t.string   "parent_id",              limit: 41
    t.integer  "sublevel",                                                    default: 0,    null: false
    t.string   "company_name",              limit: 41
    t.string   "customer_type",             limit: 159
    t.string   "terms",                     limit: 31
    t.string   "sales_rep",                 limit: 5
    t.decimal  "balance",                         precision: 20, scale: 5
    t.decimal  "total_balance",                         precision: 20, scale: 5
    t.string   "sales_tax_code",            limit: 3
    t.string   "item_sales_tax",            limit: 31
    t.string   "account_number",            limit: 99
    t.string   "job_status",                         limit: 41
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                           limit: 99
    t.string   "job_type",                        limit: 159
    t.string   "preferred_delivery_method", limit: 41
    t.index ["full_name"], name: "index_customers_on_full_name", unique: true, using: :btree
    t.index ["is_active"], name: "index_customers_on_is_active", using: :btree
    t.index ["parent_id"], name: "parent_id", using: :btree
    t.index ["sublevel"], name: "sublevel", using: :btree
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
    t.decimal "amount",                               precision: 20, scale: 5
    t.string  "inventory_site",          limit: 31
    t.string  "inventory_site_location", limit: 31
    t.string  "sales_tax_code",          limit: 3
    t.decimal "markup_rate",                          precision: 20, scale: 5
    t.float   "markup_rate_percent",     limit: 24
    t.index ["estimate_id"], name: "estimate_id", using: :btree
  end

  create_table "estimates", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",           limit: 16
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "template",                limit: 159
    t.date     "txn_date"
    t.string   "ref_number",              limit: 11
    t.boolean  "is_active",                                                     default: true, null: false
    t.string   "po_number",               limit: 25
    t.string   "terms",                   limit: 31
    t.date     "due_date"
    t.string   "sales_rep",               limit: 5
    t.string   "fob",                     limit: 13
    t.decimal  "subtotal",                             precision: 20, scale: 5
    t.string   "item_sales_tax",          limit: 31
    t.float    "sales_tax_percentage",    limit: 24
    t.decimal  "sales_tax_total",                      precision: 20, scale: 5
    t.decimal  "total_amount",                         precision: 20, scale: 5
    t.string   "memo",                    limit: 4095
    t.string   "customer_msg",            limit: 101
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code", limit: 3
    t.index ["customer_id"], name: "customer_id", using: :btree
    t.index ["is_active"], name: "is_active", using: :btree
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
    t.decimal "amount",                                precision: 20, scale: 5
    t.string  "inventory_site"
    t.string  "inventory_site_location"
    t.string  "serial_number"
    t.string  "lot_number"
    t.date    "service_date"
    t.string  "sales_tax_code"
    t.index ["invoice_id"], name: "invoice_id", using: :btree
  end

  create_table "invoices", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",             limit: 16
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "ar_account",                limit: 159
    t.string   "template",                  limit: 31
    t.date     "txn_date"
    t.string   "ref_number",                limit: 11
    t.boolean  "is_pending"
    t.boolean  "is_finance_charge"
    t.string   "po_number",                 limit: 25
    t.string   "terms",                     limit: 31
    t.date     "due_date"
    t.string   "sales_rep",                 limit: 5
    t.string   "fob",                       limit: 13
    t.date     "ship_date"
    t.string   "ship_method",               limit: 15
    t.decimal  "subtotal",                               precision: 20, scale: 5
    t.string   "item_sales_tax",            limit: 31
    t.float    "sales_tax_percentage",      limit: 24
    t.decimal  "sales_tax_total",                        precision: 20, scale: 5
    t.decimal  "applied_amount",                         precision: 20, scale: 5
    t.decimal  "balance_remaining",                      precision: 20, scale: 5
    t.string   "memo",                      limit: 4095
    t.boolean  "is_paid"
    t.string   "customer_msg",              limit: 101
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code",   limit: 3
    t.decimal  "suggested_discount_amount",              precision: 20, scale: 5
    t.date     "suggested_discount_date"
    t.index ["customer_id"], name: "customer_id", using: :btree
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
    t.decimal "amount",                                 precision: 20, scale: 5
    t.string  "inventory_site_location"
    t.string  "customer_id"
    t.date    "service_date"
    t.decimal "received_quantity",                      precision: 20, scale: 5
    t.decimal "unbilled_quantity",                      precision: 20, scale: 5
    t.boolean "is_billed"
    t.boolean "is_manually_closed"
    t.index ["customer_id"], name: "customer_id", using: :btree
    t.index ["purchase_order_id"], name: "purchase_order_id", using: :btree
  end

  create_table "purchase_orders", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "vendor"
    t.string   "inventory_site"
    t.string   "ship_to_entity"
    t.string   "template"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "terms"
    t.date     "due_date"
    t.date     "expected_date"
    t.string   "ship_method"
    t.string   "fob"
    t.decimal  "total_amount",                     precision: 20, scale: 5
    t.boolean  "is_manually_closed"
    t.boolean  "is_fully_received"
    t.text     "memo",               limit: 65535
    t.string   "vendor_msg"
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
  end

  create_table "qbwc_errors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "worker_class",                null: false
    t.string   "model_id"
    t.text     "error_message", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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

  create_table "sales_orders", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "template"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "po_number"
    t.string   "terms"
    t.date     "due_date"
    t.string   "sales_rep"
    t.string   "fob"
    t.date     "ship_date"
    t.string   "ship_method"
    t.decimal  "subtotal",                              precision: 20, scale: 5
    t.string   "item_sales_tax"
    t.float    "sales_tax_percentage",    limit: 24
    t.decimal  "sales_tax_total",                       precision: 20, scale: 5
    t.decimal  "total_amount",                          precision: 20, scale: 5
    t.boolean  "is_manually_closed"
    t.boolean  "is_fully_invoiced"
    t.text     "memo",                    limit: 65535
    t.string   "customer_msg"
    t.boolean  "is_to_be_printed"
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code"
    t.index ["customer_id"], name: "customer_id", using: :btree
  end

  create_table "ship_addresses", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "addressable_type"
    t.string "addr1",            limit: 41
    t.string "addr2",            limit: 41
    t.string "addr3",            limit: 41
    t.string "addr4",            limit: 41
    t.string "addr5",            limit: 41
    t.string "city",             limit: 31
    t.string "state",            limit: 21
    t.string "postal_code",      limit: 13
    t.string "country",          limit: 31
    t.string "note",             limit: 41
    t.index ["id", "addressable_type"], name: "id", unique: true, using: :btree
  end

  create_table "vendor_addresses", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "addressable_type"
    t.string "addr1",            limit: 41
    t.string "addr2",            limit: 41
    t.string "addr3",            limit: 41
    t.string "addr4",            limit: 41
    t.string "addr5",            limit: 41
    t.string "city",             limit: 31
    t.string "state",            limit: 21
    t.string "postal_code",      limit: 13
    t.string "country",          limit: 31
    t.string "note",             limit: 41
    t.index ["id", "addressable_type"], name: "id", unique: true, using: :btree
  end

end

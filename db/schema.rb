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

ActiveRecord::Schema.define(version: 20170127084237) do

  create_table "clients", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id"
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                      limit: 16
    t.string   "name",                               limit: 50
    t.string   "full_name"
    t.string   "is_active",                          limit: 11
    t.string   "parent_id",                          limit: 40
    t.string   "sublevel",                           limit: 40
    t.string   "company_name",                       limit: 40
    t.string   "salutation",                         limit: 40
    t.string   "first_name",                         limit: 40
    t.string   "middle_name",                        limit: 40
    t.string   "last_name",                          limit: 40
    t.string   "job_title",                          limit: 40
    t.string   "bill_address_addr1",                 limit: 40
    t.string   "bill_address_addr2",                 limit: 40
    t.string   "bill_address_addr3",                 limit: 50
    t.string   "bill_address_addr4",                 limit: 50
    t.string   "bill_address_addr5",                 limit: 50
    t.string   "bill_address_city",                  limit: 40
    t.string   "bill_address_state",                 limit: 25
    t.string   "bill_address_postal_code",           limit: 16
    t.string   "bill_address_country",               limit: 40
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3",           limit: 50
    t.string   "bill_address_block_addr4",           limit: 50
    t.string   "bill_address_block_addr5",           limit: 50
    t.string   "ship_address_addr1",                 limit: 40
    t.string   "ship_address_addr2",                 limit: 40
    t.string   "ship_address_addr3",                 limit: 50
    t.string   "ship_address_addr4",                 limit: 50
    t.string   "ship_address_addr5",                 limit: 50
    t.string   "ship_address_city",                  limit: 40
    t.string   "ship_address_state",                 limit: 25
    t.string   "ship_address_postal_code",           limit: 16
    t.string   "ship_address_country",               limit: 40
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1",           limit: 40
    t.string   "ship_address_block_addr2",           limit: 40
    t.string   "ship_address_block_addr3",           limit: 50
    t.string   "ship_address_block_addr4",           limit: 50
    t.string   "ship_address_block_addr5",           limit: 50
    t.string   "phone",                              limit: 40
    t.string   "alt_phone",                          limit: 40
    t.string   "fax",                                limit: 40
    t.string   "email",                              limit: 40
    t.string   "cc",                                 limit: 40
    t.string   "contact",                            limit: 40
    t.string   "alt_contact",                        limit: 40
    t.string   "customer_type_id",                   limit: 40
    t.string   "customer_type_full_name",            limit: 40
    t.string   "terms_id",                           limit: 40
    t.string   "terms_full_name"
    t.string   "sales_rep_id",                       limit: 40
    t.string   "sales_rep_full_name"
    t.decimal  "balance",                                       precision: 10, scale: 5
    t.decimal  "total_balance",                                 precision: 10, scale: 5
    t.string   "sales_tax_code_id",                  limit: 40
    t.string   "sales_tax_code_full_name"
    t.string   "item_sales_tax_id",                  limit: 40
    t.string   "item_sales_tax_full_name"
    t.string   "resale_number",                      limit: 40
    t.string   "account_number",                     limit: 40
    t.string   "preferred_payment_method_id",        limit: 40
    t.string   "preferred_payment_method_full_name", limit: 40
    t.string   "job_status",                         limit: 40
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                           limit: 40
    t.string   "job_type_id",                        limit: 40
    t.string   "job_type_full_name"
    t.string   "preferred_delivery_method",          limit: 40
    t.string   "price_level_id",                     limit: 40
    t.string   "price_level_full_name"
    t.string   "primary_contact"
    t.string   "primary_email"
    t.string   "primary_phone"
    t.integer  "Customers_PKEY"
  end

  create_table "contacts", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "contact"
    t.string   "salutation"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "additional_contact_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "customers", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                      limit: 16
    t.string   "name",                               limit: 50
    t.string   "full_name"
    t.string   "is_active",                          limit: 11
    t.string   "parent_id",                          limit: 40
    t.string   "sublevel",                           limit: 40
    t.string   "company_name",                       limit: 40
    t.string   "salutation",                         limit: 40
    t.string   "first_name",                         limit: 40
    t.string   "middle_name",                        limit: 40
    t.string   "last_name",                          limit: 40
    t.string   "job_title",                          limit: 40
    t.string   "bill_address_addr1",                 limit: 40
    t.string   "bill_address_addr2",                 limit: 40
    t.string   "bill_address_addr3",                 limit: 50
    t.string   "bill_address_addr4",                 limit: 50
    t.string   "bill_address_addr5",                 limit: 50
    t.string   "bill_address_city",                  limit: 40
    t.string   "bill_address_state",                 limit: 25
    t.string   "bill_address_postal_code",           limit: 16
    t.string   "bill_address_country",               limit: 40
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3",           limit: 50
    t.string   "bill_address_block_addr4",           limit: 50
    t.string   "bill_address_block_addr5",           limit: 50
    t.string   "ship_address_addr1",                 limit: 40
    t.string   "ship_address_addr2",                 limit: 40
    t.string   "ship_address_addr3",                 limit: 50
    t.string   "ship_address_addr4",                 limit: 50
    t.string   "ship_address_addr5",                 limit: 50
    t.string   "ship_address_city",                  limit: 40
    t.string   "ship_address_state",                 limit: 25
    t.string   "ship_address_postal_code",           limit: 16
    t.string   "ship_address_country",               limit: 40
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1",           limit: 40
    t.string   "ship_address_block_addr2",           limit: 40
    t.string   "ship_address_block_addr3",           limit: 50
    t.string   "ship_address_block_addr4",           limit: 50
    t.string   "ship_address_block_addr5",           limit: 50
    t.string   "phone",                              limit: 40
    t.string   "alt_phone",                          limit: 40
    t.string   "fax",                                limit: 40
    t.string   "email",                              limit: 40
    t.string   "cc",                                 limit: 40
    t.string   "contact",                            limit: 40
    t.string   "alt_contact",                        limit: 40
    t.string   "customer_type_id",                   limit: 40
    t.string   "customer_type_full_name",            limit: 40
    t.string   "terms_id",                           limit: 40
    t.string   "terms_full_name"
    t.string   "sales_rep_id",                       limit: 40
    t.string   "sales_rep_full_name"
    t.decimal  "balance",                                       precision: 10, scale: 5
    t.decimal  "total_balance",                                 precision: 10, scale: 5
    t.string   "sales_tax_code_id",                  limit: 40
    t.string   "sales_tax_code_full_name"
    t.string   "item_sales_tax_id",                  limit: 40
    t.string   "item_sales_tax_full_name"
    t.string   "resale_number",                      limit: 40
    t.string   "account_number",                     limit: 40
    t.string   "preferred_payment_method_id",        limit: 40
    t.string   "preferred_payment_method_full_name", limit: 40
    t.string   "job_status",                         limit: 40
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                           limit: 40
    t.string   "job_type_id",                        limit: 40
    t.string   "job_type_full_name"
    t.string   "preferred_delivery_method",          limit: 40
    t.string   "price_level_id",                     limit: 40
    t.string   "price_level_full_name"
    t.string   "primary_contact"
    t.string   "primary_email"
    t.string   "primary_phone"
  end


  create_table "estimate_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "estimate_id"
    t.string  "item_id"
    t.string  "item_full_name"
    t.text    "desc",                              limit: 65535
    t.decimal "quantity",                                        precision: 10, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set_id"
    t.string  "override_uom_set_full_name"
    t.decimal "rate",                                            precision: 15, scale: 2
    t.float   "rate_percent",                      limit: 24
    t.decimal "amount",                                          precision: 15, scale: 2
    t.string  "inventory_site_id"
    t.string  "inventory_site_full_name"
    t.string  "inventory_site_location_id"
    t.string  "inventory_site_location_full_name"
    t.string  "sales_tax_code_id"
    t.string  "sales_tax_code_full_name"
    t.decimal "markup_rate",                                     precision: 15, scale: 2
    t.float   "markup_rate_percent",               limit: 24
  end

  create_table "estimates", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_full_name"
    t.string   "template_id"
    t.string   "template_full_name"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "bill_address_addr1"
    t.string   "bill_address_addr2"
    t.string   "bill_address_addr3"
    t.string   "bill_address_addr4"
    t.string   "bill_address_addr5"
    t.string   "bill_address_city"
    t.string   "bill_address_state"
    t.string   "bill_address_postal_code"
    t.string   "bill_address_country"
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3"
    t.string   "bill_address_block_addr4"
    t.string   "bill_address_block_addr5"
    t.string   "ship_address_addr1"
    t.string   "ship_address_addr2"
    t.string   "ship_address_addr3"
    t.string   "ship_address_addr4"
    t.string   "ship_address_addr5"
    t.string   "ship_address_city"
    t.string   "ship_address_state"
    t.string   "ship_address_postal_code"
    t.string   "ship_address_country"
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1"
    t.string   "ship_address_block_addr2"
    t.string   "ship_address_block_addr3"
    t.string   "ship_address_block_addr4"
    t.string   "ship_address_block_addr5"
    t.string   "is_active"
    t.string   "po_number"
    t.string   "terms_id"
    t.string   "terms_full_name"
    t.date     "due_date"
    t.string   "sales_rep_id"
    t.string   "sales_rep_full_name"
    t.string   "fob"
    t.decimal  "subtotal",                                        precision: 15, scale: 2
    t.string   "item_sales_tax_id"
    t.string   "item_sales_tax_full_name"
    t.float    "sales_tax_percentage",              limit: 24
    t.decimal  "sales_tax_total",                                 precision: 15, scale: 2
    t.decimal  "total_amount",                                    precision: 15, scale: 2
    t.text     "memo",                              limit: 65535
    t.string   "customer_msg_id"
    t.string   "customer_msg_full_name"
    t.string   "is_to_be_emailed"
    t.string   "customer_sales_tax_code_id"
    t.string   "customer_sales_tax_code_full_name"
    t.string   "linked_txn_id"
    t.string   "linked_txn_type"
    t.date     "linked_txn_date"
    t.string   "linked_txn_ref_number"
    t.string   "linked_txn_link_type"
    t.decimal  "linked_txn_amount",                               precision: 15, scale: 2
  end

  create_table "invoice_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "invoice_id"
    t.string  "item_id"
    t.string  "item_full_name"
    t.text    "desc",                              limit: 65535
    t.decimal "quantity",                                        precision: 10, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set_id"
    t.string  "override_uom_set_full_name"
    t.decimal "rate",                                            precision: 15, scale: 2
    t.float   "rate_percent",                      limit: 24
    t.decimal "amount",                                          precision: 15, scale: 2
    t.string  "inventory_site_id"
    t.string  "inventory_site_full_name"
    t.string  "inventory_site_location_id"
    t.string  "inventory_site_location_full_name"
    t.string  "serial_number"
    t.string  "lot_number"
    t.date    "service_date"
    t.string  "sales_tax_code_id"
    t.string  "sales_tax_code_full_name"
  end

  create_table "invoices", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_full_name"
    t.string   "ar_account_id"
    t.string   "ar_account_full_name"
    t.string   "template_id"
    t.string   "template_full_name"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "bill_address_addr1"
    t.string   "bill_address_addr2"
    t.string   "bill_address_addr3"
    t.string   "bill_address_addr4"
    t.string   "bill_address_addr5"
    t.string   "bill_address_city"
    t.string   "bill_address_state"
    t.string   "bill_address_postal_code"
    t.string   "bill_address_country"
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3"
    t.string   "bill_address_block_addr4"
    t.string   "bill_address_block_addr5"
    t.string   "ship_address_addr1"
    t.string   "ship_address_addr2"
    t.string   "ship_address_addr3"
    t.string   "ship_address_addr4"
    t.string   "ship_address_addr5"
    t.string   "ship_address_city"
    t.string   "ship_address_state"
    t.string   "ship_address_postal_code"
    t.string   "ship_address_country"
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1"
    t.string   "ship_address_block_addr2"
    t.string   "ship_address_block_addr3"
    t.string   "ship_address_block_addr4"
    t.string   "ship_address_block_addr5"
    t.string   "is_pending"
    t.string   "is_finance_charge"
    t.string   "po_number"
    t.string   "terms_id"
    t.string   "terms_full_name"
    t.date     "due_date"
    t.string   "sales_rep_id"
    t.string   "sales_rep_full_name"
    t.string   "fob"
    t.date     "ship_date"
    t.string   "ship_method_id"
    t.string   "ship_method_full_name"
    t.decimal  "subtotal",                                        precision: 15, scale: 2
    t.string   "item_sales_tax_id"
    t.string   "item_sales_tax_full_name"
    t.float    "sales_tax_percentage",              limit: 24
    t.decimal  "sales_tax_total",                                 precision: 15, scale: 2
    t.decimal  "applied_amount",                                  precision: 15, scale: 2
    t.decimal  "balance_remaining",                               precision: 15, scale: 2
    t.text     "memo",                              limit: 65535
    t.string   "is_paid"
    t.string   "customer_msg_id"
    t.string   "customer_msg_full_name"
    t.string   "is_to_be_printed"
    t.string   "is_to_be_emailed"
    t.string   "customer_sales_tax_code_id"
    t.string   "customer_sales_tax_code_full_name"
    t.decimal  "suggested_discount_amount",                       precision: 15, scale: 2
    t.date     "suggested_discount_date"
    t.string   "linked_txn_id"
    t.string   "linked_txn_type"
    t.date     "linked_txn_date"
    t.string   "linked_txn_ref_number"
    t.string   "linked_txn_link_type"
    t.decimal  "linked_txn_amount",                               precision: 15, scale: 2
  end

  create_table "jobs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                                 limit: 40
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                      limit: 16
    t.string   "name",                               limit: 50
    t.string   "full_name"
    t.string   "is_active",                          limit: 11
    t.string   "parent_id",                          limit: 40
    t.string   "sublevel",                           limit: 40
    t.string   "company_name",                       limit: 40
    t.string   "salutation",                         limit: 40
    t.string   "first_name",                         limit: 40
    t.string   "middle_name",                        limit: 40
    t.string   "last_name",                          limit: 40
    t.string   "job_title",                          limit: 40
    t.string   "bill_address_addr1",                 limit: 40
    t.string   "bill_address_addr2",                 limit: 40
    t.string   "bill_address_addr3",                 limit: 50
    t.string   "bill_address_addr4",                 limit: 50
    t.string   "bill_address_addr5",                 limit: 50
    t.string   "bill_address_city",                  limit: 40
    t.string   "bill_address_state",                 limit: 25
    t.string   "bill_address_postal_code",           limit: 16
    t.string   "bill_address_country",               limit: 40
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3",           limit: 50
    t.string   "bill_address_block_addr4",           limit: 50
    t.string   "bill_address_block_addr5",           limit: 50
    t.string   "ship_address_addr1",                 limit: 40
    t.string   "ship_address_addr2",                 limit: 40
    t.string   "ship_address_addr3",                 limit: 50
    t.string   "ship_address_addr4",                 limit: 50
    t.string   "ship_address_addr5",                 limit: 50
    t.string   "ship_address_city",                  limit: 40
    t.string   "ship_address_state",                 limit: 25
    t.string   "ship_address_postal_code",           limit: 16
    t.string   "ship_address_country",               limit: 40
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1",           limit: 40
    t.string   "ship_address_block_addr2",           limit: 40
    t.string   "ship_address_block_addr3",           limit: 50
    t.string   "ship_address_block_addr4",           limit: 50
    t.string   "ship_address_block_addr5",           limit: 50
    t.string   "phone",                              limit: 40
    t.string   "alt_phone",                          limit: 40
    t.string   "fax",                                limit: 40
    t.string   "email",                              limit: 40
    t.string   "cc",                                 limit: 40
    t.string   "contact",                            limit: 40
    t.string   "alt_contact",                        limit: 40
    t.string   "customer_type_id",                   limit: 40
    t.string   "customer_type_full_name",            limit: 40
    t.string   "terms_id",                           limit: 40
    t.string   "terms_full_name"
    t.string   "sales_rep_id",                       limit: 40
    t.string   "sales_rep_full_name"
    t.decimal  "balance",                                          precision: 10, scale: 5
    t.decimal  "total_balance",                                    precision: 10, scale: 5
    t.string   "sales_tax_code_id",                  limit: 40
    t.string   "sales_tax_code_full_name"
    t.string   "item_sales_tax_id",                  limit: 40
    t.string   "item_sales_tax_full_name"
    t.string   "resale_number",                      limit: 40
    t.string   "account_number",                     limit: 40
    t.string   "preferred_payment_method_id",        limit: 40
    t.string   "preferred_payment_method_full_name", limit: 40
    t.string   "job_status",                         limit: 40
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                           limit: 40
    t.string   "job_type_id",                        limit: 40
    t.string   "job_type_full_name"
    t.string   "preferred_delivery_method",          limit: 40
    t.string   "price_level_id",                     limit: 40
    t.string   "price_level_full_name"
    t.string   "primary_contact"
    t.string   "primary_email"
    t.string   "primary_phone"
    t.integer  "Jobs_PKEY"
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                       limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",               limit: 65535
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_JobID_Parent"
    t.text     "Job_CustCLNo",                       limit: 65535
    t.text     "Job_CustPONo",                       limit: 65535
    t.date     "Job_DateEndActual"
    t.date     "Job_DateEndProjected"
    t.date     "Job_DateStartActual"
    t.date     "Job_DateStartProjected"
    t.text     "Job_Description_Long",               limit: 65535
    t.text     "Job_Description_Short",              limit: 65535
    t.text     "Job_HourType",                       limit: 65535
  end

  create_table "projects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "id",                                 limit: 40
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence",                      limit: 16
    t.string   "name",                               limit: 50
    t.string   "full_name"
    t.string   "is_active",                          limit: 11
    t.string   "parent_id",                          limit: 40
    t.string   "sublevel",                           limit: 40
    t.string   "company_name",                       limit: 40
    t.string   "salutation",                         limit: 40
    t.string   "first_name",                         limit: 40
    t.string   "middle_name",                        limit: 40
    t.string   "last_name",                          limit: 40
    t.string   "job_title",                          limit: 40
    t.string   "bill_address_addr1",                 limit: 40
    t.string   "bill_address_addr2",                 limit: 40
    t.string   "bill_address_addr3",                 limit: 50
    t.string   "bill_address_addr4",                 limit: 50
    t.string   "bill_address_addr5",                 limit: 50
    t.string   "bill_address_city",                  limit: 40
    t.string   "bill_address_state",                 limit: 25
    t.string   "bill_address_postal_code",           limit: 16
    t.string   "bill_address_country",               limit: 40
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3",           limit: 50
    t.string   "bill_address_block_addr4",           limit: 50
    t.string   "bill_address_block_addr5",           limit: 50
    t.string   "ship_address_addr1",                 limit: 40
    t.string   "ship_address_addr2",                 limit: 40
    t.string   "ship_address_addr3",                 limit: 50
    t.string   "ship_address_addr4",                 limit: 50
    t.string   "ship_address_addr5",                 limit: 50
    t.string   "ship_address_city",                  limit: 40
    t.string   "ship_address_state",                 limit: 25
    t.string   "ship_address_postal_code",           limit: 16
    t.string   "ship_address_country",               limit: 40
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1",           limit: 40
    t.string   "ship_address_block_addr2",           limit: 40
    t.string   "ship_address_block_addr3",           limit: 50
    t.string   "ship_address_block_addr4",           limit: 50
    t.string   "ship_address_block_addr5",           limit: 50
    t.string   "phone",                              limit: 40
    t.string   "alt_phone",                          limit: 40
    t.string   "fax",                                limit: 40
    t.string   "email",                              limit: 40
    t.string   "cc",                                 limit: 40
    t.string   "contact",                            limit: 40
    t.string   "alt_contact",                        limit: 40
    t.string   "customer_type_id",                   limit: 40
    t.string   "customer_type_full_name",            limit: 40
    t.string   "terms_id",                           limit: 40
    t.string   "terms_full_name"
    t.string   "sales_rep_id",                       limit: 40
    t.string   "sales_rep_full_name"
    t.decimal  "balance",                                             precision: 10, scale: 5
    t.decimal  "total_balance",                                       precision: 10, scale: 5
    t.string   "sales_tax_code_id",                  limit: 40
    t.string   "sales_tax_code_full_name"
    t.string   "item_sales_tax_id",                  limit: 40
    t.string   "item_sales_tax_full_name"
    t.string   "resale_number",                      limit: 40
    t.string   "account_number",                     limit: 40
    t.string   "preferred_payment_method_id",        limit: 40
    t.string   "preferred_payment_method_full_name", limit: 40
    t.string   "job_status",                         limit: 40
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc",                           limit: 40
    t.string   "job_type_id",                        limit: 40
    t.string   "job_type_full_name"
    t.string   "preferred_delivery_method",          limit: 40
    t.string   "price_level_id",                     limit: 40
    t.string   "price_level_full_name"
    t.string   "primary_contact"
    t.string   "primary_email"
    t.string   "primary_phone"
    t.integer  "Project_PKEY"
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                       limit: 16777215
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",               limit: 16777215
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_ProgMan_Employees_PKEY"
    t.integer  "FK_ProjMan_Employees_PKEY"
    t.integer  "FK_TechLead_Employees_PKEY"
    t.integer  "FK_Foreman_Employees_PKEY"
    t.integer  "FK_TechForeman_Employees_PKEY"
    t.text     "Project_Name",                       limit: 65535
    t.text     "Project_Type",                       limit: 65535
    t.date     "Project_DateStartEstimated"
    t.date     "Project_DateEndEstimated"
    t.date     "Project_RoughInStart"
    t.date     "Project_RoughInEnd"
    t.date     "Project_DeviceInstallStart"
    t.date     "Project_DeviceInstallEnd"
    t.date     "Project_CommissioningStart"
    t.date     "Project_CommissioningEnd"
    t.text     "Project_ScopeText",                  limit: 65535
    t.text     "Project_NameSalutation",             limit: 65535
    t.text     "Project_NameFirst",                  limit: 65535
    t.text     "Project_NameMiddle",                 limit: 65535
    t.text     "Project_NameLast",                   limit: 65535
    t.text     "Project_PhoneMain",                  limit: 65535
    t.text     "Project_EmailMain",                  limit: 65535
    t.text     "Project_PhoneAlternate",             limit: 65535
    t.text     "Project_EmailCC",                    limit: 65535
    t.text     "Project_PhoneCell",                  limit: 65535
    t.text     "Project_PhoneFax",                   limit: 65535
    t.text     "Project_Address1",                   limit: 65535
    t.text     "Project_Address2",                   limit: 65535
    t.text     "Project_Address_Parking1",           limit: 65535
    t.text     "Project_Address_Parking2",           limit: 65535
    t.text     "Project_City",                       limit: 65535
    t.text     "Project_State",                      limit: 65535
    t.text     "Project_Zip",                        limit: 65535
    t.text     "Project_Park_1_Address",             limit: 65535
    t.text     "Project_Park_1_Address_City",        limit: 65535
    t.text     "Project_Park_1_Address_State",       limit: 65535
    t.integer  "Project_Park_1_Address_Zip"
    t.text     "Project_Park_2_Address",             limit: 65535
    t.text     "Project_Park_2_Address_City",        limit: 65535
    t.text     "Project_Park_2_Address_State",       limit: 65535
    t.integer  "Project_Park_2_Address_Zip"
    t.integer  "Project_PercentComplete"
    t.text     "Project_IsClosed",                   limit: 65535
    t.integer  "Project_Status",                     limit: 1
    t.integer  "Project_QuotedTechLabor"
    t.integer  "Project_QuotedRILabor"
    t.integer  "Project_QuotedDILabor"
    t.integer  "Project_QuotedCOLabor"
    t.integer  "Project_QuotedEngLabor"
    t.integer  "Project_QuotedPMLabor"
    t.text     "Project_UseCase",                    limit: 65535
    t.integer  "Project_QuotedLgstLabor"
  end

  create_table "purchase_order_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "purchase_order_id"
    t.string  "item_id"
    t.string  "item_full_name"
    t.string  "manufacturer_part_number"
    t.text    "desc",                              limit: 65535
    t.decimal "quantity",                                        precision: 10, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set_id"
    t.string  "override_uom_set_full_name"
    t.decimal "rate",                                            precision: 15, scale: 2
    t.decimal "amount",                                          precision: 15, scale: 2
    t.string  "inventory_site_location_id"
    t.string  "inventory_site_location_full_name"
    t.string  "customer_id"
    t.string  "customer_full_name"
    t.date    "service_date"
    t.decimal "received_quantity",                               precision: 10, scale: 5
    t.decimal "unbilled_quantity",                               precision: 10, scale: 5
    t.string  "is_billed"
    t.string  "is_manually_closed"
  end

  create_table "purchase_orders", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "vendor_id"
    t.string   "vendor_full_name"
    t.string   "inventory_site_id"
    t.string   "inventory_site_full_name"
    t.string   "ship_to_entity_id"
    t.string   "ship_to_entity_full_name"
    t.string   "template_id"
    t.string   "template_full_name"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "vendor_address_addr1"
    t.string   "vendor_address_addr2"
    t.string   "vendor_address_addr3"
    t.string   "vendor_address_addr4"
    t.string   "vendor_address_addr5"
    t.string   "vendor_address_city"
    t.string   "vendor_address_state"
    t.string   "vendor_address_postal_code"
    t.string   "vendor_address_country"
    t.string   "vendor_address_note"
    t.string   "vendor_address_block_addr1"
    t.string   "vendor_address_block_addr2"
    t.string   "vendor_address_block_addr3"
    t.string   "vendor_address_block_addr4"
    t.string   "vendor_address_block_addr5"
    t.string   "ship_address_addr1"
    t.string   "ship_address_addr2"
    t.string   "ship_address_addr3"
    t.string   "ship_address_addr4"
    t.string   "ship_address_addr5"
    t.string   "ship_address_city"
    t.string   "ship_address_state"
    t.string   "ship_address_postal_code"
    t.string   "ship_address_country"
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1"
    t.string   "ship_address_block_addr2"
    t.string   "ship_address_block_addr3"
    t.string   "ship_address_block_addr4"
    t.string   "ship_address_block_addr5"
    t.string   "terms_id"
    t.string   "terms_full_name"
    t.date     "due_date"
    t.date     "expected_date"
    t.string   "ship_method_id"
    t.string   "ship_method_full_name"
    t.string   "fob"
    t.decimal  "total_amount",                             precision: 15, scale: 2
    t.string   "is_manually_closed"
    t.string   "is_fully_received"
    t.text     "memo",                       limit: 65535
    t.string   "vendor_msg"
    t.string   "is_to_be_printed"
    t.string   "is_to_be_emailed"
    t.string   "linked_txn_id"
    t.string   "linked_txn_type"
    t.date     "linked_txn_date"
    t.string   "linked_txn_ref_number"
    t.string   "linked_txn_link_type"
    t.decimal  "linked_txn_amount",                        precision: 15, scale: 2
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
    t.string   "error",        limit: 1000
    t.text     "pending_jobs", limit: 65535,             null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "sales_order_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "sales_order_id"
    t.string  "item_id"
    t.string  "item_full_name"
    t.text    "desc",                              limit: 65535
    t.decimal "quantity",                                        precision: 10, scale: 5
    t.string  "unit_of_measure"
    t.string  "override_uom_set_id"
    t.string  "override_uom_set_full_name"
    t.decimal "rate",                                            precision: 15, scale: 2
    t.float   "rate_percent",                      limit: 24
    t.decimal "amount",                                          precision: 15, scale: 2
    t.string  "inventory_site_id"
    t.string  "inventory_site_full_name"
    t.string  "inventory_site_location_id"
    t.string  "inventory_site_location_full_name"
    t.string  "serial_number"
    t.string  "lot_number"
    t.string  "sales_tax_code_id"
    t.string  "sales_tax_code_full_name"
    t.decimal "invoiced",                                        precision: 10, scale: 5
    t.string  "is_manually_closed"
  end

  create_table "sales_orders", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "customer_full_name"
    t.string   "template_id"
    t.string   "template_full_name"
    t.date     "txn_date"
    t.string   "ref_number"
    t.string   "bill_address_addr1"
    t.string   "bill_address_addr2"
    t.string   "bill_address_addr3"
    t.string   "bill_address_addr4"
    t.string   "bill_address_addr5"
    t.string   "bill_address_city"
    t.string   "bill_address_state"
    t.string   "bill_address_postal_code"
    t.string   "bill_address_country"
    t.string   "bill_address_note"
    t.string   "bill_address_block_addr1"
    t.string   "bill_address_block_addr2"
    t.string   "bill_address_block_addr3"
    t.string   "bill_address_block_addr4"
    t.string   "bill_address_block_addr5"
    t.string   "ship_address_addr1"
    t.string   "ship_address_addr2"
    t.string   "ship_address_addr3"
    t.string   "ship_address_addr4"
    t.string   "ship_address_addr5"
    t.string   "ship_address_city"
    t.string   "ship_address_state"
    t.string   "ship_address_postal_code"
    t.string   "ship_address_country"
    t.string   "ship_address_note"
    t.string   "ship_address_block_addr1"
    t.string   "ship_address_block_addr2"
    t.string   "ship_address_block_addr3"
    t.string   "ship_address_block_addr4"
    t.string   "ship_address_block_addr5"
    t.string   "po_number"
    t.string   "terms_id"
    t.string   "terms_full_name"
    t.date     "due_date"
    t.string   "sales_rep_id"
    t.string   "sales_rep_full_name"
    t.string   "fob"
    t.date     "ship_date"
    t.string   "ship_method_id"
    t.string   "ship_method_full_name"
    t.decimal  "subtotal",                                        precision: 15, scale: 2
    t.string   "item_sales_tax_id"
    t.string   "item_sales_tax_full_name"
    t.float    "sales_tax_percentage",              limit: 24
    t.decimal  "sales_tax_total",                                 precision: 15, scale: 2
    t.decimal  "total_amount",                                    precision: 15, scale: 2
    t.string   "is_manually_closed"
    t.string   "is_fully_invoiced"
    t.text     "memo",                              limit: 65535
    t.string   "customer_msg_id"
    t.string   "customer_msg_full_name"
    t.string   "is_to_be_printed"
    t.string   "is_to_be_emailed"
    t.string   "customer_sales_tax_code_id"
    t.string   "customer_sales_tax_code_full_name"
    t.string   "linked_txn_id"
    t.string   "linked_txn_type"
    t.date     "linked_txn_date"
    t.string   "linked_txn_ref_number"
    t.string   "linked_txn_link_type"
    t.decimal  "linked_txn_amount",                               precision: 15, scale: 2
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end

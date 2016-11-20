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

ActiveRecord::Schema.define(version: 20161120095807) do

  create_table "additional_notes", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "note_id"
    t.date     "date"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classes", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.string   "full_name"
    t.boolean  "is_active"
    t.string   "parent_ref_id"
    t.integer  "sublevel"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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

  create_table "currencies", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.boolean  "is_active",                           default: true, null: false
    t.string   "currency_code"
    t.string   "currency_format"
    t.boolean  "is_user_defined_currency"
    t.float    "exchange_rate",            limit: 24
    t.date     "as_of_date"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "customer_hierarchies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ancestor_id",   null: false
    t.string  "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "customer_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "customer_desc_idx", using: :btree
  end

  create_table "customer_types", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.string   "full_name"
    t.boolean  "is_active",     default: true, null: false
    t.string   "parent_id"
    t.integer  "sublevel"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "customers", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name",                                                                               null: false
    t.string   "full_name"
    t.boolean  "is_active",                                                          default: true,  null: false
    t.string   "class_id"
    t.string   "parent_id"
    t.integer  "sublevel",                                                           default: 0,     null: false
    t.string   "company_name"
    t.string   "salutation"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "job_title"
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
    t.string   "print_as"
    t.string   "phone"
    t.string   "mobile"
    t.string   "pager"
    t.string   "alt_phone"
    t.string   "fax"
    t.string   "email"
    t.string   "cc"
    t.string   "contact"
    t.string   "alt_contact"
    t.string   "additional_contact_id"
    t.string   "contacts_id"
    t.string   "customer_type_id"
    t.string   "terms_id"
    t.string   "sales_rep_id"
    t.decimal  "balance",                                   precision: 15, scale: 2
    t.decimal  "total_balance",                             precision: 15, scale: 2
    t.string   "sales_tax_code_id"
    t.string   "item_sales_tax_id"
    t.string   "sales_tax_country"
    t.string   "resale_number"
    t.string   "account_number"
    t.decimal  "credit_limit",                              precision: 15, scale: 2
    t.string   "preferred_payment_method_id"
    t.string   "credit_card_info"
    t.string   "job_status"
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc"
    t.string   "job_type_id"
    t.text     "notes",                       limit: 65535
    t.string   "additional_notes_id"
    t.boolean  "is_statement_with_parent",                                           default: false, null: false
    t.string   "delivery_method"
    t.string   "preferred_delivery_method"
    t.string   "price_level_id"
    t.string   "external_guid"
    t.string   "tax_registration_number"
    t.string   "currency_id"
    t.string   "data_ext_id"
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
  end

  create_table "data_exts", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "owner_id"
    t.string   "data_ext_name"
    t.string   "data_ext_type"
    t.string   "data_ext_value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "estimate_line_groups", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item_group_id"
    t.string   "desc"
    t.string   "quantity"
    t.string   "unit_of_measure"
    t.string   "override_uom_set_id"
    t.boolean  "is_print_items_in_group"
    t.decimal  "total_amount",            precision: 15, scale: 2
    t.string   "estimate_line_id"
    t.string   "data_ext_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "estimate_lines", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item_id"
    t.string   "desc"
    t.string   "quantity"
    t.string   "unit_of_measure"
    t.string   "override_uom_set_id"
    t.string   "rate"
    t.float    "rate_percent",               limit: 24
    t.string   "class_id"
    t.decimal  "amount",                                precision: 15, scale: 2
    t.decimal  "tax_amount",                            precision: 15, scale: 2
    t.string   "inventory_site_id"
    t.string   "inventory_site_location_id"
    t.string   "sales_tax_code_id"
    t.string   "markup_rate"
    t.float    "markup_rate_percent",        limit: 24
    t.string   "other1"
    t.string   "other2"
    t.string   "data_ext_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "estimates", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.integer  "txn_number"
    t.string   "customer_id"
    t.string   "class_id"
    t.string   "template_id"
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
    t.boolean  "is_active",                                                            default: true,  null: false
    t.string   "po_number"
    t.string   "terms_id"
    t.date     "due_date"
    t.string   "sales_rep_id"
    t.string   "fob"
    t.decimal  "subtotal",                                    precision: 15, scale: 2
    t.string   "item_sales_tax_id"
    t.float    "sales_tax_percentage",          limit: 24
    t.decimal  "sales_tax_total",                             precision: 15, scale: 2
    t.decimal  "total_amount",                                precision: 15, scale: 2
    t.string   "currency_id"
    t.float    "exchange_rate",                 limit: 24
    t.decimal  "total_amount_in_home_currency",               precision: 15, scale: 2
    t.text     "memo",                          limit: 65535
    t.string   "customer_msg_id"
    t.boolean  "is_to_be_emailed",                                                     default: false, null: false
    t.boolean  "is_tax_included",                                                      default: false, null: false
    t.string   "customer_sales_tax_code_id"
    t.string   "other"
    t.string   "external_guid"
    t.string   "linked_txn"
    t.string   "estimate_line_id"
    t.string   "estimate_line_group_id"
    t.string   "data_ext_id"
    t.datetime "created_at",                                                                           null: false
    t.datetime "updated_at",                                                                           null: false
  end

  create_table "inventory_sites", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.boolean  "is_active",                     default: true, null: false
    t.string   "parent_site_id"
    t.boolean  "is_default_site"
    t.string   "site_desc"
    t.string   "contact"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "site_address",    limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "item_sales_taxes", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.string   "bar_code_value"
    t.boolean  "is_active",                           default: true, null: false
    t.string   "class_id"
    t.string   "item_desc"
    t.float    "tax_rate",                 limit: 24
    t.string   "tax_vendor_id"
    t.string   "sales_tax_return_line_id"
    t.string   "external_guid"
    t.string   "data_ext_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "job_types", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.string   "full_name"
    t.boolean  "is_active",     default: true, null: false
    t.string   "parent_id"
    t.integer  "sublevel",      default: 0,    null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "preferred_payment_methods", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_levels", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.boolean  "is_active",                               default: true, null: false
    t.string   "price_level_type"
    t.float    "price_level_fixed_percentage", limit: 24
    t.string   "price_level_per_item_id"
    t.string   "currency_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
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
    t.index ["company"], name: "index_qbwc_jobs_on_company", length: {"company"=>150}, using: :btree
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

  create_table "sales_reps", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "initial"
    t.boolean  "is_active",           default: true, null: false
    t.string   "sales_rep_entity_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "sales_tax_codes", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.boolean  "is_active",            default: true, null: false
    t.boolean  "is_taxable",           default: true, null: false
    t.string   "desc"
    t.string   "item_purchase_tax_id"
    t.string   "item_sales_tax_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "templates", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.boolean  "is_active",     default: true, null: false
    t.string   "template_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "terms", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

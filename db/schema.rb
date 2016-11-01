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

ActiveRecord::Schema.define(version: 20161101210303) do

  create_table "customer_hierarchies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "ancestor_id",   null: false
    t.string  "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "customer_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "customer_desc_idx", using: :btree
  end

  create_table "customers", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time_created"
    t.datetime "time_modified"
    t.string   "edit_sequence"
    t.string   "name"
    t.string   "full_name"
    t.boolean  "is_active",                                                                       default: true, null: false
    t.string   "class_id"
    t.string   "parent_id"
    t.integer  "sublevel",                                                                        default: 0,    null: false
    t.string   "company_name"
    t.string   "salutation"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
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
    t.string   "ship_address_block_addr1"
    t.string   "ship_address_block_addr2"
    t.string   "ship_address_block_addr3"
    t.string   "ship_address_block_addr4"
    t.string   "ship_address_block_addr5"
    t.string   "ship_address_city"
    t.string   "ship_address_state"
    t.string   "ship_address_postal_code"
    t.string   "ship_address_country"
    t.string   "ship_address_note"
    t.string   "ship_to_address_name"
    t.string   "ship_to_address_addr1"
    t.string   "ship_to_address_addr2"
    t.string   "ship_to_address_addr3"
    t.string   "ship_to_address_addr4"
    t.string   "ship_to_address_addr5"
    t.string   "ship_to_address_city"
    t.string   "ship_to_address_state"
    t.string   "ship_to_address_postal_code"
    t.string   "ship_to_address_country"
    t.string   "ship_to_address_note"
    t.boolean  "ship_to_address_default_ship_to"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "fax"
    t.string   "email"
    t.string   "cc"
    t.string   "contact"
    t.string   "alt_contact"
    t.string   "additional_contact_ref_contact_name"
    t.string   "additional_contact_ref_contact_value"
    t.string   "contacts_ret_list_id"
    t.string   "customer_type_id"
    t.string   "terms_id"
    t.string   "sales_rep_id"
    t.decimal  "balance",                                                precision: 15, scale: 2
    t.decimal  "total_balance",                                          precision: 15, scale: 2
    t.string   "sales_tax_code_id"
    t.string   "item_sales_tax_id"
    t.string   "resale_number"
    t.string   "account_number"
    t.decimal  "credit_limit",                                           precision: 15, scale: 2
    t.string   "preferred_payment_method_id"
    t.string   "credit_card_info_credit_card_number"
    t.integer  "credit_card_info_expiration_month"
    t.integer  "credit_card_info_expiration_year"
    t.string   "credit_card_info_name_on_card"
    t.string   "credit_card_info_credit_card_address"
    t.string   "credit_card_info_credit_card_postal_code"
    t.string   "job_status"
    t.date     "job_start_date"
    t.date     "job_projected_end_date"
    t.date     "job_end_date"
    t.string   "job_desc"
    t.string   "job_type_id"
    t.text     "notes",                                    limit: 65535
    t.string   "additional_notes_ret_note_id"
    t.string   "preferred_delivery_method"
    t.string   "price_level_id"
    t.string   "external_guid"
    t.string   "currency_id"
    t.string   "data_ext_ret_owner_id"
    t.datetime "created_at",                                                                                     null: false
    t.datetime "updated_at",                                                                                     null: false
    t.index ["parent_id"], name: "index_customers_on_parent_id", using: :btree
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
    t.boolean  "is_active",                                                            default: true, null: false
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
    t.boolean  "is_to_be_emailed"
    t.string   "customer_sales_tax_code_id"
    t.string   "other"
    t.string   "external_guid"
    t.string   "linked_txn_id"
    t.datetime "created_at",                                                                          null: false
    t.datetime "updated_at",                                                                          null: false
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

end

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

  create_table "Classes_Certs", primary_key: "Classes_Certs_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Vendor_PKEY"
    t.integer "FK_Classes_Certs_List_Tier_PKEY"
    t.text    "Cert_Title",                      limit: 65535
    t.text    "Cert_Description",                limit: 65535
    t.decimal "Cert_Duration",                                 precision: 10, scale: 2
    t.text    "Cert_Type",                       limit: 65535
    t.text    "Cert_URL",                        limit: 65535
    t.integer "FK_Employees_PKEY",                                                      comment: "For more info contact this person"
    t.text    "Cert_Online",                     limit: 65535
    t.text    "Cert_Travel",                     limit: 65535
    t.decimal "Cert_Tier",                                     precision: 11, scale: 1
    t.integer "SortOrder"
    t.index ["FK_Classes_Certs_List_Tier_PKEY"], name: "Classes_Certs_List_Tier_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Vendor_PKEY"], name: "FK_Vendor_PKEY", using: :btree
  end

  create_table "Classes_Certs_Join_Req", primary_key: "Classes_Certs_Join_Req_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "When a class or certification is required for more than one title" do |t|
    t.integer "FK_Classes_Certs_PKEY",                                    null: false
    t.integer "FK_Employees_List_Title_PKEY",                             null: false
    t.integer "Classes_Certs_Join_Req_Duration",                                       comment: "Time to complete course pre/post promotion"
    t.integer "Classes_Certs_Join_Req_Type",                                           comment: "0 = pre-reqquiste, 1 = post-requisite"
    t.decimal "Classes_Certs_Join_Req_Tier",     precision: 11, scale: 1,              comment: "Rating system to show heirarchy between Tech1s, Tech2s and Tech3s"
    t.index ["FK_Classes_Certs_PKEY", "FK_Employees_List_Title_PKEY"], name: "FK_Classes_Certs_PKEY", using: :btree
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
  end

  create_table "Classes_Certs_List_Tier", primary_key: "Classes_Certs_List_Tier_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "Description", limit: 65535
    t.text "Color",       limit: 65535
  end

  create_table "ConstTracker", primary_key: "ConstTracker_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Project_PKEY",             null: false
    t.text    "RoomName",        limit: 255, null: false
    t.boolean "RI_Field1",                   null: false
    t.boolean "RI_Field2",                   null: false
    t.boolean "RI_Field3",                   null: false
    t.boolean "DI_Field1",                   null: false
    t.boolean "DI_Field2",                   null: false
    t.boolean "DI_Field3",                   null: false
    t.integer "DI_Field4",       limit: 1,   null: false
    t.boolean "CM_Field1",                   null: false
    t.boolean "CM_Field2",                   null: false
    t.boolean "CM_Field3",                   null: false
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
  end

  create_table "Customers", primary_key: "Customers_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.text     "Cust_BillTo_Email",         limit: 65535, comment: "A/P Email"
    t.text     "Cust_BillTo_Name",          limit: 65535
    t.text     "Cust_AP_Name",              limit: 65535, comment: "A/P Name"
    t.text     "Cust_BillTo_Phone",         limit: 65535, comment: "A/P Phone"
    t.text     "Cust_BillTo_State",         limit: 65535
    t.integer  "Cust_BillTo_Zip"
    t.text     "Cust_City",                 limit: 65535
    t.text     "Cust_CLNo",                 limit: 65535
    t.text     "Cust_Company",              limit: 65535
    t.text     "Cust_CompanyAbr",           limit: 65535, comment: "Customer Short Name"
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
    t.text     "Cust_PhoneFax",             limit: 65535, comment: "A/P FAX"
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
  end

  create_table "Deliveries", primary_key: "Deliveries_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535
    t.integer  "FK_qSalesOrders_PKEY"
    t.text     "Number",                    limit: 65535,             null: false
    t.date     "Date"
    t.text     "Address",                   limit: 65535
    t.text     "Recipient",                 limit: 65535
    t.integer  "Final",                                   default: 0, null: false
    t.text     "Memo",                      limit: 65535
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
  end

  create_table "DeliveryItems", primary_key: "DeliveryItems_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",        limit: 65535
    t.integer  "FK_Deliveries_PKEY"
    t.integer  "FK_qSalesOrdersTracker_PKEY"
    t.integer  "Quantity"
    t.index ["FK_Deliveries_PKEY"], name: "FK_Deliveries_PKEY", using: :btree
    t.index ["FK_qSalesOrdersTracker_PKEY"], name: "FK_qSalesOrdersTracker_PKEY", using: :btree
  end

  create_table "Departments", primary_key: "Departments_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Name",      limit: 65535, null: false
    t.text    "ShortName", limit: 65535, null: false
    t.integer "SortOrder",               null: false
  end

  create_table "EmployeeSupervisors", primary_key: "EmployeeSupervisors_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Employees_PKEY_Supervisor"
    t.integer "FK_Employees_PKEY_DirectReport"
    t.index ["FK_Employees_PKEY_DirectReport"], name: "FK_Employees_PKEY_DirectReport", using: :btree
    t.index ["FK_Employees_PKEY_Supervisor"], name: "FK_Employees_PKEY_Supervisor", using: :btree
  end

  create_table "Employees", primary_key: "Employees_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                 limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535
    t.integer  "FK_Employees_List_Title_PKEY"
    t.text     "Emp_Address",                  limit: 65535
    t.date     "Emp_Birthday"
    t.text     "Emp_City",                     limit: 65535
    t.text     "Emp_Email",                    limit: 65535
    t.text     "Emp_Login",                    limit: 65535
    t.text     "Emp_NameFirst",                limit: 65535
    t.text     "Emp_NameLast",                 limit: 65535
    t.text     "Emp_NameMiddle",               limit: 65535
    t.text     "Emp_NameSalutation",           limit: 65535
    t.text     "Emp_Password",                 limit: 65535
    t.text     "Emp_PhoneAlt",                 limit: 65535
    t.text     "Emp_PhoneCellular",            limit: 65535
    t.text     "Emp_PhoneHome",                limit: 65535
    t.decimal  "Emp_PTO",                                    precision: 10, scale: 3
    t.decimal  "Emp_PTOAccuralRate",                         precision: 10, scale: 3
    t.text     "Emp_State",                    limit: 65535
    t.text     "Emp_Status",                   limit: 65535
    t.integer  "Emp_Title"
    t.text     "Emp_Type",                     limit: 65535
    t.text     "Emp_Zip",                      limit: 65535
    t.integer  "Emp_BelowLine",                                                       default: 0, null: false
    t.text     "Emp_Emer_1_Name",              limit: 65535
    t.text     "Emp_Emer_1_Rel",               limit: 65535
    t.text     "Emp_Emer_1_Location",          limit: 65535
    t.text     "Emp_Emer_1_Phone_A",           limit: 65535,                                                   comment: "Cell Phone"
    t.text     "Emp_Emer_1_Phone_B",           limit: 65535,                                                   comment: "Home/Work Phone"
    t.text     "Emp_Emer_2_Name",              limit: 65535
    t.text     "Emp_Emer_2_Rel",               limit: 65535
    t.text     "Emp_Emer_2_Location",          limit: 65535
    t.text     "Emp_Emer_2_Phone_A",           limit: 65535,                                                   comment: "Cell Phone"
    t.text     "Emp_Emer_2_Phone_B",           limit: 65535,                                                   comment: "Home/Work Phone"
    t.text     "Emp_Medical_Info",             limit: 65535
    t.integer  "Emp_Crew_Access",              limit: 1,                              default: 0,              comment: "0 = human has access to edit the schedule"
    t.integer  "FK_Supervisor_PKEY"
    t.text     "Emp_Email_Personal",           limit: 65535
    t.text     "Emp_BackCheck",                limit: 65535
    t.date     "Emp_BackCheckDate"
    t.date     "Emp_HireDate"
    t.date     "Emp_TermDate"
    t.integer  "Emp_T_Shirt_Size"
    t.integer  "Emp_Collared_Shirt_Size"
    t.integer  "Emp_Hat_Size"
    t.integer  "Emp_cellStipend"
    t.text     "Emp_cpuStipend",               limit: 65535
    t.date     "Emp_cpuStipendDate"
    t.integer  "Emp_KeySV"
    t.integer  "Emp_KeySF"
    t.integer  "Emp_KeyFobNumber"
    t.text     "Emp_KeyFobGroup",              limit: 65535
    t.index ["Emp_Title"], name: "Emp_Title", using: :btree
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Supervisor_PKEY"], name: "FK_Supervisor_PKEY", using: :btree
  end

  create_table "Employees_Badges", primary_key: "Employees_Badges_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "CreationUser",      limit: 65535,                                      null: false
    t.integer  "FK_Employees_PKEY",                                                    null: false
    t.integer  "FK_Customers_PKEY",                                                    null: false
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Employees_PKEY", "FK_Customers_PKEY"], name: "join", unique: true, using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
  end

  create_table "Employees_Cert", primary_key: "Employees_Cert_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "CreationUser",          limit: 65535,                                      null: false
    t.integer  "FK_Employees_PKEY",                                                        null: false
    t.integer  "FK_Classes_Certs_PKEY",                                                    null: false
    t.date     "Date_Completed"
    t.date     "Date_Expire"
    t.text     "Cert_URL",              limit: 65535
    t.index ["FK_Employees_PKEY", "FK_Classes_Certs_PKEY"], name: "join", unique: true, using: :btree
  end

  create_table "Employees_Cert_Todo", primary_key: "Employees_Cert_Todo_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "CreationUser",          limit: 65535,                                      null: false
    t.integer  "FK_Employees_PKEY",                                                        null: false
    t.integer  "FK_Classes_Certs_PKEY",                                                    null: false
    t.date     "Due_Date"
    t.index ["FK_Employees_PKEY", "FK_Classes_Certs_PKEY"], name: "join", unique: true, using: :btree
  end

  create_table "Employees_List_Size", primary_key: "Employees_List_Size_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description",   limit: 65535
    t.text    "Clothing_Size", limit: 65535
    t.integer "SortOrder",                   null: false
  end

  create_table "Employees_List_Title", primary_key: "Employees_List_Title_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Departments_PKEY"
    t.text    "Description",             limit: 65535, null: false, comment: "Employee Status"
    t.integer "Emp_List_Title_Inactive"
    t.text    "Color",                   limit: 65535
    t.text    "Color_Font",              limit: 65535
    t.integer "SortOrder",                             null: false
    t.index ["FK_Departments_PKEY"], name: "FK_Departments_PKEY", using: :btree
  end

  create_table "Employees_NDAs", primary_key: "Employees_NDAs_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "CreationUser",       limit: 65535,                                      null: false
    t.integer  "FK_Customers_PKEY",                                                     null: false
    t.integer  "FK_Employees_PKEY",                                                     null: false
    t.text     "Employees_NDAs_URL", limit: 65535
    t.index ["FK_Customers_PKEY", "FK_Employees_PKEY"], name: "join", unique: true, using: :btree
  end

  create_table "Holidays", primary_key: "Holidays_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535
    t.text     "Holiday_CompanyName",       limit: 65535
    t.text     "Holiday_CustomerID",        limit: 65535
    t.date     "Holiday_Date"
    t.integer  "Holiday_Hours"
    t.integer  "Holiday_HoursType"
    t.text     "Holiday_JobID",             limit: 65535
    t.text     "Holiday_JobName",           limit: 65535
    t.text     "Holiday_Name",              limit: 65535
  end

  create_table "Jobs", primary_key: "Jobs_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                    limit: 65535
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",            limit: 65535
    t.integer  "FK_JobID_Parent"
    t.integer  "FK_Customers_PKEY"
    t.text     "Job_Company",                     limit: 65535
    t.text     "Job_Company_QBName_Display.calc", limit: 65535
    t.text     "Job_CompanyAbr",                  limit: 65535
    t.text     "Job_Contact",                     limit: 65535
    t.text     "Job_ContactAlt",                  limit: 65535
    t.text     "Job_ContactName",                 limit: 65535
    t.text     "Job_CustCLNo",                    limit: 65535
    t.text     "Job_CustPONo",                    limit: 65535
    t.date     "Job_DateEndActual",                             comment: "Job Actual End Date"
    t.date     "Job_DateEndProjected",                          comment: "Job Projected End Date"
    t.date     "Job_DateStartActual",                           comment: "Job Actual Start Date"
    t.date     "Job_DateStartProjected",                        comment: "Job Projected Start Date"
    t.text     "Job_DefaultJob",                  limit: 65535
    t.text     "Job_Description_Long",            limit: 65535
    t.text     "Job_Description_Short",           limit: 65535
    t.integer  "Job_DisplayIndent"
    t.text     "Job_EmailCC",                     limit: 65535
    t.text     "Job_EmailTo",                     limit: 65535
    t.date     "Job_ExpiryDate"
    t.integer  "Job_HoursAmount_Default"
    t.integer  "Job_HoursAmount_Lock"
    t.integer  "Job_HoursAmount_Max"
    t.text     "Job_HourType",                    limit: 65535
    t.text     "Job_InactiveFlag",                limit: 65535, comment: "Job Is Active"
    t.text     "Job_NameFirst",                   limit: 65535
    t.text     "Job_NameLast",                    limit: 65535
    t.text     "Job_NameMiddle",                  limit: 65535
    t.text     "Job_NameSalutation",              limit: 65535
    t.text     "Job_Notes",                       limit: 65535
    t.text     "Job_Number.calc",                 limit: 65535
    t.text     "Job_PhoneAlt",                    limit: 65535
    t.text     "Job_PhoneFax",                    limit: 65535
    t.text     "Job_PhoneOffice",                 limit: 65535
    t.text     "Job_QB_JobName",                  limit: 65535
    t.text     "Job_QB_JobName_Hierarc.calc",     limit: 65535
    t.text     "Job_Status",                      limit: 65535
    t.text     "Job_Type",                        limit: 65535
    t.text     "Job_PhoneCell",                   limit: 65535
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_JobID_Parent"], name: "FK_JobID_Parent", using: :btree
  end

  create_table "JoinFM", primary_key: "JoinFM_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "FK_TickRel_Tickets_PKEY"
    t.integer  "FK_TickRel_Jobs_PKEY"
    t.integer  "FK_TickRel_Employees_PKEY"
    t.integer  "FK_TickRel_Customers_PKEY"
    t.integer  "FK_JobRel_Jobs_PKEY"
    t.integer  "FK_JobRel_Employees_PKEY"
    t.integer  "FK_JobRel_Customers_PKEY"
    t.integer  "FK_EmpSup_Sup_Employees_PKEY"
    t.integer  "FK_EmpSup_Employees_PKEY"
    t.text     "EmpSup__FK_EmployeeID",        limit: 65535
    t.text     "EmpSup__FK_EmployeeID_Sup",    limit: 65535
    t.text     "Jobs__FK_CustomerID",          limit: 65535
    t.text     "Jobs__FK_EmployeeID",          limit: 65535
    t.text     "Jobs__FK_JobID",               limit: 65535
    t.text     "Jobs__FK_TicketID",            limit: 65535
    t.text     "Ticket__FK_CustomerID",        limit: 65535
    t.text     "Ticket__FK_EmployeeID",        limit: 65535
    t.text     "Ticket__FK_JobID",             limit: 65535
    t.text     "Ticket__FK_TicketID",          limit: 65535
    t.datetime "canIdieNow",                                 default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "List_Salutation", primary_key: "List_Salutation_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, comment: "Salutation"
    t.integer "SortOrder",                 null: false
  end

  create_table "Menu", primary_key: "Menu_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "RecordSort"
    t.text    "RecordTag",  limit: 65535
  end

  create_table "PaymentMethod", primary_key: "PaymentMethod_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "NewPaymentMethod", limit: 65535, null: false
    t.integer "SortOrder",                      null: false
  end

  create_table "Payments", primary_key: "Payments_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535
    t.datetime "LastModificationTimeStamp",                                        null: false
    t.text     "LastModificationUser",      limit: 65535
    t.integer  "FK_qInvoices_PKEY"
    t.date     "Date"
    t.decimal  "Amount",                                  precision: 10, scale: 2
    t.text     "PaymentNumber",             limit: 65535
    t.integer  "FK_PaymentMethod_PKEY",     limit: 1
    t.text     "URL",                       limit: 65535
    t.index ["FK_PaymentMethod_PKEY"], name: "FK_PaymentMethod_PKEY", using: :btree
    t.index ["FK_qInvoices_PKEY"], name: "FK_qInvoices_PKEY", using: :btree
  end

  create_table "Pictures", primary_key: "Pictures_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "FK_TablePKEY",                                                         null: false
    t.text     "FK_TableName",      limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.datetime "CreationTimeStamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "CreationUser",      limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.text     "PicturePath",       limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
  end

  create_table "Project", primary_key: "Project_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                  limit: 16777215
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",          limit: 16777215
    t.integer  "FK_Customers_PKEY",                              null: false
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
    t.text     "Project_Address1",              limit: 65535,                 comment: "Project Site Address"
    t.text     "Project_Address2",              limit: 65535
    t.text     "Project_Address_Parking1",      limit: 65535,                 comment: "Project Primary Parking"
    t.text     "Project_Address_Parking2",      limit: 65535,                 comment: "Project Secondary Parking"
    t.text     "Project_City",                  limit: 65535
    t.text     "Project_State",                 limit: 65535
    t.text     "Project_Zip",                   limit: 65535
    t.text     "Project_Park_1_Address",        limit: 65535,                 comment: "Primary Parking"
    t.text     "Project_Park_1_Address_City",   limit: 65535,                 comment: "Primary Parking City"
    t.text     "Project_Park_1_Address_State",  limit: 65535,                 comment: "Primary Parking State"
    t.integer  "Project_Park_1_Address_Zip",                                  comment: "Primary Parking Zip Code"
    t.text     "Project_Park_2_Address",        limit: 65535,                 comment: "Secondary Parking Address"
    t.text     "Project_Park_2_Address_City",   limit: 65535,                 comment: "Secondary Parking City"
    t.text     "Project_Park_2_Address_State",  limit: 65535,                 comment: "Secondary Parking State"
    t.integer  "Project_Park_2_Address_Zip",                                  comment: "Secondary Parking Zip Code"
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
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["Project_Status"], name: "Project_Status", using: :btree
  end

  create_table "ProjectCrew", primary_key: "ProjectCrew_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Employees_PKEY"
    t.integer  "FK_Employees_List_Title_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_Tickets_PKEY"
    t.date     "StartDate",                                              null: false
    t.date     "EndDate",                                                null: false
    t.integer  "Weekends",                     limit: 1,     default: 0
    t.integer  "TitleIndex"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "ProjectEstimates", primary_key: "ProjectEstimates_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Project_PKEY",    null: false
    t.integer "FK_qEstimates_PKEY", null: false
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_qEstimates_PKEY"], name: "FK_qEstimates_PKEY", using: :btree
  end

  create_table "ProjectNoteTypes", primary_key: "ProjectNoteTypes_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "Name", limit: 65535, null: false, collation: "utf8_unicode_ci"
  end

  create_table "ProjectRoleTypes", primary_key: "ProjectRoleTypes_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description",      limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.text    "ShortDescription", limit: 65535,              collation: "utf8_unicode_ci"
    t.integer "SortOrder"
  end

  create_table "ProjectRoles", primary_key: "ProjectRoles_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535, collation: "utf8_unicode_ci"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_ProjectRoleTypes_PKEY"
    t.integer  "FK_Employees_PKEY"
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_ProjectRoleTypes_PKEY"], name: "FK_ProjectRoleTypes_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
  end

  create_table "ProjectSiteAssessment", primary_key: "ProjectSiteAssessment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                        limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp",                            default: -> { "CURRENT_TIMESTAMP" }
    t.text     "LastModificationUser",                limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.integer  "FK_Project_PKEY",                                                                           null: false
    t.text     "clientContact",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "clientPhone",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "clientEmail",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "siteAddress",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "hoursOfOperation",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "PPE",                                 limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "PPE_Comments",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "coiRequired",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "coiSubmitted",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "noiseRestrictions",                   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "noiseRestrictionComments",            limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "trashLocation",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "trashPickupNeeded",                   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "safetyOrientation",                   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "safetyOrientationComments",           limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "baseRoom",                            limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "baseRoomComments",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "accessRestrictions",                  limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "accessRestrictionComments",           limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "elevatorRestrictions",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "elevatorRestrictionComments",         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "deliveryLogisticsTime",               limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "freightElevator",                     limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "deliveryLocation",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "jobBoxNeeded",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "onSiteMeetingDates",                  limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "gcContact",                           limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "gcContactPhone",                      limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "gcContactEmail",                      limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "paintContact",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "paintContactPhone",                   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "paintContactEmail",                   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "electricalContact",                   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "electricalContactPhone",              limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "electricalContactEmail",              limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "dataContact",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "dataContactPhone",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "dataContactEmail",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "flooringContact",                     limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "flooringContactPhone",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "flooringContactEmail",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "furnitureContact",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "furnitureContactPhone",               limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "furnitureContactEmail",               limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsTiles",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsConcrete",                    limit: 65535,                                                      collation: "utf8_unicode_ci"
    t.text     "ceilingsWood",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsPandeck",                     limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsCloud",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsOpen",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsHeight",                      limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsScissorLiftRequired",         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsScissorLiftRequiredComments", limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsPanduit",                     limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsStructureBeams",              limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsUnistrutWork",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ceilingsProjection",                  limit: 65535,                                                      collation: "utf8_unicode_ci"
    t.text     "ceilingsProjectionComments",          limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "floorConduitRuns",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "floorOpenWalls",                      limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "floorCores",                          limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "floorConnectrac",                     limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "floorAccessToFloorBelow",             limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsConduit",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsRingAndString",                  limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsMetal",                          limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsConcrete",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsWoodStuds",                      limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsLoadBearing",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsTypeDrywall",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsTypeCement",                     limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsTypeDoubleSheetRock",            limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsBacking",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "wallsBackingComments",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "architecturalInterference",           limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "architecturalInterferenceComments",   limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "fireAlarmsSprinklers",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "hvacLayout",                          limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "electricalLayout",                    limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "cityCodes",                           limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "occupiedSpacesAbove",                 limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "occupiedSpacesBelow",                 limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "carts",                               limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "ladders",                             limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "hardware",                            limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "unistrut",                            limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "fishTape",                            limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "powerTools",                          limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "changesMade",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "changesMadeComments",                 limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "sheetRockDate",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "gridInstallationDate",                limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "tileDropDate",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "flooringDate",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "furnitureDate",                       limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "initialOnSiteStartDate",              limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "actionItems",                         limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.text     "generalNotes",                        limit: 65535,                                         null: false, collation: "utf8_unicode_ci"
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
  end

  create_table "Project_List_Status", primary_key: "Project_List_Status_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
  end

  create_table "Project_Transactions", primary_key: "Project_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535, collation: "utf8_unicode_ci"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_ProjectNoteTypes_PKEY"
    t.integer  "FK_Pictures_PKEY"
    t.text     "Text",                      limit: 65535, collation: "utf8_unicode_ci"
    t.string   "isSticky",                  limit: 1,     collation: "utf8_unicode_ci"
    t.string   "isPicture",                 limit: 1,     collation: "utf8_unicode_ci"
    t.index ["FK_Pictures_PKEY"], name: "FK_Pictures_PKEY", using: :btree
    t.index ["FK_ProjectNoteTypes_PKEY"], name: "FK_ProjectNoteTypes_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
  end

  create_table "RMA", primary_key: "RMA_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                       limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",               limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "RMA_FT_TableName",                   limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Table_PKEY"
    t.integer  "FK_Tech_Employees_PKEY"
    t.integer  "FK_qPurchaseOrders_PKEY"
    t.integer  "FK_qPurchaseOrders_PKEY_Required",                 default: 1
    t.integer  "FK_Tickets_PKEY"
    t.integer  "FK_Tickets_PKEY_Required",                         default: 0
    t.text     "RMA_Number",                         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Number_Required",                              default: 0
    t.text     "RMA_Description",                    limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Description_Required",           limit: 1,     default: 0, null: false
    t.integer  "RMA_Type"
    t.integer  "RMA_subType1"
    t.integer  "RMA_subType2"
    t.text     "RMA_Status",                         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Status_Required",                              default: 0
    t.integer  "RMA_Escalation"
    t.text     "RMA_Requestor_Name_First",           limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Requestor_Name_First_Required",                default: 0
    t.text     "RMA_Requestor_Name_Last",            limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Requestor_Name_Last_Required",                 default: 0
    t.text     "RMA_Requestor_Email",                limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Requestor_Email_Required",                     default: 0
    t.text     "RMA_Tech_Name_First",                limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Tech_Name_First_Required",                     default: 0
    t.text     "RMA_Tech_Name_Last",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Tech_Name_Last_Required",                      default: 0
    t.text     "RMA_Manufacturer",                   limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Manufacturer_Required",                        default: 0
    t.text     "RMA_Model",                          limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Model_Required",                               default: 0
    t.text     "RMA_Serial_Number",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Serial_Number_Required",                       default: 0
    t.text     "RMA_Vendor",                         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Vendor_Required",                              default: 0
    t.text     "RMA_Vendor_Website",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Vendor_Website_Required",                      default: 0
    t.text     "RMA_Vendor_RMA_Number",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Vendor_RMA_Number_Required",                   default: 0
    t.text     "RMA_Source",                         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Source_Required",                              default: 0
    t.text     "RMA_Contact_Name",                   limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Contact_Name_Required",                        default: 0
    t.text     "RMA_Contact_Phone",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Contact_Phone_Required",                       default: 0
    t.text     "RMA_Track_Replace_Number",           limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Track_Replace_Number_Required",                default: 0
    t.date     "RMA_Replace_Date_Expected"
    t.integer  "RMA_Replace_Date_Expected_Required",               default: 0
    t.text     "RMA_Track_Return_Number",            limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "RMA_Track_Return_Number_Required",                 default: 0
    t.date     "RMA_Return_Expected_Date"
    t.integer  "RMA_Return_Expected_Date_Required",                default: 0
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "RMA_Assignment", primary_key: "RMA_Assignment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_RMA_PKEY",       null: false
    t.integer "FK_Employees_PKEY", null: false
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_RMA_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "RMA_AutoAssignment", primary_key: "RMA_AutoAssignment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DropDown1"
    t.integer "DropDown2"
    t.integer "DropDown3"
    t.index ["DropDown1"], name: "DropDown1", using: :btree
    t.index ["DropDown2"], name: "DropDown2", using: :btree
    t.index ["DropDown3"], name: "DropDown3", using: :btree
  end

  create_table "RMA_AutoAssignment_Assignment", primary_key: "RMA_AutoAssignment_Assignment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_RMA_AutoAssignment_PKEY",   null: false
    t.integer "FK_Employees_PKEY"
    t.integer "FK_Employees_List_Title_PKEY"
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_RMA_AutoAssignment_PKEY"], name: "FK_Tickets_AutoAssignment_PKEY", using: :btree
  end

  create_table "RMA_List_Escalation", primary_key: "RMA_List_Escalation_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
  end

  create_table "RMA_List_Status", primary_key: "RMA_List_Status_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
    t.integer "Active",      limit: 1,     null: false
  end

  create_table "RMA_List_Type", primary_key: "RMA_List_Type_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false
    t.integer "SortOrder",                 null: false
    t.integer "ParentType"
    t.integer "ServiceCode", limit: 1
  end

  create_table "RMA_Transactions", primary_key: "RMA_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                                            null: false
    t.text     "CreationUser",              limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "LastModificationUser",      limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.integer  "FK_RMA_PKEY",                                                                  null: false
    t.text     "Text",                      limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.index ["FK_RMA_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "Review", primary_key: "Review_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                      null: false
    t.text     "CreationUser",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Employees_PKEY"
    t.integer  "FK_Sup_Employees_PKEY"
    t.string   "Review_Date",                  limit: 6,                              collation: "utf8_unicode_ci"
    t.integer  "FK_Employees_List_Title_PKEY",                                                                      comment: "Title at time of Review"
    t.text     "Review_Goal",                  limit: 65535,             null: false, collation: "utf8_unicode_ci"
    t.text     "Review_Sup_Comments",          limit: 65535,             null: false, collation: "utf8_unicode_ci"
    t.text     "Review_Emp_Comments",          limit: 65535,             null: false, collation: "utf8_unicode_ci"
    t.integer  "Review_Signed",                limit: 1,     default: 0, null: false
    t.integer  "Review_Sup_Signed",            limit: 1,     default: 0, null: false
    t.text     "Review_Signature",             limit: 65535,                          collation: "utf8_unicode_ci", comment: "Employee's Signature"
    t.text     "Review_Sup_Signature",         limit: 65535,                          collation: "utf8_unicode_ci", comment: "Supervisor's Signature"
    t.integer  "Review_CertsVerified",         limit: 1,     default: 0, null: false
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_PKEY", "FK_Sup_Employees_PKEY", "Review_Date"], name: "FK_Employees_PKEY_2", unique: true, using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Sup_Employees_PKEY"], name: "FK_Sup_Employees_PKEY", using: :btree
  end

  create_table "Review_Answers", primary_key: "Review_Answers_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",               limit: 65535,                                       collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",       limit: 65535,                                       collation: "utf8_unicode_ci"
    t.integer  "FK_Review_PKEY"
    t.integer  "FK_Review_Questions_PKEY"
    t.decimal  "Review_Answers_Score",                     precision: 10, scale: 2
    t.text     "Review_Answers_Sup_Comment", limit: 65535,                          null: false, collation: "utf8_unicode_ci"
    t.index ["FK_Review_PKEY", "FK_Review_Questions_PKEY"], name: "FK_Review_PKEY_2", unique: true, using: :btree
    t.index ["FK_Review_PKEY"], name: "FK_Review_PKEY", using: :btree
    t.index ["FK_Review_Questions_PKEY"], name: "FK_Review_Questions_PKEY", using: :btree
  end

  create_table "Review_Categories", primary_key: "Review_Categories_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                  limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Review_Categories_Name",        limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Review_Categories_Weight"
    t.integer  "Review_Categories_Page_Number",               null: false,                               unsigned: true
  end

  create_table "Review_Questions", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "Review_Questions_PKEY",                      null: false
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                 limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_Review_Categories_PKEY"
    t.text     "Review_Questions_Description", limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Review_Questions_Text",        limit: 65535,              collation: "utf8_unicode_ci"
    t.index ["FK_Review_Categories_PKEY"], name: "FK_Review_Categories_PKEY", using: :btree
    t.index ["Review_Questions_PKEY"], name: "Review_Questions_PKEY", unique: true, using: :btree
  end

  create_table "Review_Questions_Join_Titles", primary_key: "Review_Questions_Join_Titles_PKEY", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Review_Questions_PKEY"
    t.integer "FK_Employees_List_Title_PKEY"
    t.integer "Sort_Order",                   null: false
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY_2", using: :btree
    t.index ["FK_Review_Questions_PKEY"], name: "FK_Review_Questions_PKEY", using: :btree
    t.index ["FK_Review_Questions_PKEY"], name: "FK_Review_Questions_PKEY_2", using: :btree
  end

  create_table "SalesLead_Transactions", primary_key: "SalesLead_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_Customers_PKEY"
    t.text     "Title",                     limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.text     "Text",                      limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.string   "isSticky",                  limit: 1,                  collation: "utf8_unicode_ci"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
  end

  create_table "Schedule", primary_key: "Schedule_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                 limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_Tickets_PKEY",                            null: false
    t.integer  "FK_Employees_List_Title_PKEY",               null: false
    t.integer  "TitleIndex"
    t.integer  "FK_Employees_PKEY"
    t.date     "Sched_Date",                                 null: false
    t.time     "Sched_Time"
    t.integer  "Sched_Duration"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_Tickets_PKEY", "FK_Employees_PKEY", "Sched_Date"], name: "no_dupes", unique: true, using: :btree
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
    t.index ["TitleIndex"], name: "TitleIndex", using: :btree
  end

  create_table "Skill_Assessment_Answers", primary_key: "Skill_Assessment_Answers_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                            null: false
    t.text     "CreationUser",                   limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_Employees_PKEY"
    t.integer  "FK_Sup_Employees_PKEY"
    t.date     "Skill_Assessment_Answers_Date"
    t.integer  "FK_Skill_Assessment_Questions"
    t.integer  "Skill_Assessment_Answers_Score"
    t.index ["FK_Employees_PKEY", "FK_Sup_Employees_PKEY", "FK_Skill_Assessment_Questions"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Skill_Assessment_Questions"], name: "FK_Skill_Assessment_Questions", using: :btree
    t.index ["FK_Sup_Employees_PKEY"], name: "FK_Sup_Employees_PKEY", using: :btree
  end

  create_table "Skill_Assessment_Cat1", primary_key: "Skill_Assessment_Cat1_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Name",      limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder"
  end

  create_table "Skill_Assessment_Cat2", primary_key: "Skill_Assessment_Cat2_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Skill_Assessment_Questions_Cat1",               null: false
    t.text    "Name",                               limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder"
    t.index ["FK_Skill_Assessment_Questions_Cat1"], name: "FK_Skill_Assessment_Questions_Cat1", using: :btree
  end

  create_table "Skill_Assessment_Cat3", primary_key: "Skill_Assessment_Cat3_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Skill_Assessment_Questions_Cat2",               null: false
    t.text    "Name",                               limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder"
    t.index ["FK_Skill_Assessment_Questions_Cat2"], name: "FK_Skill_Assessment_Questions_Cat2", using: :btree
  end

  create_table "Skill_Assessment_Cat4", primary_key: "Skill_Assessment_Cat4_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Skill_Assessment_Questions_Cat3",               null: false
    t.text    "Name",                               limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder"
    t.index ["FK_Skill_Assessment_Questions_Cat3"], name: "FK_Skill_Assessment_Questions_Cat3", using: :btree
  end

  create_table "Skill_Assessment_Questions", primary_key: "Skill_Assessment_Questions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                null: false
    t.text     "CreationUser",                       limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",               limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_Skill_Assessment_Questions_Cat1"
    t.integer  "FK_Skill_Assessment_Questions_Cat2"
    t.integer  "FK_Skill_Assessment_Questions_Cat3"
    t.integer  "FK_Skill_Assessment_Questions_Cat4"
    t.text     "Skill_Assessment_Questions_Text",    limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Skill_Assessment_Questions_Type"
    t.integer  "SortOrder"
    t.index ["FK_Skill_Assessment_Questions_Cat1"], name: "FK_Skill_Assessment_Questions_Cat1", using: :btree
    t.index ["FK_Skill_Assessment_Questions_Cat2"], name: "FK_Skill_Assessment_Questions_Cat2", using: :btree
    t.index ["FK_Skill_Assessment_Questions_Cat3"], name: "FK_Skill_Assessment_Questions_Cat3", using: :btree
    t.index ["FK_Skill_Assessment_Questions_Cat4"], name: "FK_Skill_Assessment_Questions_Cat4", using: :btree
    t.index ["Skill_Assessment_Questions_Type"], name: "Skill_Assessment_Questions_Type", using: :btree
  end

  create_table "Skill_Assessment_Ranges", primary_key: "Skill_Assessment_Ranges_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Employee_List_Title_PKEY",    null: false
    t.integer "FK_Skill_Assessment_Cat1_PKEY"
    t.integer "FK_Skill_Assessment_Types_PKEY"
    t.integer "Min"
    t.integer "Max"
    t.index ["FK_Employee_List_Title_PKEY", "FK_Skill_Assessment_Cat1_PKEY", "FK_Skill_Assessment_Types_PKEY"], name: "FK_Employee_List_Title_PKEY", using: :btree
    t.index ["FK_Employee_List_Title_PKEY"], name: "FK_Employee_List_Title_PKEY_2", using: :btree
    t.index ["FK_Skill_Assessment_Cat1_PKEY"], name: "FK_Skill_Assessment_Cat1_PKEY", using: :btree
    t.index ["FK_Skill_Assessment_Types_PKEY"], name: "FK_FK_Skill_Assessment_Types_PKEY", using: :btree
  end

  create_table "Skill_Assessment_Types", primary_key: "Skill_Assessment_Types_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "Name",            limit: 65535, collation: "utf8_unicode_ci"
    t.text "Description",     limit: 65535, collation: "utf8_unicode_ci"
    t.text "Skill_Ass_Color", limit: 65535, collation: "utf8_unicode_ci"
  end

  create_table "StartPage_Alert", primary_key: "StartPage_Alert_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "CreationUser",      limit: 65535,                                                   collation: "utf8_unicode_ci"
    t.datetime "CreationTimeStamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer  "FK_Tickets_PKEY"
  end

  create_table "Tickets", primary_key: "Tickets_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                                                  comment: "Date Created"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tickets_FT_TableName",      limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_Table_PKEY"
    t.integer  "FK_Child_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.text     "Tick_Address",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Company",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_CompanyAbr",           limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Contact",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_ContactAlt",           limit: 65535,              collation: "utf8_unicode_ci"
    t.date     "Tick_DateEndActual"
    t.date     "Tick_DateEndProjected",                                                              comment: "Requested Completion Date"
    t.date     "Tick_DateLogged"
    t.date     "Tick_DateStartActual"
    t.date     "Tick_DateStartProjected",                                                            comment: "Requested Start Date"
    t.text     "Tick_DescriptionLong",      limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_DescriptionShort",     limit: 65535,              collation: "utf8_unicode_ci", comment: "Description"
    t.text     "Tick_EmailCC",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_EmailTo",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Escalation",           limit: 65535,              collation: "utf8_unicode_ci", comment: "Escalation Level"
    t.date     "Tick_ExpiryDate"
    t.integer  "Tick_InactiveFlag"
    t.text     "Tick_Manufacturer",         limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Materials",            limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Model",                limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Number",               limit: 65535,              collation: "utf8_unicode_ci", comment: "Ticket Number"
    t.text     "Tick_PhoneAlt",             limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_PhoneFax",             limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_PhoneOffice",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Room",                 limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_SerialNumber",         limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Tick_Status",               limit: 1,                                                comment: "Status"
    t.text     "Tick_TotalHours",           limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Tick_Type",                               null: false
    t.integer  "Tick_subType1",                           null: false
    t.integer  "Tick_subType2",                           null: false
    t.text     "Tick_WorkPerformed",        limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Tick_Diagnosis",            limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Tick_Reopened",             limit: 1
    t.text     "Tick_Title",                limit: 255,                collation: "utf8_unicode_ci"
    t.integer  "Tick_Maint_Status",         limit: 1
    t.integer  "Tick_EstHours"
    t.integer  "Tick_NightWork",            limit: 1
    t.time     "Tick_StartTime"
    t.index ["Tick_Status"], name: "Tick_Status", using: :btree
    t.index ["Tick_Type"], name: "Tick_Type", using: :btree
  end

  create_table "Tickets_Assignment", primary_key: "Tickets_Assignment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Tickets_PKEY",   null: false
    t.integer "FK_Employees_PKEY", null: false
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "Tickets_AutoAssignment", primary_key: "Tickets_AutoAssignment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DropDown1"
    t.integer "DropDown2"
    t.integer "DropDown3"
    t.index ["DropDown1"], name: "DropDown1", using: :btree
    t.index ["DropDown2"], name: "DropDown2", using: :btree
    t.index ["DropDown3"], name: "DropDown3", using: :btree
  end

  create_table "Tickets_AutoAssignment_Assignment", primary_key: "Tickets_AutoAssignment_Assignment_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Tickets_AutoAssignment_PKEY", null: false
    t.integer "FK_Employees_PKEY"
    t.integer "FK_Employees_List_Title_PKEY"
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Tickets_AutoAssignment_PKEY"], name: "FK_Tickets_AutoAssignment_PKEY", using: :btree
  end

  create_table "Tickets_Email_Remind", primary_key: "Tickets_Email_Remind_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "FK_Tickets_PKEY",     null: false
    t.integer  "FK_Employees_PKEY",   null: false
    t.datetime "Tick_Email_DateTime"
    t.integer  "Tick_Email_Sent"
  end

  create_table "Tickets_Flag", primary_key: "Tickets_Flag_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_Tickets_PKEY",   null: false
    t.integer "FK_Employees_PKEY", null: false
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "Tickets_List_Escalation", primary_key: "Tickets_List_Escalation_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
  end

  create_table "Tickets_List_Maint_Status", primary_key: "Tickets_List_Maint_Status_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
  end

  create_table "Tickets_List_Status", primary_key: "Tickets_List_Status_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
    t.integer "Active",      limit: 1,     null: false
  end

  create_table "Tickets_List_Type", primary_key: "Tickets_List_Type_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
    t.integer "ParentType"
    t.integer "ServiceCode", limit: 1
  end

  create_table "Tickets_Transactions", primary_key: "Tickets_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                                            null: false
    t.text     "CreationUser",              limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "LastModificationUser",      limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.integer  "FK_Tickets_PKEY",                                                              null: false
    t.text     "Text",                      limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
  end

  create_table "TimeCardTrans", primary_key: "TimeCardTrans_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                   limit: 65535,                         collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",           limit: 65535,                         collation: "utf8_unicode_ci"
    t.integer  "FK_Holidays_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_TimeCards_PKEY"
    t.integer  "FK_Tickets_PKEY"
    t.integer  "FK_Employees_PKEY"
    t.date     "TCT_Date"
    t.date     "TCT_Date_01"
    t.date     "TCT_Date_02"
    t.date     "TCT_Date_03"
    t.date     "TCT_Date_04"
    t.date     "TCT_Date_05"
    t.date     "TCT_Date_06"
    t.date     "TCT_Date_07"
    t.decimal  "TCT_Hours",                                    precision: 6, scale: 2
    t.text     "TCT_HoursType",                  limit: 65535,                         collation: "utf8_unicode_ci"
    t.text     "TCT_Log",                        limit: 65535,                         collation: "utf8_unicode_ci"
    t.decimal  "TCT_Miles",                                    precision: 6, scale: 2
    t.text     "TCT_Notes",                      limit: 65535,                         collation: "utf8_unicode_ci"
    t.text     "TCT_QBJobName",                  limit: 65535,                         collation: "utf8_unicode_ci"
    t.text     "TCT_Status",                     limit: 65535,                         collation: "utf8_unicode_ci"
    t.integer  "TCT_Approved_FK_Employees_PKEY"
    t.datetime "TCT_Approved_Date"
    t.text     "TCT_TicketNumber",               limit: 65535,                         collation: "utf8_unicode_ci"
    t.integer  "TCT_JobPhase"
    t.integer  "FK_Employees_List_Title_PKEY"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Employees_List_Title_PKEY"], name: "FK_Employees_List_Title_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Holidays_PKEY"], name: "FK_Holidays_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_Tickets_PKEY"], name: "FK_Tickets_PKEY", using: :btree
    t.index ["FK_TimeCards_PKEY"], name: "FK_TimeCards_PKEY", using: :btree
  end

  create_table "TimeCards", primary_key: "TimeCards_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                  limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",          limit: 65535, collation: "utf8_unicode_ci"
    t.integer  "FK_Employees_PKEY"
    t.date     "TC_Date_01"
    t.date     "TC_Date_02"
    t.date     "TC_Date_03"
    t.date     "TC_Date_04"
    t.date     "TC_Date_05"
    t.date     "TC_Date_06"
    t.date     "TC_Date_07"
    t.text     "TC_Log",                        limit: 65535, collation: "utf8_unicode_ci"
    t.text     "TC_Status",                     limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "TC_Approved_Date"
    t.integer  "TC_Approved_FK_Employees_PKEY"
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
  end

  create_table "TimePunch", primary_key: "TimePunch_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535, collation: "utf8_unicode_ci"
    t.date     "TimePunch_DateID"
    t.integer  "FK_Employees_PKEY"
    t.date     "p_01_BeginDay_Date"
    t.time     "p_01_BeginDay_Time"
    t.date     "p_02_Break_01_Out_Date"
    t.time     "p_02_Break_01_Out_Time"
    t.date     "p_03_Break_01_In_Date"
    t.time     "p_03_Break_01_In_Time"
    t.date     "p_04_Lunch_01_Out_Date"
    t.time     "p_04_Lunch_01_Out_Time"
    t.date     "p_05_Lunch_01_In_Date"
    t.time     "p_05_Lunch_01_In_Time"
    t.date     "p_06_Break_02_Out_Date"
    t.time     "p_06_Break_02_Out_Time"
    t.date     "p_07_Break_02_In_Date"
    t.time     "p_07_Break_02_In_Time"
    t.date     "p_08_Break_03_Out_Date"
    t.time     "p_08_Break_03_Out_Time"
    t.date     "p_09_Break_03_In_Date"
    t.time     "p_09_Break_03_In_Time"
    t.date     "p_10_Lunch_02_Out_Date"
    t.time     "p_10_Lunch_02_Out_Time"
    t.date     "p_11_Lunch_02_In_Date"
    t.time     "p_11_Lunch_02_In_Time"
    t.date     "p_12_Break_04_Out_Date"
    t.time     "p_12_Break_04_Out_Time"
    t.date     "p_13_Break_04_In_Date"
    t.time     "p_13_Break_04_In_Time"
    t.date     "p_14_EndDay_Date"
    t.time     "p_14_EndDay_Time"
    t.text     "PunchStatus",               limit: 65535, collation: "utf8_unicode_ci"
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
  end

  create_table "Vendor", primary_key: "Vendor_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "Vendor_Name", limit: 65535, null: false, collation: "utf8_unicode_ci"
  end

  create_table "access_log", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "PKEY",                                           null: false
    t.string   "username",                                       null: false
    t.datetime "timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "action",                                         null: false
    t.index ["PKEY"], name: "PKEY", unique: true, using: :btree
  end

  create_table "cts_answers", primary_key: "cts_answers_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "FK_users_PKEY",                                                       null: false
    t.text     "superemail",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.datetime "Timestamp",                      default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "question1",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question2",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question3",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question4",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question5",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question6",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question7",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question8",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question9",     limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question10",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question11",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question12",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question13",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question14",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question15",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question16",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question17",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question18",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question19",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question20",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question21",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question22",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question23",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question24",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question25",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question26",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question27",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question28",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question29",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question30",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question31",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question32",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question33",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question34",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question35",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question36",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question37",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question38",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question39",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question40",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question41",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question42",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question43",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question44",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question45",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question46",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question47",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question48",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question49",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question50",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question51",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question52",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question53",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question54",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question55",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question56",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question57",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question58",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question59",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question60",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question61",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question62",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question63",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question64",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question65",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question66",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question67",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question68",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question69",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question70",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question71",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question72",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question73",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question74",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question75",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question76",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question77",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question78",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question79",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question80",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question81",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question82",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question83",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question84",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question85",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question86",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question87",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question88",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question89",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question90",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question91",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question92",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question93",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question94",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question95",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question96",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question97",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question98",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question99",    limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question100",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question101",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question102",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question103",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question104",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question105",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question106",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question107",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question108",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question109",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question110",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question111",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question112",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question113",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question114",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question115",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question116",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question117",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question118",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question119",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question120",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question121",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question122",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question123",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question124",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question125",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question126",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question127",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question128",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question129",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question130",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question131",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question132",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question133",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question134",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question135",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question136",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question137",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question138",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question139",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question140",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question141",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question142",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question143",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question144",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question145",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question146",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question147",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question148",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question149",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question150",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question151",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question152",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question153",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question154",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question155",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question156",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question157",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question158",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question159",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question160",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question161",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question162",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question163",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question164",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question165",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question166",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question167",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question168",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
    t.text     "question169",   limit: 16777215,                                                   collation: "utf8_unicode_ci"
  end

  create_table "customers_ext", primary_key: "customers_ext_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                                                  comment: "TCP"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci", comment: "TCP"
    t.datetime "LastModificationTimeStamp",                                                          comment: "TCP"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci", comment: "TCP"
    t.string   "fk_qbcust_id",              limit: 40,    null: false, collation: "utf8_unicode_ci", comment: "quickbooks_sql.customers.id"
    t.text     "Cust_Address1",             limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_Address2",             limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_BillTo_Address1",      limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_BillTo_Address2",      limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_BillTo_City",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_BillTo_Company",       limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_BillTo_Country",       limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_BillTo_Email",         limit: 65535,              collation: "utf8_unicode_ci", comment: "A/P Email"
    t.text     "Cust_BillTo_Name",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_AP_Name",              limit: 65535,              collation: "utf8_unicode_ci", comment: "A/P Name"
    t.text     "Cust_BillTo_Phone",         limit: 65535,              collation: "utf8_unicode_ci", comment: "A/P Phone"
    t.text     "Cust_BillTo_State",         limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Cust_BillTo_Zip"
    t.text     "Cust_City",                 limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_CLNo",                 limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_Company",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_CompanyAbr",           limit: 65535,              collation: "utf8_unicode_ci", comment: "Customer Short Name"
    t.text     "Cust_ContactAlt",           limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_Country",              limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_EmailCC",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_EmailTo",              limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_InactiveFlag",         limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_NameAltFull",          limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_NameFirst",            limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_NameFull",             limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_NameLast",             limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_NameMiddle",           limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_NameSalutation",       limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_PhoneAlt",             limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_PhoneCell",            limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_PhoneFax",             limit: 65535,              collation: "utf8_unicode_ci", comment: "A/P FAX"
    t.text     "Cust_PhoneOffice",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_PONo",                 limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_Rep",                  limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_SaleTaxCode",          limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_ShipTo_Address1",      limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_ShipTo_Address2",      limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_ShipTo_City",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_ShipTo_Company",       limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_ShipTo_Country",       limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_ShipTo_Email",         limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_ShipTo_Name",          limit: 65535,              collation: "utf8_unicode_ci"
    t.text     "Cust_ShipTo_Phone",         limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_ShipTo_State",         limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "Cust_ShipTo_Zip"
    t.text     "Cust_State",                limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_Terms",                limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.text     "Cust_Type",                 limit: 65535,              collation: "utf8_unicode_ci", comment: "always blank"
    t.integer  "Cust_Zip",                                                                           comment: "always blank"
    t.index ["fk_qbcust_id"], name: "fk_qbcust_id", using: :btree
  end

  create_table "groups", primary_key: "PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "group_name", limit: 50, null: false
  end

  create_table "inventory", primary_key: "PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "asset_id",                 limit: 30
    t.string "serial_number",            limit: 30
    t.string "machine_name",             limit: 30
    t.string "manufacturer",             limit: 30
    t.string "model",                    limit: 30
    t.string "processor",                limit: 30
    t.string "processor_speed",          limit: 30
    t.string "memory_type",              limit: 30
    t.string "memory_size",              limit: 30
    t.string "display_size",             limit: 30
    t.string "OS",                       limit: 30
    t.string "checked_out_to",           limit: 30
    t.text   "checked_out_date",         limit: 16777215
    t.text   "check_in_date_expected",   limit: 16777215
    t.date   "date_purchased"
    t.string "vendor_purchased_from",    limit: 30
    t.string "warranty",                 limit: 30
    t.string "warranty_active",          limit: 30
    t.date   "warranty_expiration_date"
    t.text   "phoneNumber",              limit: 16777215
  end

  create_table "job_phases", primary_key: "job_phases_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "job_phases_name",       limit: 65535, null: false
    t.integer "job_phases_sort_order",               null: false
  end

  create_table "membership", primary_key: "PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "userid",  null: false
    t.integer "groupid", null: false
    t.index ["groupid"], name: "groupid", using: :btree
    t.index ["userid"], name: "userid", using: :btree
  end

  create_table "menu_items", primary_key: "PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "menu_header",      limit: 50,       null: false
    t.string  "menu_item",        limit: 50,       null: false
    t.string  "menu_path",                         null: false
    t.text    "menu_path_mobile", limit: 16777215
    t.integer "sortOrder"
  end

  create_table "permissions", primary_key: "PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "userid"
    t.integer "groupid"
    t.integer "resourceid"
    t.integer "menuid"
    t.integer "pageid"
    t.string  "access",       limit: 1, collation: "utf8_unicode_ci"
    t.string  "read_access",  limit: 1, collation: "utf8_unicode_ci"
    t.string  "write_access", limit: 1, collation: "utf8_unicode_ci"
    t.string  "admin_access", limit: 1, collation: "utf8_unicode_ci"
  end

  create_table "qDocuments", primary_key: "qDocuments_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535, collation: "utf8_unicode_ci"
    t.integer  "FK_Employees_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_qInvoices_PKEY"
    t.integer  "FK_qPurchaseOrders_PKEY"
    t.integer  "FK_qSalesOrders_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_customerClient_PKEY"
    t.date     "Doc_Date"
    t.text     "Doc_Description",           limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Doc_Notes",                 limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Doc_Type",                  limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Doc_URL",                   limit: 65535, collation: "utf8_unicode_ci", comment: "Document URL"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Employees_PKEY"], name: "FK_Employees_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_qEstimates_PKEY"], name: "FK_qEstimates_PKEY", using: :btree
    t.index ["FK_qInvoices_PKEY"], name: "FK_qInvoices_PKEY", using: :btree
    t.index ["FK_qPurchaseOrders_PKEY"], name: "FK_qPurchaseOrders_PKEY", using: :btree
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
  end

  create_table "qDocuments_Transactions", primary_key: "qDocuments_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "FK_qDocuments_PKEY"
    t.text    "FK_TableName",       limit: 65535, collation: "utf8_unicode_ci"
    t.integer "FK_TablePKEY"
    t.integer "FK_TableSubType"
    t.index ["FK_TablePKEY"], name: "FK_TablePKEY", using: :btree
  end

  create_table "qEstimates", primary_key: "qEstimates_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",         limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.decimal  "Est_Amount",                                 precision: 10, scale: 2
    t.text     "Est_Company",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_CompanyAbr",               limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_Contact",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_ContactAlt",               limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_CPR",                      limit: 65535,                          collation: "utf8_unicode_ci"
    t.date     "Est_DateCompletion_Actual"
    t.date     "Est_DateCompletion_Estimated"
    t.date     "Est_DateCreated"
    t.date     "Est_DateFDOB"
    t.date     "Est_DateStarted_Actual"
    t.date     "Est_DateStarted_Estimated"
    t.text     "Est_EmailCC",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_EmailTo",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_NameFirst",                limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_NameLast",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_NameMiddle",               limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_NameSalutation",           limit: 65535,                          collation: "utf8_unicode_ci", comment: "Salutation -"
    t.text     "Est_Notes",                    limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_Number",                   limit: 65535
    t.integer  "Est_PercentComplete"
    t.text     "Est_PhoneAlt",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_PhoneFax",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_PhoneOffice",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_ProjectName",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_Status",                   limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_URL",                      limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Est_URL BU",                   limit: 65535,                          collation: "utf8_unicode_ci"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
  end

  create_table "qEstimates_Transactions", primary_key: "qEstimates_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_qEstimates_PKEY"
    t.text     "Text",                      limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.index ["FK_qEstimates_PKEY"], name: "FK_qInvoices_PKEY", using: :btree
  end

  create_table "qInvoices", primary_key: "qInvoices_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                                                              comment: "Date Created"
    t.text     "CreationUser",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_qSalesOrders_PKEY"
    t.decimal  "Inv_Amount",                              precision: 10, scale: 2,                               comment: "Inv Amount"
    t.date     "Inv_DateCreated"
    t.date     "Inv_DateInvoiceApproved",                                                                        comment: "Date Aprv -"
    t.date     "Inv_DateInvoiceConfirmed",                                                                       comment: "Date Conf -"
    t.date     "Inv_DateInvoicePaid"
    t.date     "Inv_DateScheduled",                                                                              comment: "Sch Date -"
    t.date     "Inv_DateSent",                                                                                   comment: "Date Sent"
    t.text     "Inv_Description",           limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Inv_InvConfirmedNote",      limit: 65535,                          collation: "utf8_unicode_ci", comment: "Conf # -"
    t.text     "Inv_InvSentTo",             limit: 65535,                          collation: "utf8_unicode_ci", comment: "To"
    t.integer  "Inv_InvSentVia",            limit: 1,                                                            comment: "Via"
    t.text     "Inv_Notes",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Inv_Number",                limit: 65535,                                                        comment: "Inv Number"
    t.text     "Inv_PaidMethod",            limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Inv_PaymentURL",            limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Inv_PaymentURL BU",         limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Inv_ProjectName",           limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "Inv_Status",                limit: 1,                                                            comment: "Inv Status"
    t.integer  "Inv_Terms",                 limit: 1,                                                            comment: "Terms"
    t.text     "Inv_URL",                   limit: 65535,                          collation: "utf8_unicode_ci", comment: "Inv URL"
    t.text     "Inv_URL BU",                limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "AutolinkPDF"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_qEstimates_PKEY"], name: "FK_qEstimates_PKEY", using: :btree
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
    t.index ["Inv_InvSentVia"], name: "Inv_InvSentVia", using: :btree
    t.index ["Inv_Status"], name: "Inv_Status", using: :btree
    t.index ["Inv_Terms"], name: "Inv_Terms", using: :btree
  end

  create_table "qInvoices_List_Status", primary_key: "qInvoices_List_Status_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci", comment: "Inv Status"
    t.integer "SortOrder",                 null: false
  end

  create_table "qInvoices_List_Terms", primary_key: "qInvoices_List_Terms_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
  end

  create_table "qInvoices_List_Via", primary_key: "qInvoices_List_Via_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
  end

  create_table "qInvoices_Log", primary_key: "qInvoices_Log_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "FK_qInvoices_PKEY",                                                    null: false
    t.datetime "timestamp",                       default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "username",          limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.text     "queryString",       limit: 65535,                                      null: false, collation: "utf8_unicode_ci"
    t.index ["FK_qInvoices_PKEY"], name: "FK_qInvoices_PKEY", using: :btree
  end

  create_table "qInvoices_Transactions", primary_key: "qInvoices_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_qInvoices_PKEY"
    t.text     "Text",                      limit: 65535, null: false, collation: "utf8_unicode_ci", comment: "Notes"
    t.index ["FK_qInvoices_PKEY"], name: "FK_qInvoices_PKEY", using: :btree
  end

  create_table "qPurchaseOrders", primary_key: "qPurchaseOrders_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_qSalesOrders_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.decimal  "PO_Amount",                               precision: 10, scale: 2
    t.text     "PO_ConfirmationNo",         limit: 65535,                          collation: "utf8_unicode_ci"
    t.date     "PO_DateComplete"
    t.date     "PO_DateConfirmed"
    t.date     "PO_DateCreation"
    t.date     "PO_DateDelivered"
    t.date     "PO_DateETA"
    t.date     "PO_DateReceived"
    t.date     "PO_DateSent"
    t.date     "PO_DateShipped"
    t.date     "PO_ETA"
    t.text     "PO_Notes",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_Number",                 limit: 65535
    t.text     "PO_ProjectName",            limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_ShippedTo",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_Status",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_URL",                    limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_URL BU",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_Vendor",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.date     "PO_NBD"
    t.text     "PO_Bundle",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "PO_OrderByDate",            limit: 65535,                          collation: "utf8_unicode_ci"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_qEstimates_PKEY"], name: "FK_qEstimates_PKEY", using: :btree
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
  end

  create_table "qPurchaseOrders_Transactions", primary_key: "qPurchaseOrders_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_qPurchaseOrders_PKEY"
    t.text     "Text",                      limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.index ["FK_qPurchaseOrders_PKEY"], name: "FK_qPurchaseOrders_PKEY", using: :btree
  end

  create_table "qSalesOrders", primary_key: "qSalesOrders_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp",                                                                               comment: "Date Created"
    t.text     "CreationUser",               limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",       limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.decimal  "SO_Amount",                                precision: 10, scale: 2,                               comment: "Amount"
    t.decimal  "SO_ClientPOAmount",                        precision: 10, scale: 2,                               comment: "Amount"
    t.date     "SO_ClientPODate",                                                                                 comment: "Date"
    t.text     "SO_ClientPONo",              limit: 65535,                          collation: "utf8_unicode_ci", comment: "Number"
    t.text     "SO_ClientPOURL",             limit: 65535,                          collation: "utf8_unicode_ci", comment: "URL to PO"
    t.text     "SO_ClientPOURL BU",          limit: 65535,                          collation: "utf8_unicode_ci"
    t.date     "SO_DateCompleted_Actual",                                                                         comment: "Act. Completion"
    t.date     "SO_DateCompleted_Estimated",                                                                      comment: "Est. Completion"
    t.date     "SO_DateCreated"
    t.date     "SO_DateFDOB",                                                                                     comment: "FDOB"
    t.date     "SO_DateStarted_Actual",                                                                           comment: "Act. Start"
    t.date     "SO_DateStarted_Estimated",                                                                        comment: "Est. Start"
    t.text     "SO_Notes",                   limit: 65535,                          collation: "utf8_unicode_ci", comment: "Notes"
    t.text     "SO_Number",                  limit: 65535,                                                        comment: "Number"
    t.integer  "SO_PercentComplete",                                                                              comment: "% Complete"
    t.text     "SO_ProjectForeman",          limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "SO_ProjectManager",          limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "SO_Status",                  limit: 1,                                                            comment: "SO Status"
    t.text     "SO_URL",                     limit: 65535,                          collation: "utf8_unicode_ci", comment: "URL to SO"
    t.text     "SO_URL BU",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.date     "SO_MaterialsDateNeededBy"
    t.text     "SO_MaterialsStatus",         limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "SO_LOM_URL",                 limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_ProgMan_Employees_PKEY"
    t.integer  "FK_TechLead_Employees_PKEY"
    t.text     "SO_Description",             limit: 65535,                          collation: "utf8_unicode_ci"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_qEstimates_PKEY"], name: "FK_qEstimates_PKEY", using: :btree
    t.index ["SO_Status"], name: "SO_Status", using: :btree
  end

  create_table "qSalesOrdersTracker", primary_key: "qSalesOrdersTracker_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "FK_qSalesOrders_PKEY"
    t.integer  "FK_qPurchaseOrders_PKEY"
    t.text     "Manufacturer",              limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Model",                     limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Description",               limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "Vendor",                    limit: 65535,                          collation: "utf8_unicode_ci"
    t.text     "VendorPO",                  limit: 65535,                          collation: "utf8_unicode_ci"
    t.integer  "TotalNeeded",                             default: 0, null: false
    t.integer  "TotalStaged",                             default: 0, null: false
    t.integer  "UnitsOnClient",                           default: 0, null: false
    t.integer  "Status",                                  default: 0, null: false
    t.date     "ETA"
    t.date     "NBD"
    t.index ["FK_qPurchaseOrders_PKEY"], name: "FK_qPurchaseOrders_PKEY", using: :btree
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
  end

  create_table "qSalesOrders_List_Status", primary_key: "qSalesOrders_List_Status_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "Description", limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.integer "SortOrder",                 null: false
    t.integer "Active",      limit: 1,     null: false
  end

  create_table "qSalesOrders_Transactions", primary_key: "qSalesOrders_Transactions_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535,              collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535,              collation: "utf8_unicode_ci"
    t.integer  "FK_qSalesOrders_PKEY",                    null: false
    t.text     "Text",                      limit: 65535, null: false, collation: "utf8_unicode_ci"
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
  end

  create_table "qShipments", primary_key: "qShipments_PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "CreationTimeStamp"
    t.text     "CreationUser",              limit: 65535, collation: "utf8_unicode_ci"
    t.datetime "LastModificationTimeStamp"
    t.text     "LastModificationUser",      limit: 65535, collation: "utf8_unicode_ci"
    t.integer  "FK_Project_PKEY"
    t.integer  "FK_qSalesOrders_PKEY"
    t.integer  "FK_Jobs_PKEY"
    t.integer  "FK_qEstimates_PKEY"
    t.integer  "FK_Customers_PKEY"
    t.integer  "FK_qPurchaseOrders_PKEY"
    t.text     "Ship_Carrier",              limit: 65535, collation: "utf8_unicode_ci"
    t.date     "Ship_DateAccepted"
    t.date     "Ship_DateETA"
    t.date     "Ship_DateReceived"
    t.date     "Ship_DateShip"
    t.text     "Ship_Description",          limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Ship_Method",               limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Ship_Notes",                limit: 65535, collation: "utf8_unicode_ci"
    t.integer  "Ship_NumberBoxes"
    t.integer  "Ship_Qty"
    t.text     "Ship_ShipTo",               limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Ship_Status",               limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Ship_TrackingNumber",       limit: 65535, collation: "utf8_unicode_ci"
    t.text     "Ship_TrackingURL",          limit: 65535, collation: "utf8_unicode_ci"
    t.index ["FK_Customers_PKEY"], name: "FK_Customers_PKEY", using: :btree
    t.index ["FK_Jobs_PKEY"], name: "FK_Jobs_PKEY", using: :btree
    t.index ["FK_Project_PKEY"], name: "FK_Project_PKEY", using: :btree
    t.index ["FK_qEstimates_PKEY"], name: "FK_qEstimates_PKEY", using: :btree
    t.index ["FK_qPurchaseOrders_PKEY"], name: "FK_qPurchaseOrders_PKEY", using: :btree
    t.index ["FK_qSalesOrders_PKEY"], name: "FK_qSalesOrders_PKEY", using: :btree
  end

  create_table "users", primary_key: "PKEY", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username",     limit: 50, null: false, collation: "utf8_unicode_ci"
    t.string "password",     limit: 64,              collation: "utf8_unicode_ci"
    t.string "salt",         limit: 3,               collation: "utf8_unicode_ci"
    t.string "ldap_pass",    limit: 1,  null: false, collation: "utf8_unicode_ci"
    t.string "Client_JobID",            null: false, collation: "utf8_unicode_ci"
    t.index ["username"], name: "username", unique: true, using: :btree
  end

  add_foreign_key "Classes_Certs", "Classes_Certs_List_Tier", column: "FK_Classes_Certs_List_Tier_PKEY", primary_key: "Classes_Certs_List_Tier_PKEY", name: "Classes_Certs_ibfk_3"
  add_foreign_key "Classes_Certs", "Vendor", column: "FK_Vendor_PKEY", primary_key: "Vendor_PKEY", name: "Classes_Certs_ibfk_1"
  add_foreign_key "Classes_Certs_Join_Req", "Classes_Certs", column: "FK_Classes_Certs_PKEY", primary_key: "Classes_Certs_PKEY", name: "Classes_Certs_Join_Req_ibfk_1"
  add_foreign_key "Classes_Certs_Join_Req", "Employees_List_Title", column: "FK_Employees_List_Title_PKEY", primary_key: "Employees_List_Title_PKEY", name: "Classes_Certs_Join_Req_ibfk_2"
  add_foreign_key "ConstTracker", "Project", column: "FK_Project_PKEY", primary_key: "Project_PKEY", name: "ConstTracker2Project", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Deliveries", "qSalesOrders", column: "FK_qSalesOrders_PKEY", primary_key: "qSalesOrders_PKEY", name: "Deliveries_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DeliveryItems", "Deliveries", column: "FK_Deliveries_PKEY", primary_key: "Deliveries_PKEY", name: "DeliveryItems_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DeliveryItems", "qSalesOrdersTracker", column: "FK_qSalesOrdersTracker_PKEY", primary_key: "qSalesOrdersTracker_PKEY", name: "DeliveryItems_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "EmployeeSupervisors", "Employees", column: "FK_Employees_PKEY_DirectReport", primary_key: "Employees_PKEY", name: "EmployeeSupervisors_ibfk_2"
  add_foreign_key "EmployeeSupervisors", "Employees", column: "FK_Employees_PKEY_Supervisor", primary_key: "Employees_PKEY", name: "EmployeeSupervisors_ibfk_1"
  add_foreign_key "Employees", "Employees", column: "FK_Supervisor_PKEY", primary_key: "Employees_PKEY", name: "Employees_ibfk_2"
  add_foreign_key "Employees", "Employees_List_Title", column: "Emp_Title", primary_key: "Employees_List_Title_PKEY", name: "Employees_ibfk_1"
  add_foreign_key "Jobs", "Customers", column: "FK_Customers_PKEY", primary_key: "Customers_PKEY", name: "Jobs_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Review", "Employees", column: "FK_Employees_PKEY", primary_key: "Employees_PKEY", name: "Review_ibfk_1"
  add_foreign_key "Review", "Employees", column: "FK_Sup_Employees_PKEY", primary_key: "Employees_PKEY", name: "Review_ibfk_2"
  add_foreign_key "Review", "Employees_List_Title", column: "FK_Employees_List_Title_PKEY", primary_key: "Employees_List_Title_PKEY", name: "Review_ibfk_3"
  add_foreign_key "Review_Answers", "Review", column: "FK_Review_PKEY", primary_key: "Review_PKEY", name: "Review_Answers_ibfk_1"
  add_foreign_key "Review_Answers", "Review_Questions", column: "FK_Review_Questions_PKEY", primary_key: "Review_Questions_PKEY", name: "Review_Answers_ibfk_2"
  add_foreign_key "Review_Questions", "Review_Categories", column: "FK_Review_Categories_PKEY", primary_key: "Review_Categories_PKEY", name: "Review_Questions_ibfk_1"
  add_foreign_key "Review_Questions_Join_Titles", "Employees_List_Title", column: "FK_Employees_List_Title_PKEY", primary_key: "Employees_List_Title_PKEY", name: "Review_Questions_Join_Titles_ibfk_2"
  add_foreign_key "Review_Questions_Join_Titles", "Review_Questions", column: "FK_Review_Questions_PKEY", primary_key: "Review_Questions_PKEY", name: "Review_Questions_Join_Titles_ibfk_1"
  add_foreign_key "Skill_Assessment_Answers", "Employees", column: "FK_Employees_PKEY", primary_key: "Employees_PKEY", name: "Skill_Assessment_Answers_ibfk_1"
  add_foreign_key "Skill_Assessment_Answers", "Employees", column: "FK_Sup_Employees_PKEY", primary_key: "Employees_PKEY", name: "Skill_Assessment_Answers_ibfk_2"
  add_foreign_key "Skill_Assessment_Answers", "Skill_Assessment_Questions", column: "FK_Skill_Assessment_Questions", primary_key: "Skill_Assessment_Questions_PKEY", name: "Skill_Assessment_Answers_ibfk_3"
  add_foreign_key "Skill_Assessment_Cat2", "Skill_Assessment_Cat1", column: "FK_Skill_Assessment_Questions_Cat1", primary_key: "Skill_Assessment_Cat1_PKEY", name: "Skill_Assessment_Cat2_ibfk_1"
  add_foreign_key "Skill_Assessment_Cat3", "Skill_Assessment_Cat2", column: "FK_Skill_Assessment_Questions_Cat2", primary_key: "Skill_Assessment_Cat2_PKEY", name: "Skill_Assessment_Cat3_ibfk_1"
  add_foreign_key "Skill_Assessment_Cat4", "Skill_Assessment_Cat3", column: "FK_Skill_Assessment_Questions_Cat3", primary_key: "Skill_Assessment_Cat3_PKEY", name: "Skill_Assessment_Cat4_ibfk_1"
  add_foreign_key "Skill_Assessment_Questions", "Skill_Assessment_Cat1", column: "FK_Skill_Assessment_Questions_Cat1", primary_key: "Skill_Assessment_Cat1_PKEY", name: "Skill_Assessment_Questions_ibfk_1"
  add_foreign_key "Skill_Assessment_Questions", "Skill_Assessment_Cat2", column: "FK_Skill_Assessment_Questions_Cat2", primary_key: "Skill_Assessment_Cat2_PKEY", name: "Skill_Assessment_Questions_ibfk_2"
  add_foreign_key "Skill_Assessment_Questions", "Skill_Assessment_Cat3", column: "FK_Skill_Assessment_Questions_Cat3", primary_key: "Skill_Assessment_Cat3_PKEY", name: "Skill_Assessment_Questions_ibfk_4"
  add_foreign_key "Skill_Assessment_Questions", "Skill_Assessment_Cat4", column: "FK_Skill_Assessment_Questions_Cat4", primary_key: "Skill_Assessment_Cat4_PKEY", name: "Skill_Assessment_Questions_ibfk_5"
  add_foreign_key "Skill_Assessment_Questions", "Skill_Assessment_Types", column: "Skill_Assessment_Questions_Type", primary_key: "Skill_Assessment_Types_PKEY", name: "Skill_Assessment_Questions_ibfk_3"
  add_foreign_key "Skill_Assessment_Ranges", "Employees_List_Title", column: "FK_Employee_List_Title_PKEY", primary_key: "Employees_List_Title_PKEY", name: "Skill_Assessment_Ranges_ibfk_1"
  add_foreign_key "Skill_Assessment_Ranges", "Skill_Assessment_Cat1", column: "FK_Skill_Assessment_Cat1_PKEY", primary_key: "Skill_Assessment_Cat1_PKEY", name: "Skill_Assessment_Ranges_ibfk_2"
  add_foreign_key "Skill_Assessment_Ranges", "Skill_Assessment_Types", column: "FK_Skill_Assessment_Types_PKEY", primary_key: "Skill_Assessment_Types_PKEY", name: "Skill_Assessment_Ranges_ibfk_3"
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
QBWC.clear_jobs
QBWC.add_job(:list_customers, true, '', ListCustomerWorker)
QBWC.add_job(:list_estimates, true, '', ListEstimateWorker)
QBWC.add_job(:list_estimate_lines, true, '', ListEstimateLineWorker)

# 10.times{Fabricate(:customer)}

# Customer.create([{:parent_id => nil, :id => '80000001-1476811056', :name=>'DaddyCo', :full_name => 'DaddyCo', :sublevel => 0}, {:parent_id => '80000001-1476811056', :id => '80000003-1476811094', :name=>'SonJob', :full_name => 'DaddyCo:SonJob', :sublevel => 1}, {:parent_id => '80000001-1476811056', :id => '38215932-98221588', :name=>'Retail', :full_name => 'DaddyCo:Retail', :sublevel => 1}, {:parent_id => '80000001-1476811056', :id => '86519908-87618138', :name=>'Maintenance', :full_name => 'DaddyCo:Maintenance', :sublevel => 1}, {:parent_id => '80000001-1476811056', :id => '43224566-18017411', :name=>'Construction', :full_name => 'DaddyCo:Construction', :sublevel => 1}, {:parent_id => '80000003-1476811094', :id => '88318013-31118900', :name=>'Building 420', :full_name => 'DaddyCo:Construction:Bldg420', :sublevel => 2}, {:parent_id => '80000003-1476811094', :id => '19138381-86703134', :name => 'RingerRoom', :is_active => false, :full_name => 'DaddyCo:Construction:RingerRoom', :sublevel => 2}, {:parent_id => '80000003-1476811094', :id => '78613371-67916334', :name => 'RomperRoom', :full_name => 'DaddyCo:Construction:RomperRoom', :sublevel => 2}, {:parent_id => '78613371-67916334', :id => '85326874-09532479', :name => 'Trampolines', :full_name => 'DaddyCo:Construction:RomperRoom:Trampolines', :sublevel => 3}, {:parent_id => '85326874-09532479', :id => '93130380-33992129', :name => 'P-903', :full_name => 'DaddyCo:Construction:RomperRoom:Trampolines:P-903', :sublevel => 4}, {:parent_id => '85326874-09532479', :id => '22427418-13878013', :name => 'P-9091', :full_name => 'DaddyCo:Construction:RomperRoom:Trampolines:P-9091', :sublevel => 4}, {:id => '80000002-1476811077', :parent_id => nil, :name=>'MommyCo', :full_name => 'MommyCo', :sublevel => 0}, {:id => '90700004-9322986111', :parent_id => '80000002-1476811077', :name=>'StepaughterJob', :full_name => 'MommyCo:StepaughterJob', :sublevel => 1}, {:id => '80000004-1476811115', :parent_id => '80000002-1476811077', :name=>'DaughterJob', :full_name => 'MommyCo:DaughterJob', :sublevel => 1}, {:id => '401161407-800518010', :parent_id => '80000004-1476811115', :name=>'GranddaughterJob', :full_name => 'MommyCo:DaughterJob:GranddaughterJob', :sublevel => 2}, {:id => '011010485-401180067', :parent_id => '401161407-800518010', :name=>'P-1592', :full_name => 'MommyCo:DaughterJob:GranddaughterJob:P-1592', :sublevel => 3}])

  # rails g scaffold_controller Customer id:string time_created:datetime time_modified:datetime edit_sequence:string name:string full_name:string is_active:boolean class_id:string parent_id:string sublevel:integer company_name:string salutation:string first_name:string middle_name:string last_name:string job_title:string bill_address_addr1:string bill_address_addr2:string bill_address_addr3:string bill_address_addr4:string bill_address_addr5:string bill_address_city:string bill_address_state:string bill_address_postal_code:string bill_address_country:string bill_address_note:string ship_address_addr1:string ship_address_addr2:string ship_address_addr3:string ship_address_addr4:string ship_address_addr5:string ship_address_city:string ship_address_state:string ship_address_postal_code:string ship_address_country:string ship_address_note:string phone:string alt_phone:string fax:string email:string cc:string contact:string alt_contact:string additional_contact_ref_contact_name:string additional_contact_ref_contact_value:string contacts_id:string customer_type_id:string terms_id:string sales_rep_id:string balance:decimal total_balance:decimal sales_tax_code_id:string item_sales_tax_id:string resale_number:string account_number:string credit_limit:decimal preferred_payment_method_id:string credit_card_info_credit_card_number:string credit_card_info_expiration_month:integer credit_card_info_expiration_year:integer credit_card_info_name_on_card:string credit_card_info_credit_card_address:string credit_card_info_credit_card_postal_code:string job_status:string job_start_date:date job_projected_end_date:date job_end_date:date job_desc:string job_type_id:string notes:text additional_notes_ret_note_id:string preferred_delivery_method:string price_level_id:string external_guid:string currency_id:string data_ext_ret_owner_id:string

# rails g scaffold_controller Estimate id:string time_created:datetime time_modified:datetime edit_sequence:string txn_number:integer customer_id:string class_id:string template_id:string txn_date:date ref_number:string bill_address_addr1:string bill_address_addr2:string bill_address_addr3:string bill_address_addr4:string bill_address_addr5:string bill_address_city:string bill_address_state:string bill_address_postal_code:string bill_address_country:string bill_address_note:string ship_address_addr1:string ship_address_addr2:string ship_address_addr3:string ship_address_addr4:string ship_address_addr5:string ship_address_city:string ship_address_state:string ship_address_postal_code:string ship_address_country:string ship_address_note:string is_active:boolean po_number:string terms_id:string due_date:date sales_rep_id:string fob:string subtotal:decimal item_sales_tax_id:string sales_tax_percentage:float sales_tax_total:decimal total_amount:decimal currency_id:string exchange_rate:float total_amount_in_home_currency:decimal memo:text customer_msg_id:string is_to_be_emailed:boolean customer_sales_tax_code_id:string other:string external_guid:string linked_txn_id:string created_at:datetime

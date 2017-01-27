# Don't seed anything in production! Leave the data there alone!
unless Rails.env.production?
 connection = ActiveRecord::Base.connection
 # load data from data file if it exists
  if File.exists?('db/data/data.sql')
    sql = File.read('db/data/data.sql')
    statements = sql.split(/;$/)
    statements.pop
    ActiveRecord::Base.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end
  end
  User.create([{id: 1, email: 'nklerk@alopias.com', username: 'nklerk', password: 'password'}])

 # clear quickbooks jobs
  QBWC.clear_jobs
  QBWC.add_job(:list_customers, true, '', ListCustomerWorker)
  QBWC.add_job(:list_estimates, true, '', ListEstimateWorker)
  QBWC.add_job(:list_sales_orders, true, '', ListSalesOrderWorker)
  QBWC.add_job(:list_purchase_orders, true, '', ListPurchaseOrderWorker)
  QBWC.add_job(:list_invoices, true, '', ListInvoiceWorker)
end
  # connection.tables.each do |table|
  #   connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
  # end



# 10.times{Fabricate(:customer)}

# Customer.create([{:parent_id => nil, :id => '80000001-1476811056', :name=>'DaddyCo', :full_name => 'DaddyCo', :sublevel => 0}, {:parent_id => '80000001-1476811056', :id => '80000003-1476811094', :name=>'SonJob', :full_name => 'DaddyCo:SonJob', :sublevel => 1}, {:parent_id => '80000001-1476811056', :id => '38215932-98221588', :name=>'Retail', :full_name => 'DaddyCo:Retail', :sublevel => 1}, {:parent_id => '80000001-1476811056', :id => '86519908-87618138', :name=>'Maintenance', :full_name => 'DaddyCo:Maintenance', :sublevel => 1}, {:parent_id => '80000001-1476811056', :id => '43224566-18017411', :name=>'Construction', :full_name => 'DaddyCo:Construction', :sublevel => 1}, {:parent_id => '80000003-1476811094', :id => '88318013-31118900', :name=>'Building 420', :full_name => 'DaddyCo:Construction:Bldg420', :sublevel => 2}, {:parent_id => '80000003-1476811094', :id => '19138381-86703134', :name => 'RingerRoom', :is_active => false, :full_name => 'DaddyCo:Construction:RingerRoom', :sublevel => 2}, {:parent_id => '80000003-1476811094', :id => '78613371-67916334', :name => 'RomperRoom', :full_name => 'DaddyCo:Construction:RomperRoom', :sublevel => 2}, {:parent_id => '78613371-67916334', :id => '85326874-09532479', :name => 'Trampolines', :full_name => 'DaddyCo:Construction:RomperRoom:Trampolines', :sublevel => 3}, {:parent_id => '85326874-09532479', :id => '93130380-33992129', :name => 'P-903', :full_name => 'DaddyCo:Construction:RomperRoom:Trampolines:P-903', :sublevel => 4}, {:parent_id => '85326874-09532479', :id => '22427418-13878013', :name => 'P-9091', :full_name => 'DaddyCo:Construction:RomperRoom:Trampolines:P-9091', :sublevel => 4}, {:id => '80000002-1476811077', :parent_id => nil, :name=>'MommyCo', :full_name => 'MommyCo', :sublevel => 0}, {:id => '90700004-9322986111', :parent_id => '80000002-1476811077', :name=>'StepaughterJob', :full_name => 'MommyCo:StepaughterJob', :sublevel => 1}, {:id => '80000004-1476811115', :parent_id => '80000002-1476811077', :name=>'DaughterJob', :full_name => 'MommyCo:DaughterJob', :sublevel => 1}, {:id => '401161407-800518010', :parent_id => '80000004-1476811115', :name=>'GranddaughterJob', :full_name => 'MommyCo:DaughterJob:GranddaughterJob', :sublevel => 2}, {:id => '011010485-401180067', :parent_id => '401161407-800518010', :name=>'P-1592', :full_name => 'MommyCo:DaughterJob:GranddaughterJob:P-1592', :sublevel => 3}])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
QBWC.clear_jobs
QBWC.add_job(:list_customers, true, '', ListCustomerWorker)
10.times{Fabricate(:customer)}

Customer.create([{:id => '80000001-1476811056', :parent_id => nil, :name=>'DaddyCo', :full_name => 'DaddyCo', :sublevel => 0}, {:id => '80000003-1476811094', :parent_id => '80000001-1476811056', :name=>'SonJob', :full_name => 'DaddyCo:SonJob', :sublevel => 1}, {:id => '80000002-1476811077', :parent_id => nil, :name=>'MommyCo', :full_name => 'MommyCo', :sublevel => 0},{:id => '80000004-1476811115', :parent_id => '80000002-1476811077', :name=>'DaughterJob', :full_name => 'MommyCo:DaughterJob', :sublevel => 1}, {:id => '90700004-9322986111', :parent_id => '80000002-1476811077', :name=>'StepaughterJob', :full_name => 'MommyCo:StepaughterJob', :sublevel => 1}, {:id => '401161407-800518010', :parent_id => '80000004-1476811115', :name=>'GranddaughterJob', :full_name => 'MommyCo:DaughterJob:GranddaughterJob', :sublevel => 2},{:id => '011010485-401180067', :parent_id => '401161407-800518010', :name=>'P-1592', :full_name => 'MommyCo:DaughterJob:GranddaughterJob:P-1592', :sublevel => 3}])
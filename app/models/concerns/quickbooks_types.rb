module QuickbooksTypes
	extend ActiveSupport::Concern
	included do
		
		# Given an ugly quickbooks hash (see test/fixutes/client_hash.rb),  we want to pull out ONLY the "data_ext_value" where the data_ext_name == "Site Contact"
		SITE_CONTACT_CAST = Proc.new{|data|
			if data.pluck("data_ext_name").include?("Site Contact")
				data.find_all {|x| x['data_ext_name'] == 'Site Contact'}.pluck("data_ext_value")[0]
			end
		}
		
		# Given an ugly quickbooks hash (see test/fixutes/client_hash.rb),  we want to pull out ONLY the "data_ext_value" where the data_ext_name == "Site Phone"
		SITE_PHONE_CAST = Proc.new{|data|
			if data.pluck("data_ext_name").include?("Site Phone")
				data.find_all {|x| x['data_ext_name'] == 'Site Phone'}.pluck("data_ext_value")[0]
			end
		}
		
		# Given an ugly quickbooks hash (see test/fixutes/client_hash.rb),  we want to pull out ONLY the "data_ext_value" where the data_ext_name == "Site Email"
		SITE_EMAIL_CAST = Proc.new{|data|
			if data.pluck("data_ext_name").include?("Site Email")
				data.find_all {|x| x['data_ext_name'] == 'Site Email'}.pluck("data_ext_value")[0]
			end
		}
		
		# Given an ugly quickbooks hash (see test/fixutes/client_hash.rb),  we want to pull out ONLY the "contact_value" where "contact_name" == "Mobile"
		MOBILE_CAST = Proc.new{|data|
			if data.pluck("contact_name").include?("Mobile")
				data.find_all {|e| e['contact_name'] == 'Mobile'}.pluck("contact_value")[0]
			end
		}
		
		# Return "X" if false (not active)
		INACTIVE_FLAG_CAST = Proc.new{|data|
			"X" unless data
		}
		
		
		# TODO: Put this somewhere
		def self.qb_id
			case self.name
			when "Client", "Job", "Project", "Vendor", "Employee", "QbEmployee", "QbCustomer"
				"list_id"
			when "Estimate", "Invoice", "PurchaseOrder", "ReceivePayment", "SalesOrder", "TimeTracking"
				"txn_id"
			when "EstimateLine", "InvoiceLine", "PurchaseOrderLine", "SalesOrderLine"
				"txn_line_id"
			end
		end

	end

	end
	
	

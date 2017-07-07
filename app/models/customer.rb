class Customer < ApplicationRecord
	self.abstract_class = true
	
	def self.customer_type(key)
		if key.match(/P-\d+$/)
			"Project"
		elsif key.match(/:/)
			"Job"
		else "Client"
		end
	end
	
	def self.parse_customer_response(qb)
		klass = self.customer_type(qb['full_name'])
		unless qb.has_key?('data_ext_ret')
			qb.merge!('data_ext_ret' => [{"data_ext_name" => "Site Contact", "data_ext_value" => nil},{"data_ext_name"=>"Site Email", "data_ext_value"=>nil},{"data_ext_name"=>"Site Phone", "data_ext_value"=>nil}])
		end
		klass.constantize.parse_qb_response(qb)
	end
end
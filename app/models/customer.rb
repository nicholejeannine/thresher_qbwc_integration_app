class Customer < ApplicationRecord
	self.abstract_class = true
	
	def self.parse_customer_response(qb)
		unless qb.has_key?('data_ext_ret')
			qb.merge!("data_ext_ret" => [{"data_ext_name" => "Site Contact", "data_ext_value" => ""}, {"data_ext_name" => "Site Email", "data_ext_value" => ""}, {"data_ext_name" => "Site Phone", "data_ext_value" => ""}])
		end
		if qb['sublevel'] == 0 && !qb['name'].upcase.start_with?('P-')
			Client.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && !qb['name'].upcase.start_with?('P-')
			Job.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && qb['name'].upcase.start_with?('P-')
			Project.new_project(qb)
		end
	end
end
class Customer < ApplicationRecord
	self.abstract_class = true
	def self.parse_customer_response(qb)
		unless qb.has_key?('data_ext_ret')
			qb.merge!('data_ext_ret' => nil)
		end
		if qb['sublevel'] == 0 && !qb['name'].upcase.start_with?('P-')
			Client.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && !qb['name'].upcase.start_with?('P-')
			Job.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && qb['name'].upcase.start_with?('P-')
			Project.parse_qb_response(qb)
		end
	end
end
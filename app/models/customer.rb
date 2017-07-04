class Customer < ApplicationRecord
	self.abstract_class = true
	
	def self.parse_customer_response(qb)
		if qb['sublevel'] == 0 && !qb['name'].upcase.start_with?('P-')
			Client.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && !qb['name'].upcase.start_with?('P-')
			Job.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && qb['name'].upcase.start_with?('P-')
			Project.parse_project(qb)
		end
	end
end
class Customer < ApplicationRecord
	self.abstract_class = true

  # TODO: privatize
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
		klass.constantize.parse_qb_response(qb)
	end
end
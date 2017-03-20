class Customer < ApplicationRecord

		self.abstract_class = true
		def self.parse_qb_response(qb)
			klass = customer_type(qb['name'], qb['sublevel'])
			c = klass.find_or_initialize_by(:id => qb['list_id'])
			c.save
		end
		
		def self.customer_type(name, sublevel)
			sublevel == 0 ? Client : Job
		end
end


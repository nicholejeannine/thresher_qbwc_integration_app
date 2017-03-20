class Customer < ApplicationRecord
		self.abstract_class = true
		def self.parse_customer(qb)
			klass = qb_customer_type(qb['name'], qb['sublevel'])
			id = qb['list_id']
			c = klass.find_or_initialize_by(:id => id)
			c.parse_hash(qb)
			c.save
		end
		
		def self.qb_customer_type(name, sublevel)
			sublevel == 0 ? Client : Job
		end
end


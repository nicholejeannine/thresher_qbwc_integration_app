class Customer < ApplicationRecord
		self.abstract_class = true
		def self.parse_customer(qb)
			klass = qb_customer_type(qb['name'], qb['sublevel'])
			id = qb['list_id']
			c = klass.find_or_initialize_by(:id => id)
			if (klass == Project)
				c.send("FK_Project_PKEY=", c.name.from(2))
			end
			c.parse_hash(qb)
			c.save
		end
		
		def self.qb_customer_type(name, sublevel)
			sublevel == 0 ? Client : (name.downcase.start_with?('p-') ? Project : Job)
		end
end


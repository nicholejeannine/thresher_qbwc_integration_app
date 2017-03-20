class Customer < ApplicationRecord
	include QuickbooksQueryable
		self.abstract_class = true
		def self.parse_qb_response(qb)
			klass = table_name(qb['name'], qb['sublevel'])
			c = klass.find_or_initialize_by(:id => qb['list_id'])
			c.parse_qb_hash(qb)
			c.save
		end
		
		def self.table_name(name, sublevel)
			sublevel == 0 ? Client : Job
		end
end


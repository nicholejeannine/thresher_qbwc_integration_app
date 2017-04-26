class Customer < ApplicationRecord
	self.table_name = 'clients'
	include QuickbooksQueryable
end


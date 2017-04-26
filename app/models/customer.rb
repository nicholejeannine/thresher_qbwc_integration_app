class Customer < ApplicationRecord
	self.table_name = 'clients'
	self.primary_key = 'id' #??
	include QuickbooksQueryable
end


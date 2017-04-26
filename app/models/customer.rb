class Customer < ApplicationRecord
	self.table_name = 'clients'
	self.primary_key = 'Customers_PKEY'
	include QuickbooksQueryable
end


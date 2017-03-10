module QuickbooksModel
	extend ActiveSupport::Concern
	included do
		# Since the id column is the qb-generated string, make sure it's still treated as a primary key in the DB.
		self.primary_key = :id
	end

	# Is the xml fragment a quickbooks address type that we care about? (we don't care about ship_to_address)
	def address?(key)
		key.match /ship_address$|vendor_address$|bill_address$|block$/
	end

	# Is the xml fragment an "extended address" (with city, state, postal code, etc? Address "blocks" are not extended addresses - they have just "addr1" through "addr5")
	def extended_address?(key)
		key.match /address$/
	end

	# Is the xml fragment a "reference type"? (A reference type has additional key/value pairs that need to be processed separately)
	def ref_type?(key)
		key.match(/_ref$/)
	end

	# Is the xml fragment a "custom type"? (In Quickbooks a custom type has the key "data_ext_ret")
	def custom_type?(key)
		key.match(/data_ext_ret/)
	end

	# Is the xml fragment part of a "line item?"
	def line_item_type?(key)
		key.match(/_line_ret/)
	end

	# Handle each piece of an address
	def handle_address(key, value)
		self.send("#{key}_addr1=", value['addr1']) if self.respond_to?("#{key}_addr1=")
		self.send("#{key}_addr2=", value['addr2']) if self.respond_to?("#{key}_addr2=")
		self.send("#{key}_addr3=", value['addr3']) if self.respond_to?("#{key}_addr3=")
		self.send("#{key}_addr4=", value['addr4']) if self.respond_to?("#{key}_addr4=")
		self.send("#{key}_addr5=", value['addr5']) if self.respond_to?("#{key}_addr5=")
		# If this is an extended address we need to also save city, state, etc
		if extended_address?(key)
			self.send("#{key}_city=", value['city']) if self.respond_to?("#{key}_city=")
			self.send("#{key}_state=", value['state']) if self.respond_to?("#{key}_state=")
			self.send("#{key}_postal_code=", value['postal_code']) if self.respond_to?("#{key}_postal_code=")
			self.send("#{key}_country=", value['country'])if self.respond_to?("#{key}_country=")
			self.send("#{key}_note=", value['note']) if self.respond_to?("#{key}_note=")
		end
	end

	# Handle reference types - save the "list_id" and "full_name" values, only if those fields are in the DB
	def handle_ref_type(key, value)
		name = key.remove(/_ref$/)
		self.send("#{name}_id=", value['list_id']) if self.respond_to?("#{name}_id=")
		self.send("#{name}_full_name=", value['full_name']) if self.respond_to?("#{name}_full_name=")
	end

	# Customer objects have custom fields - this method parses the value returned for this part of a qb hash
	def handle_custom_type(value)
		value.to_a.each do |arr|
			if self.respond_to?("primary_contact=") && arr['data_ext_name'] == 'Site Contact'
				self.send("primary_contact=", "#{arr['data_ext_value']}")
			elsif self.respond_to?("primary_email=") && arr['data_ext_name'] == 'Site Email'
				self.send("primary_email=", "#{arr['data_ext_value']}")
			elsif self.respond_to?("primary_phone=") && arr['data_ext_name'] == 'Site Phone'
				self.send("primary_phone=", "#{arr['data_ext_value']}")
			end
		end
	end
end
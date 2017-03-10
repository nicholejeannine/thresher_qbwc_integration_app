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
		persist("#{key}_addr1=", value['addr1'])
		persist("#{key}_addr2=", value['addr2'])
		persist("#{key}_addr3=", value['addr3'])
		persist("#{key}_addr4=", value['addr4'])
		persist("#{key}_addr5=", value['addr5'])
		# If this is an extended address we need to also save city, state, etc
		if extended_address?(key)
			persist("#{key}_city=", value['city'])
			persist("#{key}_state=", value['state'])
			persist("#{key}_postal_code=", value['postal_code'])
			persist("#{key}_country=", value['country'])
			persist("#{key}_note=", value['note'])
		end
	end

	# Handle reference types - save the "list_id" and "full_name" values, only if those fields are in the DB
	def handle_ref_type(key, value)
		name = key.remove(/_ref$/)
		persist("#{name}_id=", value['list_id'])
		persist("#{name}_full_name=", value['full_name'])
	end

	# Customer objects have custom fields - this method parses the value returned for this part of a qb hash
	def handle_custom_type(value)
		value.to_a.each do |arr|
			data = arr['data_ext_value']
			persist("primary_contact", "#{data}") if arr['data_ext_name'] == 'Site Contact'
			persist("primary_email", "#{data}") if arr['data_ext_name'] == 'Site Email'
			persist("primary_phone", "#{data}") if arr['data_ext_name'] == 'Site Phone'
		end
	end

	def persist(key, value)
		self.send("#{key}=", value) if self.respond_to?("#{key}=")
	end
end

module QuickbooksTypes
	extend ActiveSupport::Concern
	include QuickbooksLineItemUtils
	# Is the xml fragment a quickbooks address type that we care about? (we don't care about ship_to_address)
	def address?(key)
		key.match(/ship_address$|vendor_address$|bill_address$/)
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

	# Keys we never care about handling
	def ignored_type?(key)
		key.match(/class_ref$|contact_ref$|contacts_ret$|card_info$|currency_ref$|ship_to_address$|block$|xml_attributes/)
	end

end

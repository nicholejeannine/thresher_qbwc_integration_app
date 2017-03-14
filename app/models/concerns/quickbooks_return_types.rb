module QuickbooksReturnTypes
	extend ActiveSupport::Concern
	# Keys we never care about handling
	IGNORED_TYPES = [
				'class_ref', 'ship_to_address', 'print_as', 'pager', 'additional_contact_ref', 'contacts_ret' 'credit_limit', 'credit_card_info', 'additional_notes_ret', 'is_statement_with_parent', 'external_guid','tax_registration_number', 'currency_ref'
	]
	# Is the xml fragment a quickbooks address type that we care about? (we don't care about ship_to_address)
	def address?(key)
		key.match(/ship_address$|vendor_address$|bill_address$|block$/)
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

end

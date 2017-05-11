module QuickbooksTypes
	extend ActiveSupport::Concern
	include QuickbooksLineItemUtils
	# Is the xml fragment a quickbooks address type that we care about? (we don't care about ship_to_address)
	def address?(key)
		key.match(/ship_address$|vendor_address$|bill_address$/)
	end
	
	def name_type(key)
		if key.match(/P-\d+$/)
			"Project"
		elsif key.match(/:/)
			"Job"
		else "Client"
		end
	end
	
	def link_type?(key)
		key.match(/linked_txn/)
	end
	
	def custom_type?(key)
		key.match(/data_ext_ret/)
	end

# Is the xml fragment a "reference type"? (A reference type has additional key/value pairs that need to be processed separately)
	def ref_type?(key)
		key.match(/_ref$/)
	end

# Is the xml fragment part of a "line item?"
	def line_item_type?(key)
		key.match(/_line_ret/)
	end

	# Keys we never care about handling
	# TODO: add class_ref, price stuff, etc
	def ignored_type?(key)
		key.match(/group_ret$|class_ref$|list_id$|txn_line_id$|txn_id$|^other|contact_ref$|contacts_ret$|card_info$|currency_ref$|ship_to_address$|block$|xml_attributes|notes_ret/)
	end

end

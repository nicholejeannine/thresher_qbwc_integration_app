module QuickbooksTypes
	extend ActiveSupport::Concern
	include QuickbooksLineItemUtils
	
	ADDRESS_REF = %w(ship_address vendor_address bill_address)
	
	PARSE_ADDRESS = Proc.new{|address_hash, prefix|address_hash.keep_if{|key|key.in?(ADDRESS_KEYS)}.transform_keys!{|k|"#{prefix}_#{k}"}}
	
	def is_address?(key)
		key.in?(ADDRESS_TYPES)
	end
	
	
	
	
	
	def name_type(key)
		if key.match(/P-\d+$/)
			"Project"
		elsif key.match(/:/)
			"Job"
		else "Client"
		end
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
		key.match(/card_txn_info|prefill_account_ref|external_guid|group_ret$|class_ref$|txn_line_id$|^other|contact_ref$|contacts_ret$|card_info$|currency_ref$|ship_to_address$|block$|xml_attributes|notes_ret|currency$|exchange_rate/)
	end
	
	def linked_txn?(key)
		key.match(/linked_txn|applied_to_txn_ret/)
	end

end

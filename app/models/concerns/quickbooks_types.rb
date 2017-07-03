module QuickbooksTypes
	extend ActiveSupport::Concern
	include QuickbooksLineItemUtils
	
	ADDRESS_TYPES = %w(ship_address bill_address vendor_address)
	
	ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)
	
	REF_TYPES = %w(customer_type_ref terms_ref sales_rep_ref sales_tax_code_ref item_sales_tax_code_ref job_type_ref)
	
	PARSE_ADDRESS = lambda{|address_hash, prefix|address_hash.keep_if{|key|key.in?(ADDRESS_KEYS)}.transform_keys!{|k|"#{prefix}_#{k}"}}
	
	PARSE_REF = lambda{|ref_hash|ref_hash.transform_keys!{|k|k.remove("_ref")}.transform_values!{|v|v["full_name"]}}
	
	PARSE_CUSTOM = lambda{|data|data&.map{|hash|{hash['data_ext_name'] => hash['data_ext_value']}}&.map{|h|h.transform_keys{|k|k.remove(" ").underscore}}}
	
	
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

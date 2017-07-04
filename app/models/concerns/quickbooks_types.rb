module QuickbooksTypes
	extend ActiveSupport::Concern
	include QuickbooksLineItemUtils
	included do
	def self.parse_addresses(hash)
		addresses = hash.extract!(*ADDRESS_TYPES)
		addresses.map{|key, value|
			name = key.to_s.remove(/_address/)
			PARSE_ADDRESS.call(value,name)
		}
	end
		
		def self.parse_refs(hash)
			refs = hash.extract!(*REF_TYPES)
			refs.map{|key,value|
			  {"#{key.to_s.remove(/_ref$/)}" => value['full_name']}
			}
		end
	end
	ADDRESS_TYPES = %w(ship_address bill_address vendor_address)
	
	ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)
	
	REF_TYPES = %w(customer_type_ref terms_ref sales_rep_ref sales_tax_code_ref item_sales_tax_ref job_type_ref)
	
	CUSTOMER_REF_TYPES = %w(customer_ref parent_ref)
	
	VENDOR_REF_TYPES = %w(vendor_ref)
	
	LINKED_TXN_TYPES = %w(linked_txn applied_to_txn_ret)
	
	LINE_ITEM_TYPES = %w(estimate_line_ret invoice_line_ret purchase_order_line_ret sales_order_line_ret)
	
	PARSE_ADDRESS = lambda{|address_hash, prefix|address_hash&.select!{|key|key.in?(ADDRESS_KEYS)}&.transform_keys!{|k|"#{prefix}_#{k}"}}
	
	PARSE_REF = lambda{|ref_hash|ref_hash.transform_keys!{|k|k.remove("_ref")}.transform_values!{|v|v["full_name"]}}
	
	PARSE_CUSTOM = lambda{|data|data&.map{|hash|{hash['data_ext_name'] => hash['data_ext_value']}}&.map{|h|h.transform_keys{|k|k.remove(" ").underscore}}}
	
	
	
	def name_type(key)
		if key.match(/P-\d+$/)
			"Project"
		elsif key.match(/:/)
			"Job"
		else "Client"
		end
	end


	# Keys we never care about handling
	# TODO: add class_ref, price stuff, etc
	def ignored_type?(key)
		key.match(/card_txn_info|prefill_account_ref|external_guid|group_ret$|class_ref$|txn_line_id$|^other|contact_ref$|contacts_ret$|card_info$|currency_ref$|ship_to_address$|block$|xml_attributes|notes_ret|currency$|exchange_rate/)
	end
	
end

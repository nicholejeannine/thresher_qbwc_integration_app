module QuickbooksTypes
	extend ActiveSupport::Concern
	include QuickbooksLineItemUtils
	included do
		
		def self.lookup_parent(hash, sublevel)
			list_id = hash["parent_ref"]["list_id"]
			klass = (sublevel == 1 ? Client : Job)
			id = klass.find_by("list_id" => list_id).id
			{"parent_id" => id}
		end
		
		def self.parse_addresses(hash)
			addresses = hash.extract!(*ADDRESS_TYPES)
			addresses.map{|key, value|
				name = key.to_s.remove(/_address/)
				value.select!{|k|k.in?(ADDRESS_KEYS)}&.transform_keys!{|k|"#{name}_#{k}"}}
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
	
	PARSE_CUSTOM = lambda{|data|data&.map{|hash|{hash['data_ext_name'] => hash['data_ext_value']}}&.map{|h|h.transform_keys{|k|k.remove(" ").underscore}}}
	
	
end

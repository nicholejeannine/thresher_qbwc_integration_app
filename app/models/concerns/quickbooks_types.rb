module QuickbooksTypes
	extend ActiveSupport::Concern
	included do
		def self.qb_id
			case self.name
			when "Client", "Job", "Project", "Vendor"
				"list_id"
			when "Estimate", "Invoice", "PurchaseOrder", "ReceivePayment", "SalesOrder"
				"txn_id"
			when "EstimateLine", "InvoiceLine", "PurchaseOrderLine", "SalesOrderLine"
				"txn_line_id"
				else "id"
			end
		end
	end
	
	
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
		
		def custom_type?(key)
			key.match(/data_ext_ret/)
		end
		
		# Is the xml fragment a "reference type"? (A reference type has additional key/value pairs that need to be processed separately)
		def ref_type?(key)
			key.match(/_ref$/)
		end
		
		# Is the xml fragment part of a "line item?"
		def line_item_type?(key)
			key.match(/_line_ret$/)
		end
		
		# Keys we never care about handling
		# TODO: add class_ref, price stuff, etc
		def ignored_type?(key)
			key.match(/card_txn_info|prefill_account_ref|external_guid|group_ret$|class_ref$|^other|contact_ref$|contacts_ret$|card_info$|currency_ref$|ship_to_address$|block$|xml_attributes|notes_ret|currency$|exchange_rate/)
		end
		
		def linked_txn?(key)
			key.match(/linked_txn|applied_to_txn_ret/)
		end
	
	end
	
# 	ADDRESS_TYPES = %w(ship_address bill_address vendor_address)
# 	ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)
# 	REF_TYPES = %w(customer_type_ref terms_ref sales_rep_ref sales_tax_code_ref item_sales_tax_ref job_type_ref template_ref customer_sales_tax_code_ref vendor_type_ref billing_rate_ref vendor_ref inventory_site_ref ship_to_entity_ref ship_method_ref item_ref override_UOM_set_ref inventory_site_location_ref customer_msg ARA_account_ref payment_method_ref deposit_to_account_ref)
# 	LINKED_TXN_TYPES = %w(linked_txn applied_to_txn_ret)
# 	LINE_ITEM_TYPES = %w(estimate_line_ret invoice_line_ret purchase_order_line_ret sales_order_line_ret)
#
# 	included do
# 		def self.lookup_parent(hash, sublevel)
# 			list_id = hash["parent_ref"]["list_id"]
# 			klass = (sublevel == 1 ? Client : Job)
# 			id = klass.find_by("list_id" => list_id)&.id
# 			{"parent_id" => id}
# 		end
#
# 		def self.lookup_customer(hash = nil)
# 			{"customer_id" => hash['customer_ref']['full_name']}
# 		end
#
# 		def self.parse_addresses(hash)
# 			addresses = hash.extract!(*ADDRESS_TYPES)
# 			addresses.map{|key, value|
# 				name = key.to_s.remove(/_address/)
# 				value.select!{|k|k.in?(ADDRESS_KEYS)}&.transform_keys!{|k|"#{name}_#{k}"}}
# 		end
#
# 		def self.parse_refs(hash)
# 			refs = hash.extract!(*REF_TYPES)
# 			refs.map{|key,value|
# 			  {"#{key.to_s.remove(/_ref$/)}" => value['full_name']}
# 			}
# 		end
#
# 		def self.parse_custom(hash)
# 			hash&.map{|data|
# 				{data['data_ext_name'] => data['data_ext_value']}}&.map{|h|h.transform_keys{|k|k.remove(" ").underscore}}
# 		end
#
# 	end
# end

module QuickbooksTypes
	extend ActiveSupport::Concern
	included do
		def self.qb_id
			case self.name
			when "Client", "Job", "Project", "Vendor"
				"list_id"
			when "Estimate", "Invoice", "PurchaseOrder", "ReceivePayment", "SalesOrder", "TimeTracking"
				"txn_id"
			when "EstimateLine", "InvoiceLine", "PurchaseOrderLine", "SalesOrderLine"
				"txn_line_id"
			end
		end

		def self.ignored_type?(key)
			key.match(/addr5$|card_txn_info|prefill_account_ref|external_guid|group_ret$|class_ref$|^other|contact_ref$|contacts_ret$|card_info$|currency_ref$|ship_to_address$|block$|xml_attributes|notes_ret|currency$|exchange_rate|inventory_site_location_ref|^fob$|ar_account_ref$/)
		end

	end

	end
	
	

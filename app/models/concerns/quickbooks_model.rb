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
	   key.match(/class_ref|contact_ref|contacts_ret|card_info|currency_ref|ship_to_address|total_balance/)
	end

	# Handle each piece of an address
	def handle_address(key, value)
		if value && value.is_a?(Qbxml::Hash)
			value.each do |k, v|
				update_attribute("#{key}_#{k}", v)
			end
		end
	end

	# Handle reference types - save the "list_id" and "full_name" values, only if those fields are in the DB
	def handle_ref_type(key, value)
		begin
		  name = key.remove(/_ref$/)
		  update_attribute("#{name}_id", value['list_id'])
		  update_attribute("#{name}_full_name", value['full_name'])
		  rescue Exception => e
			  QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{self.id}", :error_message => "#{e} in persisting #{key}")
		  end
	end

	# Customer objects have custom fields - this method parses the value returned for this part of a qb hash
	def handle_custom_type(value)
		value.to_a.each do |arr|
			if arr['data_ext_name'] == 'Site Contact'
				update_attribute("primary_contact", "#{arr['data_ext_value']}")
			elsif arr['data_ext_name'] == 'Site Email'
				update_attribute("primary_email", "#{arr['data_ext_value']}")
			elsif arr['data_ext_name'] == 'Site Phone'
				update_attribute("primary_phone", "#{arr['data_ext_value']}")
			end
		end
	end

	def update_attribute(column_name, new_value)
		self.send("#{column_name}=", new_value) if self.respond_to?("#{column_name}=")
	end
end

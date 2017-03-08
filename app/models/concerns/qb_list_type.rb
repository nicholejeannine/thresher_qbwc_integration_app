module QbListType
	extend ActiveSupport::Concern
	include QbModelUtils

	# Customer objects have custom fields - this method parses the value returned for this part of a qb hash
	def handle_custom_type(value)
		value.to_a.each do |arr|
			if self.respond_to?("primary_contact=") && arr['data_ext_name'] == 'Site Contact'
				self.send("primary_contact=", "#{arr['data_ext_value']}")
			elsif self.respond_to?("primary_email=") && arr['data_ext_name'] == 'Site Email'
				self.send("primary_email=", "#{arr['data_ext_value']}")
			elsif self.respond_to?("primary_phone=") && arr['data_ext_name'] == 'Site Phone'
				self.send("primary_phone=", "#{arr['data_ext_value']}")
			end
		end
	end

	# Takes a qb hash and deals with each key/value pair according to its contents.
	# This is the method called by CustomerQueryWorker (and other list-type list workers)
	def parse_qb_hash(qb)
		qb.to_hash.each do |key, value|
			if self.respond_to?("#{key}=")
				self.send("#{key}=", "#{value}")
			elsif address?(key)
				handle_address(key, value)
			elsif ref_type?(key)
				handle_ref_type(key, value)
			elsif custom_type?(key)
				handle_custom_type(value)
			end
		end
	end
end
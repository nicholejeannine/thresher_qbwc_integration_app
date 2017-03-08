module QbListType
	extend ActiveSupport::Concern
	include QbModelUtils



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
		end # end qb.to_hash.each do |key, value|
	end
end
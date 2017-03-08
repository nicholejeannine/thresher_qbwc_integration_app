module QbListType
	extend ActiveSupport::Concern
	include QbModelUtils

	def handle_address(key, value)
		self.send("#{key}_addr1=", value['addr1']) if self.respond_to?("#{key}_addr1=")
		self.send("#{key}_addr2=", value['addr2']) if self.respond_to?("#{key}_addr2=")
		self.send("#{key}_addr3=", value['addr3']) if self.respond_to?("#{key}_addr3=")
		self.send("#{key}_addr4=", value['addr4']) if self.respond_to?("#{key}_addr4=")
		self.send("#{key}_addr5=", value['addr5']) if self.respond_to?("#{key}_addr5=")
		# Address blocks don't have city/state/postal)code/country/note
		if extended_address?(key)
			self.send("#{key}_city=", value['city']) if self.respond_to?("#{key}_city=")
			self.send("#{key}_state=", value['state']) if self.respond_to?("#{key}_state=")
			self.send("#{key}_postal_code=", value['postal_code']) if self.respond_to?("#{key}_postal_code=")
			self.send("#{key}_country=", value['country'])if self.respond_to?("#{key}_country=")
			self.send("#{key}_note=", value['note']) if self.respond_to?("#{key}_note=")
		end
	end


	def handle_ref_type(key, value)
		name = key.remove(/_ref$/)
		# Check if the ref type is one of the values we want to save
		self.send("#{name}_id=", value['list_id']) if self.respond_to?("#{name}_id=")
		self.send("#{name}_full_name=", value['full_name']) if self.respond_to?("#{name}_full_name=")
	end

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
module QbModelUtils
	extend ActiveSupport::Concern

	def address?(key)
		key.match /ship_address$|vendor_address$|bill_address$|block$/
	end

	def extended_address?(key)
		key.match /address$/
	end

	def ref_type?(key)
		key.match(/_ref$/)
	end

	def custom_type?(key)
		key.match(/data_ext_ret/)
	end
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
end
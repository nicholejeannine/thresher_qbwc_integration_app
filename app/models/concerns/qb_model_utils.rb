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

end
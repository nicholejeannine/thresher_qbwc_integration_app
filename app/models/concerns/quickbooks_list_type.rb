module QuickbooksListType
	extend ActiveSupport::Concern
	include QuickbooksModel

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
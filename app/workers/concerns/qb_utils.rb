module QbUtils
	extend ActiveSupport::Concern

	included do
		def self.klass
		   self.name.remove(/^List/).remove(/Worker$/).constantize
		end

		def self.response_name
		    klass.to_s.underscore << '_ret'
		end

        def columns
		    self.klass.class.column_names
        end

        def address?(key)
        	key.match /ship_address$|vendor_address$|bill_address$|block$/
        end

        def extended_address?(key)
        	key.match /address$/
        end
	end


end
module QbUtils
	extend ActiveSupport::Concern

	included do
		def self.klass
		   self.name.remove(/^List/).remove(/Worker$/).constantize
		end

		def self.response_name
		    klass.to_s.underscore << '_ret'
		end

        def self.column_names
		    klass.column_names
        end
	end
end
module QbUtils
	extend ActiveSupport::Concern
		def klass
		   self.class.name.remove(/^List/).remove(/Worker$/).constantize
		end

		def response_name
			klass.to_s.underscore << '_ret'
		end
end

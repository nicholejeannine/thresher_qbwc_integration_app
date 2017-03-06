module QbLineItemUtils
	extend ActiveSupport::Concern
	include QbUtils
	included do

		def self.line_klass
			(klass.to_s << "Line").constantize
		end

		def self.line_item_response_name
			klass.to_s.underscore << '_line_ret'
		end

		def line_columns
			self.class.line_klass.column_names
		end
	end
end
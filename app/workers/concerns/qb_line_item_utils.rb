module QbLineItemUtils
	extend ActiveSupport::Concern
	include QbUtils
	included do

		def line_klass
			(klass.to_s << "Line").constantize
		end

		def line_item_response_name
			klass.to_s.underscore << '_line_ret'
		end

		def line_columns
			line_klass.column_names
		end

		def columns
			klass.column_names
		end
	end
end
module WorkerUtils
	extend ActiveSupport::Concern

		# Retrieve the name of the class we're interested in saving to the database from a QueryWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
		def klass
			self.class.name.remove(/QueryWorker/).constantize
		end

		# Retrieve the quickbooks xml response name from the worker class instance (e.g., "CustomerQueryWorker.new.klass returns 'customer_ret')
		def response_name
			klass.to_s.underscore << '_ret'
		end

		def line_klass
			self.class.name.remove(/QueryWorker/).concat('Line').constantize
		end

		def line_item_response_name
			line_klass.to_s.underscore << '_ret'
		end
end

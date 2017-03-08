module QbUtils
	extend ActiveSupport::Concern

		# Retrieve the name of the class we're interested in saving to the database from a ListWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
		def klass
			self.class.name.remove(/QueryWorker/).constantize
		end

		# Retrieve the quickbooks xml response name from the worker class instance (e.g., "CustomerQueryWorker.new.klass returns 'customer_ret')
		def response_name
			klass.to_s.underscore << '_ret'
		end
end

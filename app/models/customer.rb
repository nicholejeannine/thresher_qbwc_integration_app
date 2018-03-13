# In Quickbooks, anything that is a customer, job, or project according to Thresher is somehow still a "customer". We can only pull "customers" from Quickbooks, but we can determine by the customer name what category Thresher considers this "customer" to be.
class Customer < ApplicationRecord
	self.abstract_class = true
	include QbCanPushToPortal

  # Determines whether the Quickbooks Customer is a Thresher client, job, or project
	def self.customer_type(full_name)
		return Project if full_name.match(/P-\d+$/)
		return Job if full_name.match(/:/)
		Client
	end
	
	# Activate quickbooks sync to portal for Client model. Ignore jobs and projects for now.
	def self.parse_customer_response(qb)
		klass = self.customer_type(qb['full_name'])
		if klass == Client
			klass.qb_push_to_portal(qb)
		end
	end
end
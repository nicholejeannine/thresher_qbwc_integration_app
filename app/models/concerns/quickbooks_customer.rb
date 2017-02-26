module QuickbooksCustomer
	extend ActiveSupport::Concern
	included do
		self.primary_key = :id # In case customer model represents a mysql view
		# `Customer.active` will query all active customers, `Customer.inactive` will query all inactive customers.  `Customer.where("full_name LIKE 'MommyCo%'").active` will query all of the active customers where full_name begins with "MommyCo".
		#  The -> symbol ("lambda") means the whole query is being saved to a variable, so that it can  be run when it's actually needed (instead of when the program is started).
		scope :active, ->{ where(:is_active => true) }
		scope :inactive, ->{ where(:is_active => false) }
		has_many :estimates
		has_many :invoices
		has_many :sales_orders
	end
	# Returns true if this is the final "customer" in the customer/jobs tree, false if there are other jobs underneath it
	def leaf?
		self.jobs.count == 0
	end

	# Returns the boolean `is_active` field in the database
	def active?
		is_active
	end

	# Included so that the url displays full_name instead of ugly quickbooks id value in url
	# e.g., `/customers/tcp` instead of `/customers/100273731-866661887 or whatever
	def to_param
		full_name
	end

	# Finds all children, grandchildren, etc (all sublevels of Customers class)
	def descendants
		Customer.where("`full_name` LIKE '#{self.full_name}:%'").order(:sublevel, :full_name)
	end

	# With any customer, c. call all of its children (jobs and projects) with c.children.
	# Returns only the immediate children of a given customer instance - should also return projects.
	def children
		Customer.where(:parent_id => self.id).order(:name)
	end

	def client?
		sublevel.to_i === 0
	end

	def job?
		!client? && !project?
	end

	# TODO: consider asking instead, does the customer object have a Thresher Project PKEY?
	# Returns a boolean value - is the customer instance a project?
	def project?
		name.upcase.start_with?('P-')
	end
end
module QuickbooksCustomer
	extend ActiveSupport::Concern

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

	# Limit fields returned for company display page. Note the returned objects are simple arrays, not Customer objects, so fields not included here are not visible.
	def subjobs
		Customer.select([:id, :parent_id, :full_name, :is_active, :name, :full_name, :sublevel, :job_status]).where(:parent_id => self.id).order(:name)
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

	### INSTANCE METHODS
	module ClassMethods

		# For use on company display page - we only need the name, sublevel, balance and total balance fields
		def companies
			Customer.select([:id, :parent_id, :name, :sublevel, :full_name, :is_active, :balance, :total_balance]).where(:sublevel => 0)
		end

	end





end
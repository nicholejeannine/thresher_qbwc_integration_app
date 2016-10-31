class Customer < ApplicationRecord
   # Scoping allows you to specify commonly-used queries which can be referenced as method calls on the association objects or models. With these scopes, you can use every method previously covered such as where, joins and includes. All scope methods will return an ActiveRecord::Relation object which will allow for further methods (such as other scopes) to be called on it.  http://guides.rubyonrails.org/active_record_querying.html#scopes

   #  `Customer.active` will query all active customers, `Customer.inactive` will query all inactive customers.  `Customer.where("full_name LIKE 'MommyCo%'").active` will query all of the active customers where full_name begins with "MommyCo".
   #  The -> symbol ("lambda") means the whole query is being saved to a variable, so that it can be run when it's actually needed (instead of when the program is started).
   scope :active, ->{ where(:is_active => true) }
   scope :inactive, ->{ where(:is_active => false) }

   # It probably doesn't make sense to define "companies" as a scoped variable, but still figuring this out.
   scope :companies, -> {(where("`sublevel` = 0")) }

   # `Customer.jobs` will query for all jobs which are not also projects.  (FIXME?) Customer.where("full_name LIKE 'MommyCo%'").jobs` will query for all of MommyCo's jobs (the jobs within the previously declared scope, that of MommyCo customers.)
   scope :jobs, -> {(where("`sublevel` > 0 AND `name` NOT LIKE 'P-%'")) }

   # `Customer.projects` will query for all projects. Customer.where("full_name LIKE 'MommyCo%'").projects` will query for all of MommyCo's projects (the projects within the previously declared scope, that of MommyCo customers.)
   scope :projects, -> {(where("`sublevel` > 0 AND `name` LIKE 'P-%'")) }

   # Figure out the parent of any customer/job/project, `c`, by calling `c.parent`
   belongs_to :parent, :class_name => 'Customer'

   # Honestly not sure if the line below is needed or if it's taken care of already by defining scope :jobs, above.
   has_many :jobs, :class_name => 'Customer', :foreign_key => 'parent_id'


   # Small example of one way to call a query on all customers
   # TODO: test if the value returned by `Customer.average_balance` gets updated in the browser when the balance of a single customer changes.
   def self.average_balance
     Customer.average(:balance)
   end
end

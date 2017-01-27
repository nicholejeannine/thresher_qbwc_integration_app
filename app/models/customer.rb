class Customer < ApplicationRecord
   has_many :invoices
   has_many :sales_orders


  # `Customer.active` will query all active customers, `Customer.inactive` will query all inactive customers.  `Customer.where("full_name LIKE 'MommyCo%'").active` will query all of the active customers where full_name begins with "MommyCo".
  #  The -> symbol ("lambda") means the whole query is being saved to a variable, so that it can be run when it's actually needed (instead of when the program is started).
  scope :active, ->{ where(:is_active => true) }
  scope :inactive, ->{ where(:is_active => false) }
  scope :clients, -> { where(:sublevel => 0)}
  scope :jobs, -> {where("`sublevel` > 0 AND `name` NOT LIKE 'P-%'")}
  scope :projects, -> {where("`sublevel` > 0 AND `name` LIKE 'P-%'")}
  has_many :jobs, :class_name => 'Job', :foreign_key => 'parent_id'
  has_many :projects, :class_name => 'Project', :foreign_key => 'parent_id', through: :jobs
  ### INSTANCE METHODS

  # With any customer, c, call c.all_projects to return all projects.
  # For instance, if c is the Customer where full_name = 'Google', c.projects will will issue the SQL query: `SELECT * FROM customers WHERE (full_name LIKE 'Google%' AND name LIKE 'P-%')`
  def all_projects
    Customer.where("`full_name` LIKE '#{self.full_name}%' AND `name` LIKE 'P-%'")
  end

  # With any customer, c. call all of its children (jobs and projects) with c.children.
  def descendants
    Customer.where("`full_name` LIKE '#{self.full_name}:%'").order(:sublevel, :full_name)
  end
  # Use method borrowed from acts_as_tree gem, but without the gem
  def leaf?
    self.jobs.count == 0
  end

  # Returns a boolean indicating whether the instance is active
  def active?
    self.is_active == true
  end

  # Included so that the url displays full_name instead of ugly quickbooks id value in url
  # e.g., `/customers/tcp` instead of `/customers/100273731-866661887 or whatever
  def to_param
    full_name
  end

  # Returns only the immediate children of a given customer instance - should also return projects.
  def children
    Customer.where(:parent_id => self.id).order(:name)
  end

  # Small example of one way to call a query on all customers
  # TODO: test if the value returned by `Customer.average_balance` gets updated in the browser when the balance of a single customer changes.
  # def self.average_balance
  #   Customer.average(:balance)
  # end



  ### METHODS INCLUDED FOR DISPLAY PURPOSES - CONSIDER USING DECORATORS OR HELPER METHODS?

  # For use on company display page - we only need the name, sublevel, balance and total balance fields
  def self.companies
    select([:id, :parent_id, :name, :sublevel, :full_name, :is_active, :balance, :total_balance]).where(:sublevel => 0)
  end

  # Limit fields returned for company display page. Note the returned objects are simple arrays, not Customer objects, so fields not included here are not visible.
  def subjobs
    Customer.select([:id, :parent_id, :full_name, :is_active, :name, :full_name, :sublevel, :job_status]).where(:parent_id => self.id).order(:name)
  end

  # TODO: maybe move to a helper method?
  # TODO: consider asking instead, does the customer object have a Thresher Project PKEY?
  # Returns a boolean value - is the customer instance a project?
  def client?
    sublevel.to_i === 0
  end

  def job?
    !client? && !project?
  end

  def project?
    name.upcase.start_with?('P-')
  end
end

# == Schema Information
#
# Table name: customers
#
#  id                                 :string(255)      not null, primary key
#  time_created                       :datetime
#  time_modified                      :datetime
#  edit_sequence                      :string(16)
#  name                               :string(50)
#  full_name                          :string(255)
#  is_active                          :string(11)
#  parent_id                          :string(40)
#  sublevel                           :string(40)
#  company_name                       :string(40)
#  salutation                         :string(40)
#  first_name                         :string(40)
#  middle_name                        :string(40)
#  last_name                          :string(40)
#  job_title                          :string(40)
#  bill_address_addr1                 :string(40)
#  bill_address_addr2                 :string(40)
#  bill_address_addr3                 :string(50)
#  bill_address_addr4                 :string(50)
#  bill_address_addr5                 :string(50)
#  bill_address_city                  :string(40)
#  bill_address_state                 :string(25)
#  bill_address_postal_code           :string(16)
#  bill_address_country               :string(40)
#  bill_address_note                  :string(255)
#  bill_address_block_addr1           :string(255)
#  bill_address_block_addr2           :string(255)
#  bill_address_block_addr3           :string(50)
#  bill_address_block_addr4           :string(50)
#  bill_address_block_addr5           :string(50)
#  ship_address_addr1                 :string(40)
#  ship_address_addr2                 :string(40)
#  ship_address_addr3                 :string(50)
#  ship_address_addr4                 :string(50)
#  ship_address_addr5                 :string(50)
#  ship_address_city                  :string(40)
#  ship_address_state                 :string(25)
#  ship_address_postal_code           :string(16)
#  ship_address_country               :string(40)
#  ship_address_note                  :string(255)
#  ship_address_block_addr1           :string(40)
#  ship_address_block_addr2           :string(40)
#  ship_address_block_addr3           :string(50)
#  ship_address_block_addr4           :string(50)
#  ship_address_block_addr5           :string(50)
#  phone                              :string(40)
#  alt_phone                          :string(40)
#  fax                                :string(40)
#  email                              :string(40)
#  cc                                 :string(40)
#  contact                            :string(40)
#  alt_contact                        :string(40)
#  customer_type_id                   :string(40)
#  customer_type_full_name            :string(40)
#  terms_id                           :string(40)
#  terms_full_name                    :string(255)
#  sales_rep_id                       :string(40)
#  sales_rep_full_name                :string(255)
#  balance                            :decimal(10, 5)
#  total_balance                      :decimal(10, 5)
#  sales_tax_code_id                  :string(40)
#  sales_tax_code_full_name           :string(255)
#  item_sales_tax_id                  :string(40)
#  item_sales_tax_full_name           :string(255)
#  resale_number                      :string(40)
#  account_number                     :string(40)
#  preferred_payment_method_id        :string(40)
#  preferred_payment_method_full_name :string(40)
#  job_status                         :string(40)
#  job_start_date                     :date
#  job_projected_end_date             :date
#  job_end_date                       :date
#  job_desc                           :string(40)
#  job_type_id                        :string(40)
#  job_type_full_name                 :string(255)
#  preferred_delivery_method          :string(40)
#  price_level_id                     :string(40)
#  price_level_full_name              :string(255)
#  primary_contact                    :string(255)
#  primary_email                      :string(255)
#  primary_phone                      :string(255)
#

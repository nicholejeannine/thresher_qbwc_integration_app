class Customer < ApplicationRecord
   scope :active, ->{ where(:is_active => true) }
   scope :inactive, ->{ where(:is_active => false) }

   belongs_to :parent, :class_name => 'Customer'
   has_many :jobs, :class_name => 'Customer', :foreign_key => 'parent_id'


   scope :companies, -> {(where("`sublevel` = 0")) }
   scope :jobs, -> {(where("`sublevel` > 0 AND `name` NOT LIKE 'P-%'")) }
   scope :projects, -> {(where("`sublevel` > 0 AND `name` LIKE 'P-%'")) }

   def projects
      Customer.where -> {("`parent_id` = `id`")}
   end

   def self.average_balance
     Customer.average(:balance)
   end
end

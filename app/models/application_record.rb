class ApplicationRecord < ActiveRecord::Base
  self.primary_key = :id # In case customer model represents a mysql view
  self.abstract_class = true
end

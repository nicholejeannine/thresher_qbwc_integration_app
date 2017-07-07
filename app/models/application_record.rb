class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.is_valid_key?(key)
    key.in?(self.attributes.keys)
  end
end

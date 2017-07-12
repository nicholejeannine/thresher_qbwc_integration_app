class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.is_valid_key?(key)
    key.in?(self.attributes.keys)
  end

  def self.default_hash
    Hash[*self.attributes.map {|k| [k, nil]}.flatten]
  end
end

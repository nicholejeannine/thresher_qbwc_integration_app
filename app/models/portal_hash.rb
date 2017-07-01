require 'qbxml'
module PortalHash
  include ActiveSupport::Concern
  extend ActiveSupport::Concern


  ADDRESS_REF_TYPES = %w(ship_address bill_address vendor_address)

  ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)
  
  ADDRESS_NAME =  Proc.new {|key,value|
    key.split("_")[0].to_s.concat("_#{value}")
    }
  
  included do
    def self.parse_query(hash)
      hash = Qbxml::Hash.from_hash(hash)
      my_hash = hash.dup
      my_hash.keep_if{|key|key.in?(self::QB_KEYS)}
      addresses = hash.select{|key|key.in?(PortalHash::ADDRESS_REF_TYPES)}.keys
      addresses.each do |address|
        values = hash[address]&.keys
        values&.each do |k, value|
        name = ADDRESS_NAME&.call(address,k) if k.in?(PortalHash::ADDRESS_KEYS)
          my_hash[name] = hash[address][k]
        end
      end
      my_hash.delete_if{|key|key.nil? || key.in?(PortalHash::ADDRESS_REF_TYPES)}.compact!
      my_hash
    end

      # @keys = klass::QB_KEYS
      # @hash.select!{|key|key.in?(@keys)}
      # hash.select{|key|key.in?(PortalHash::ADDRESS_TYPES)}.each{|address|hash.convert_address(address)}
      # @hash
    
  end
  
end

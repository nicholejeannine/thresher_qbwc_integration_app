require 'qbxml'
module PortalHash
  include ActiveSupport::Concern
  extend ActiveSupport::Concern
  
  ADDRESS_KEYS = %w(addr1 addr2 addr3 addr4 addr5 city state postal_code country note)

  PARSE_ADDRESS = Proc.new{|address_hash, prefix|address_hash.keep_if{|key|key.in?(ADDRESS_KEYS)}.transform_keys!{|k|"#{prefix}_#{k}"}}
  
  PARSE_REF_TYPE = Proc.new{|ref_hash, column|{column => ref_hash['full_name']}}

  PARSE_REFS = Proc.new{|hash, klass|hash.select{|key|key.in?(klass::REFERENCE_TYPES)}.keep_if{|key|hash[key].present?}.each{|key|PARSE_REF_TYPE.call(hash[key], key.to_s.remove("_ref"))}}
  
  included do
  
    def self.parse_query(hash)
      my_hash = Qbxml::Hash.from_hash(hash)
      my_hash.keep_if{|key|key.in?(self::QB_KEYS)}
      my_hash.merge!(PARSE_ADDRESS.call(hash['bill_address'], "bill")).merge!(PARSE_ADDRESS.call(hash['ship_address'], "ship"))
      my_hash.merge!(PARSE_REFS.call(hash, self.name.constantize))
      my_hash
    end

      # @keys = klass::QB_KEYS
      # @hash.select!{|key|key.in?(@keys)}
      # hash.select{|key|key.in?(PortalHash::ADDRESS_TYPES)}.each{|address|hash.convert_address(address)}
      # @hash
    
  end
  
end

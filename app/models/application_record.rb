class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include QuickbooksTypes
  extend QuickbooksTypes
  
  def self.serialize_query_response(hash)
    hash = Qbxml::Hash.from_hash(hash)
    qb = hash.extract!(*self.attributes.keys)
    addresses = self.parse_addresses(hash)
    refs =  self.parse_refs(hash)
    custom = PARSE_CUSTOM.call(hash.extract!('data_ext_ret')['data_ext_ret'])
    addresses&.each{|k|qb.merge!(k)}
    refs&.each{|k|qb.merge!(k)}
    custom&.each{|hash|qb.merge!(hash)}
    qb = self.attributes.merge(qb)
    qb.select{|key|is_valid_key?(key)}
  end

  def self.parse_qb_response(qb)
    qb_value = qb[self.qb_id]
    c = self.find_or_initialize_by(self.qb_id => qb_value)
    hash =  self.serialize_query_response(qb)
    c.update(hash)
    c.save
  end
  
  def self.is_valid_key?(key)
    key.in?(self.attributes.keys)
  end
end

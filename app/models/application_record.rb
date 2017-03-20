class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.parse_qb_response(qb)
    klass = qb_customer_type(qb['name'], qb['sublevel'])
    id = (qb['list_id'] || qb['txn_id'])
    c = klass.find_or_initialize_by(:id => id)
    c.parse_hash(qb)
    c.save
  end
end

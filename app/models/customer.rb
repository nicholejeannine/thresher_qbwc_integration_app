class Customer < ApplicationRecord

  def self.parse_qb_response(qb)
    c = Client.find_or_initialize_by(:id => qb['list_id'])
    c.full_name = qb['full_name']
    c.save

  end
end

class Customer < ApplicationRecord

  def self.parse_qb_response(qb)
    c = Client.find_or_initialize_by(:id => qb['list_id'])
    c.save

  end
end

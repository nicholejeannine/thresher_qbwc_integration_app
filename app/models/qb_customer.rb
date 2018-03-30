class QbCustomer < ApplicationRecord
  
  def self.parse_qb_customer_response(qb)
    begin
      c = self.find_or_initialize_by("list_id" => qb['list_id'])
      c['full_name'] = qb['full_name']
      c['name'] = qb['name']
      c.save
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

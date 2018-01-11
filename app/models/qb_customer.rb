class QbCustomer < ApplicationRecord
  
  
  def self.customer_type(key)
    if key.match(/P-\d+$/)
      "Project"
    elsif key.match(/:/)
      "Job"
    else "Client"
    end
  end
  
  def self.parse_qb_customer_response(qb)
    begin
      c = self.find_or_create_by(:list_id => qb['list_id'])
      c.full_name = qb['full_name']
      c.customer_type = self.customer_type(qb['full_name'])
      c.save
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

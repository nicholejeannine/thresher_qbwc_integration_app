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
      qb_value = qb[self.qb_id]
      c = self.find_or_create_by(self.qb_id => qb_value)
      hash = QuickbooksQueryResponse.parse(qb, self, c.id)
      c.update(hash)
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

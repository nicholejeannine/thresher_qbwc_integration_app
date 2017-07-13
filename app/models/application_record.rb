class ApplicationRecord < ActiveRecord::Base
  include QuickbooksTypes
  self.abstract_class = true

  def self.is_valid_key?(key)
    key.in?(self.attributes)
  end

  def self.default_hash
    Hash[*self.columns.map{|k|[k.name, k.default]}.flatten]
  end

  def self.parse_qb_response(qb)
    begin
      qb_value = qb[self.qb_id]
      c = self.find_or_create_by(self.qb_id => qb_value)
      hash = QuickbooksQueryResponse.parse(qb, self, c.id)
      c.update(hash)
    rescue StandardError => e
      QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{qb_value}", :error_message => "Error parsing response: #{e}")
    end
  end
end

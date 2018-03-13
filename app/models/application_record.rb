class ApplicationRecord < ActiveRecord::Base
  include QuickbooksTypes
  self.abstract_class = true
  
  def self.is_valid_key?(key)
    key.in?(self.column_names)
  end
  
  # Grabs all "appropriate" column names from the model stored in the database.
  def self.default_hash
    Hash[*self.columns.map{|k|[k.name, k.default]}.flatten].except("id")
  end
  
  # To parse the QueryResponse, we determine whether the qb_id is "list_id" (for list types), "txn_id" (for transaction types), or "txn_line_id" (for line items). We then search for the id in the appropriate table, and either retrieve it (if it already exists) or create it. The QueryResponse hash is then parsed into key/value pairs, and the record is updated in the database.
  def self.parse_qb_response(qb)
    # return if qb.has_key?('time_created') && qb['time_created'] < "2017-01-01"
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
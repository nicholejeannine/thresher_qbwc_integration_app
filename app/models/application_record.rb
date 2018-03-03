class ApplicationRecord < ActiveRecord::Base
  include QuickbooksTypes
  self.abstract_class = true

  no_field_map = Proc.new{NoMethodError.new("No FIELD_MAP Constant has been initiated by this class")}
  # Every table that syncs data with the portal needs to define a hash constant, FIELD_MAP.  FIELD_MAP's keys are the portal columns that the web connector can update. The values are "lookup" values, e.g., they specify where and how to obtain the correct values from the Quickbooks query hash.  The value types are either a string, a hash, or a proc (a special method that can be performed on a portion of the quickbooks hash to obtain the correct value.
  # This line of code is intented to help anyone who might come along after Nichole and wants to add a new class for the web connector to pull data from. If you haven't yet implemented a FIELD_MAP hash, you should do so.
  FIELD_MAP = no_field_map.call

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

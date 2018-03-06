class ApplicationRecord < ActiveRecord::Base
  include QuickbooksTypes
  self.abstract_class = true
  
  

  # Every table that syncs data with the portal needs to define 3 constants:
    #  1.  PORTAL_MATCHING_FIELD = string or a Proc (a Ruby method that can be called anytime in the program, which returns a value). This is the value the Web Connector should "match" portal fields on.
    #  2.  QB_MATCHING_FIELD = the string value or method to be used to compare the Quickbooks value with the protal matching value.
    #  3.  FIELD_MAP - a hash.  The hash keys are sybmols with the names of the portal columns that the web connector can update. The hash values are "lookups" values, e.g., they specify where and how to obtain the correct values from the Quickbooks query hash.  Each value should be either a string, a hash, or a proc (a proc is simply a method that can be called to do perform any complicated logic needed to obtain the correct value).

  # To parse the QueryResponse, we determine whether the qb_id is "list_id" (for list types), "txn_id" (for transaction types), or "txn_line_id" (for line items). We then search for the id in the appropriate table, and either retrieve it (if it already exists) or create it. The QueryResponse hash is then parsed into key/value pairs, and the record is updated in the database.
  # # OLD WAY
  # def self.parse_qb_response(qb)
  #   # return if qb.has_key?('time_created') && qb['time_created'] < "2017-01-01"
  #   begin
  #     qb_value = qb[self.qb_id]
  #     c = self.find_or_create_by(self.qb_id => qb_value)
  #     hash = QuickbooksQueryResponse.parse(qb, self, c.id)
  #     c.update(hash)
  #   rescue StandardError => e
  #     QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{qb_value}", :error_message => "Error parsing response: #{e}")
  #   end
  # end
  #
  #
  # FIXME: CHANGE qb['full_name'] to handle other fields for other models
  def self.save_to_portal qb
    begin
      # Look for customer by list id first. If not found, seearch by full name. If not found, create a new one.
      row = self.find_by(self.qb_id => qb[self.qb_id])
      if row.nil?
        row = self.name.constantize.find_or_create_by(self::QB_MATCHING_FIELD => qb[self::PORTAL_MATCHING_FIELD])
      end
      # If customer if found, save the qb fields to their corresponding Thresher fields.
      self::FIELD_MAP.keys.each {|x| row[x] = ""}
      self::FIELD_MAP.each do |k, v|
        if v.is_a?(Hash)
          v.each do |key, value|
            if qb.has_key?(key)
              if value.is_a?(String)
                row[k] = qb[key][value]
              elsif value.is_a?(Proc)
                row[k] = value.call(qb[key])
              end
            end
          end
        elsif v.is_a?(String)
          row[k] = qb[v]
        end
      end
      row.save
    rescue StandardError => e
      QbwcError.create(:worker_class => "#{self.name}.save_to_portal", :model_id => "#{qb['full_name']}", :error_message => "#{e}")
    end
  end
  
  # These lines of code are intented to help anyone who might come along after Nichole and wants to add a new class for the web connector to pull data from. If you haven't yet implemented the above constants, you should do so.
  not_implemented_error = Proc.new{NoMethodError.new("You must define the constants MATCHING_FIELD, QB_ID, and FIELD_MAP in order to sync a new table with the web connector.  Please see app/models/application_record.php and see other tables for examples")}
  PORTAL_MATCHING_FIELD = not_implemented_error.call
  QB_MATCHING_FIELD = not_implemented_error.call
  FIELD_MAP = not_implemented_error.call
end

module QbCanPushToPortal
  extend ActiveSupport::Concern
  include QuickbooksTypes
  included do
    before_save :modification_user
    
    def self.initialize_sync (qb, portal_field, qb_value)
      row = self.find_or_initialize_by(portal_field => qb_value)
      row[self.qb_id] = qb[self.qb_id]
      row.send("CreationUser=", "QB") if self.column_names.include?("CreationUser")
      row.send("CreationTimeStamp=", Time.now) if self.column_names.include?("CreationTimeStamp")
      row.save
      self.save_to_portal(qb)
    end
  
    def self.save_to_portal qb
      begin
        row = self.find_or_create_by(self.qb_id => qb[self.qb_id])
        # save the qb fields to their corresponding Thresher fields.
        self::FIELD_MAP.keys.each {|x| row[x] = ""}
        self::FIELD_MAP.each do |k, v|
          if v.is_a?(String)
            row[k] = qb[v]
          elsif v.is_a?(Hash)
            v.each do |key, value|
              if qb.has_key?(key)
                if value.is_a?(String)
                  row[k] = qb[key][value]
                elsif value.is_a?(Proc)
                  row[k] = value.call(qb[key])
                end
              end
            end
          end
        end
        row.save
      rescue StandardError => e
        QbwcError.create(:worker_class => "#{self.name}", :model_id => "#{qb[self.qb_id]}", :error_message => "save_to_portal failed: #{e}")
      end
    end
    
    def modification_user
      self.send("LastModificationUser=", "QB") if self.class.column_names.include?("LastModificationUser")
      self.send("LastModificationTimeStamp=", Time.now) if self.class.column_names.include?("LastModificationTimeStamp")
    end


    def self.qb_id
      if self::FIELD_MAP.keys.include?(:list_id)
        "list_id"
      elsif self::FIELD_MAP.keys.include?(:txn_id)
        "txn_id"
      elsif self::FIELD_MAP.keys.include?(:txn_line_id)
        "txn_line_id"
      end
    end
  end

end



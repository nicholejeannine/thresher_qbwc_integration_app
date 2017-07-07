module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypes
  include QuickbooksLineItemUtils
  
  # Handle reference types - save only the value labeled "full name"
  # def handle_ref_type(key, value)
  #   begin
  #     if key.match(/customer_ref|vendor_ref|parent_ref/)
  #       update_attribute("#{key.remove(/ref$/).concat('id')}", value['list_id'])
  #       update_attribute("#{key.remove(/ref$/).concat('type')}", name_type(value['full_name'])) if key == 'customer_ref'
  #     else
  #       update_attribute("#{key.remove(/_ref$/)}", value['full_name'])
  #     end
  #   rescue Exception => e
  #     QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{self.id}", :error_message => "Error when attempting operation #{key}=#{value}: #{e}")
  #   end
  # end
  
  included do
    def self.parse_qb_response(qb)
      begin
        qb_value = qb[self.qb_id]
        c = self.find_or_initialize_by(self.qb_id => qb_value)
        hash = parse_hash(qb)
        c.update(self.attributes.merge(hash))
      rescue StandardError => e
        QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{qb_value}", :error_message => "Error parsing response: #{e}")
      end
    end
    
    def self.parse_hash(qb)
      data = Hash.new(nil)
      hash = Qbxml::Hash.from_hash(qb).extract!(*self::QB_KEYS)
      hash.each do |key, value|
        if key.match(/_ref$/)
          name = key.remove(/_ref$/)
          full_name = value['full_name']
          data.store(name, full_name)
        elsif key.match(/_address$/)
          name = key.remove(/_address$/)
          value.each do |k,v|
            data.store("#{name}_#{k}", v) unless k == 'xml_attributes'
          end
        elsif key.match(/data_ext_ret/)
          value&.each do |arr|
            name = arr['data_ext_name'].remove(" ").underscore
            data.store(name, arr["data_ext_value"])
          end
        end
      end
      hash.select!{|k|k.in?(self.attributes.keys)}.merge!(data)
    end
  end
end
module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksTypes
  
  included do
    def self.parse_qb_response(qb)
      begin
        qb_value = qb[self.qb_id]
        c = self.find_or_create_by(self.qb_id => qb_value)
        hash = c.parse_hash(qb)
        c.update(hash)
        c.save
      rescue StandardError => e
        QbwcError.create(:worker_class => "#{self.class.name}", :model_id => "#{qb_value}", :error_message => "Error parsing response: #{e}")
      end
    end
    
    def parse_hash(qb)
      data = Hash.new(nil)
      hash = Qbxml::Hash.from_hash(qb).extract!(*self.class::QB_KEYS)
      hash.each do |key, value|
        if key.match(/(.*)_ref$/)
          full_name = value['full_name']
          data.store("#{$1}", full_name)
        elsif key.match(/(\A[a-z]*)_address$/)
          value.each do |k,v|
            data.store("#{$1}_#{k}", v) unless k == 'xml_attributes'
          end
        elsif key.match(/data_ext_ret/)
          value&.each do |arr|
            name = arr['data_ext_name'].remove(" ").underscore
            data.store(name, arr["data_ext_value"])
          end
        elsif key.match(/_line_ret$/)
          process_line_items(value)
        elsif key.match(/linked_txn|applied_to_txn_ret/)
          parse_linked_txn(value)
        end
      end
      hash.select!{|k|k.in?(self.class.attributes.keys)}&.merge!(data)
      self.class.attributes.merge!(hash)
    end
  end
end
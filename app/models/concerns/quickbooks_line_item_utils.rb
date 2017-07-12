module QuickbooksLineItemUtils
  extend ActiveSupport::Concern
  # Retrieve the name of the class we're interested in saving to the database from a QueryWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
  included do
  # The line item class (returned as a Class object, so line_klass.new will create a new object)
  def self.line_klass
    self.name.concat('Line').constantize
  end
    
    def self.line_ret
      self.name.concat("LineRet").underscore
    end
  
  # TODO: This can be using the already-built parse_hash method right?
  # Handle each line item instance. Find an existing row by id for updating, or create a new row.
  def self.handle_line(line)
    begin
      # Send the foreign key and value to link the line item to its parent (estimate, invoice, etc)
      instance_line = self.line_klass.find_or_create_by("id" => line['txn_line_id'])
      instance_line.send("#{self.name.underscore}_id=", id)
      data = Hash.new(nil)
      hash = Qbxml::Hash.from_hash(qb).extract!(*self.class::QB_KEYS)
      hash.each do |key, value|
        if key.match(/(.*)_ref$/)
          full_name = value['full_name']
          data.store("#{$1}", full_name)
        end
      end
      hash.select!{|k|k.in?(self.class.attributes.keys)}&.merge!(data)
      self.class.attributes.merge!(hash)
      instance_line.update(hash)
      instance_line.save
    rescue StandardError => e
      QbwcError.create(:worker_class => "LineItem", :model_id => "#{id}", :error_message => "#{e}")
    end
  end
  end
  
  def process_line_items(ret = nil)
    return if ret.nil?
    ret.each{|line|handle_line(line)} if ret.is_a?(Array)
    handle_line(ret) if ret.is_a?(Hash)
  end
end
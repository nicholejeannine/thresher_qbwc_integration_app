module QuickbooksLineItemUtils
  extend ActiveSupport::Concern
  # Retrieve the name of the class we're interested in saving to the database from a QueryWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
  included do
  # The line item class (returned as a Class object, so line_klass.new will create a new object)
  def self.line_klass
    self.name.concat('Line').constantize
  end
  end
  
  # TODO: This can be using the already-built parse_hash method right?
  # Handle each line item instance. Find an existing row by id for updating, or create a new row.
  def handle_line(line)
    begin
      # Send the foreign key and value to link the line item to its parent (estimate, invoice, etc)
      instance_line = self.class.line_klass.find_or_create_by(:id => line['txn_line_id'])
      instance_line.send("#{self.class.name.underscore}_id=", id)
      # Send the hash off for processing. Save it to the database, and catch any errors that occur.
      hash = parse_hash(line)
      instance_line.update(hash)
      instance_line.save
    rescue StandardError => e
      QbwcError.create(:worker_class => "LineItem", :model_id => "#{id}", :error_message => "#{e}")
    end
  end
  
  def process_line_items(ret = nil)
    return if ret.nil?
    handle_line(ret) if ret.is_a?(Hash)
    ret.each{|line|handle_line(line)} if ret.is_a?(Array)
  end
end
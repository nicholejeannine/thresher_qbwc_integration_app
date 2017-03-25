module QuickbooksLineItemUtils
  extend ActiveSupport::Concern
  # Retrieve the name of the class we're interested in saving to the database from a QueryWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
  
  # The line item class (returned as a Class object, so line_klass.new will create a new object)
  # TODO: search files for use of line_klass definition - I think it's not being used, or it could be refactored. Goal is for this whole file to go away.
  def line_klass
    self.class.name.concat('Line').constantize
  end

  # TODO: This can be using the already-built parse_hash method right?
  # Handle each line item instance. Find an existing row by id for updating, or create a new row.
  def handle_line(klass_name, instance_id, line)
    begin
      # Send the foreign key and value to link the line item to its parent (estimate, invoice, etc)
      instance_line = line_klass.find_or_initialize_by(:id => line['txn_line_id'])
      instance_line.send("#{klass_name.underscore}_id=", instance_id)
      # Send the hash off for processing. Save it to the database, and catch any errors that occur.
      instance_line.parse_hash(line)
      instance_line.save
    rescue Exception => e
      QbwcError.create(:worker_class => "#{klass_name}Line", :model_id => "#{instance_id}", :error_message => "Line item #{line['txn_line_id']} failed due to #{e}")
    end
  end

  def process_line_items(klass_name, instance_id = nil, ret = nil)
    return if instance_id.nil? || ret.empty?
    handle_line(klass_name, instance_id, ret) if ret.is_a?(Qbxml::Hash)
    ret.each{|line|handle_line(klass_name, instance_id, line)} if ret.is_a?(Array)
  end
end

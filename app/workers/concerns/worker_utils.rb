module WorkerUtils
  extend ActiveSupport::Concern

  # Retrieve the name of the class we're interested in saving to the database from a QueryWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
  def klass
    self.class.name.remove(/QueryWorker/).constantize
  end

  # Retrieve the quickbooks xml response name from the worker class instance (e.g., "CustomerQueryWorker.new.klass returns 'customer_ret')
  def response_name
     customer_request? ? 'customer_ret' : (klass.to_s.underscore << '_ret')
  end

  def should_skip?(qb)
    # If this is a client worker, skip anything with sublevel > 0
    if klass.to_s.match(/Client/)
      qb['sublevel'] > 0
    elsif klass.to_s.match(/Job/)
      qb['sublevel'] == 0 || qb['name'].match(/^P-/)
    elsif klass.to_s.match(/Project/)
      qb['name'].match(/^P-/).nil?
    end
  end

  def customer_request?
    klass.to_s.match(/Client|Job|Project/)
  end

  # If this is a quickbooks list type, the id value will be 'list id'
  def list_type?
    QBWC.parser.describe("#{klass}Ref")&.elements&.first&.name == 'ListID'
  end

  # If this is a quickbooks transaction type, the id value will be 'txn id'
  def txn_type?
    QBWC.parser.describe("#{klass}Ref")&.elements&.first&.name == 'TxnID'
  end

  # The line item class (returned as a Class object, so line_klass.new will create a new object)
  def line_klass
    self.class.name.remove(/QueryWorker/).concat('Line').constantize
  end

  # The name of the line item class, if present (returned as a string object, not a class object)
  def line_item_response_name
    klass.to_s.underscore.concat('_line_ret')
  end

  # Parse the line item returned block - send the key/value pairs for parsing one at a time
  def process_line_items(instance_id = nil, ret = nil)
    return if instance_id.nil? || ret.empty?
    handle_line(instance_id, ret) if ret.is_a?(Qbxml::Hash)
    ret.each{|line|handle_line(instance_id, line)} if ret.is_a?(Array)
  end

  # Handle each line item instance. Find an existing row by id for updating, or create a new row.
  def handle_line(instance_id, line)
    begin
    instance_line = line_klass.find_or_initialize_by(:id => line['txn_line_id'])
    # Send the foreign key and value to link the line item to its parent (estimate, invoice, etc)
    instance_line.send("#{klass.name.underscore}_id=", instance_id)
    # Send the hash off for processing. Save it to the database, and catch any errors that occur.
    instance_line.parse_qb_hash(line)
    instance_line.save
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{instance_id}", :error_message => "Line item #{line['txn_line_id']} failed due to #{e}")
    end
  end
end

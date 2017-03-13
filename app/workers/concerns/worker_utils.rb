module WorkerUtils
  extend ActiveSupport::Concern

  # Retrieve the name of the class we're interested in saving to the database from a QueryWorker instance (e.g., "CustomerQueryWorker.new.klass returns the Customer class)
  def klass
    self.class.name.remove(/QueryWorker/).constantize
  end

  # Retrieve the quickbooks xml response name from the worker class instance (e.g., "CustomerQueryWorker.new.klass returns 'customer_ret')
  def response_name
    klass.to_s.underscore << '_ret'
  end

  def line_klass
    self.class.name.remove(/QueryWorker/).concat('Line').constantize
  end

  def line_item_response_name
    klass.to_s.underscore.concat('_line_ret')
  end

  def process_line_items(instance_id = nil, ret = nil)
    return if instance_id.nil? || ret.nil?
    begin
      handle_line(instance_id, ret) if ret.is_a?(Qbxml::Hash)
      ret.each{|line|handle_line(instance_id, line)} if ret.is_a?(Array)
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{instance_id}", :error_message => "line item processing failed due to error: #{e}")
    end
  end

  def handle_line(instance_id, line)
    instance_line = line_klass.find_or_initialize_by(:id => line['txn_line_id'])
    instance_line.send("#{klass.name.underscore}_id=", instance_id)
    instance_line.parse_qb_hash(line)
    instance_line.save
  end
end

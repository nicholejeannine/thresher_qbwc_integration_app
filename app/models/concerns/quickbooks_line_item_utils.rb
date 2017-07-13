module QuickbooksLineItemUtils
  extend ActiveSupport::Concern
  included do

  def self.process_line_items(ret, fk_id)
    return if ret.nil? || fk_id.nil?
    ret.each{|line|handle_line(line, fk_id)} if ret.is_a?(Array)
    self.handle_line(ret, fk_id) if ret.is_a?(Hash)
  end
  
  # TODO: This can be using the already-built parse_hash method right?
  # Handle each line item instance. Find an existing row by id for updating, or create a new row.
  def self.handle_line(line, fk_id)
    begin
      # Send the foreign key and value to link the line item to its parent (estimate, invoice, etc)
      line_klass = "#{self.name}Line".constantize
      instance_line = line_klass.find_or_create_by("txn_line_id" => line['txn_line_id'])
      hash = QuickbooksQueryResponse.parse(line, line_klass, instance_line.id)
      hash.merge!({"#{self.name.underscore}_id" => fk_id})
      instance_line.update(hash)
    rescue StandardError => e
      QbwcError.create(:worker_class => "LineItem", :model_id => nil, :error_message => "#{e}")
    end
  end
  end
  

end
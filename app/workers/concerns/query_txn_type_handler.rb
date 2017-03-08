module QueryTxnTypeHandler
  extend ActiveSupport::Concern
  include WorkerUtils

    def handle_response(response, session, job, request, data)
	  complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
	  response["#{response_name}"].to_a.each do |qb|
      begin
      instance_id = qb['txn_id']
	    instance = klass.find_or_initialize_by(:id => instance_id)
      instance.parse_qb_hash(qb)
      instance.save
      if qb["#{line_item_response_name}"].class == Array
        qb["#{line_item_response_name}"].each do |line|
          instance_line = line_klass.find_or_initialize_by(:id => line['txn_line_id'])
          instance_line.send("#{klass.name.underscore}_id=", instance_line)
          instance_line.parse_qb_hash(line)
          instance_line.save
        end
      end
      if qb["#{line_item_response_name}"].class == Qbxml::Hash
        instance_line = line_klass.find_or_initialize_by(:id => qb["#{line_item_response_name}"]['txn_line_id'])
        instance_line.send("#{klass.name.underscore}_id=", instance_line)
        instance_line.parse_qb_hash(line)
        instance_line.save
      end
      # Catch any errors and save them to the qbwc_errors table
      rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{qb['list_id']}", :error_message => "#{e}")
      end
     end
    end
end
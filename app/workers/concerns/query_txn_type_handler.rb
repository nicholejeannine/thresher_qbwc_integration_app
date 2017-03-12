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
      process_line_items(instance_id, qb["#{line_item_response_name}"]) if qb["#{line_item_response_name}"].present?
      # Catch any errors and save them to the qbwc_errors table
      rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{instance_id}", :error_message => "#{e}")
      end
     end
    end
end

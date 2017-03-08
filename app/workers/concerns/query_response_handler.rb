module QueryResponseHandler
	extend ActiveSupport::Concern
	include WorkerUtils

	# Handle the incoming xml response
	def handle_response(response, session, job, request, data)
		# Quickbooks keeps track of how many responses remain - when we reach 0, quit running this process
		complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
		# Make sure the response is an array
		response["#{response_name}"].to_a.each do |qb|
			begin
				# The id column is named "list id" for list types, "txn id" for transaction types. Save it to a variable.
				instance_id = qb['list_id'] || qb['txn_id']
				# Search the DB for the id. Retrieve the object to update it, or create a new row.
				instance = klass.find_or_initialize_by(:id => instance_id)
				# Send the hash to the object for processing.
				instance.parse_qb_hash(qb)
				instance.save
				# Catch any errors and save them to the qbwc_errors table
			rescue Exception => e
				QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{instance_id}", :error_message => "#{e}")
			end
		end
	end
end

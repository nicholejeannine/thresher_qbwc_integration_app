module QueryResponseHandler
  extend ActiveSupport::Concern
  include WorkerUtils

  # Handle the incoming xml response
  def handle_response(response, session, job, request, data)
    # Quickbooks keeps track of how many responses remain - when we reach 0, quit running this process
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    # Make sure the response is an array (not sure to_a is necessary TODO)
    response["#{response_name}"].to_a.each do |qb|
      begin
        # Find the quickbooks ID (list_id or txn_id for transactions)
        instance_id = qb['list_id'] || qb['txn_id']
        # Search the DB for the id. Retrieve the row if it exists, else create a new row.
        instance = klass.find_or_initialize_by(:id => instance_id)
        # Send the hash to the object for processing.
        instance.parse_qb_hash(qb)
        instance.save
        # Process any line items, if they are present
        # TODO - FIND out what happens when qb line item response is empty - does it try to run the method with a null value, does it throw an error, does this return false and exit?
        process_line_items(instance_id, qb["#{line_item_response_name}"])
        # Catch any errors and save them to the qbwc_errors table
      rescue Exception => e
        QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{instance_id}", :error_message => "#{e}")
      end
    end
  end
end

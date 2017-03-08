module QbListTypeWorker
	extend ActiveSupport::Concern
	include QbUtils

	 	def handle_response(response, session, job, request, data)
			complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    		response["#{response_name}"].to_a.each do |qb|
			    begin
    			instance = klass.find_or_initialize_by(:id => qb['list_id'])
    			instance.parse_qb_hash(qb)
          instance.save
   	      rescue Exception => e
           QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{qb['list_id']}", :error_message => "#{e}")
      	  end
         end
      end
end

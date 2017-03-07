module QbListTypeWorker
	extend ActiveSupport::Concern
	include QbUtils # defines the database table, columns, address types, reference types, return types

	included do
	 	def handle_response(response, session, job, request, data)
			complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    		response["#{self.class.response_name}"].to_a.each do |qb|
    			instance = self.class.klass.find_or_initialize_by(:id => qb['list_id'])
    			qb.to_hash.each do |key, value|
                         if skip_type?(key)
                              next
    			  elsif columns.include?(key.to_s)
          		       instance.send("#{key}=", "#{value}")
          	elsif address?(key)
			        handle_address(instance, key, value)
            elsif ref_type?(key)
              handle_ref_type(instance, key, value)
          	elsif custom_type?(key)
				      handle_custom_type(instance, key, value)
          	end
          end # end qb.to_hash.each do |key, value|
         if instance.save
           Rails.logger.info("Complete")
         else
           Rails.logger.info("#{instance.errors}")
      	  end # end if instance save
         end # end each response
      end	 # end handle response
  end # end included block
end

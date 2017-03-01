module QbListTypeWorker
	extend ActiveSupport::Concern

	included do
		def self.klass
		   self.name.remove(/^List/).remove(/Worker$/).constantize
		end

		def self.response_name
		    klass.to_s.underscore << '_ref'
		end

                def self.column_names
		    klass.column_names
                end

		def handle_response(response, session, job, request, data)
			complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
			columns = self.column_names
    		response[self.response_name].to_a.each do |qb|
    			instance = self.klass.find_or_initialize_by(:id => qb['list_id'])
    			qb.to_hash.each do |key, value|
    			if columns.include?(key.to_s)
          			instance.send("#{key}=", value)
          		end
          		end # end qb.to_hash.each do |key, value|
          		if self.klass.save
        			Rails.logger.info("saved it")
      			else
        			Rails.logger.info("Not saved")
      			end # end if customer save
         	end # end each response
		end
	end	
	
end

class QBListTypeWorker < QBWC::Worker
	self.abstract_class = true

	def klass
		self.name.remove(/^List/).remove(/Worker$/).constantize
	end

	def response_name
		klass.name.underscore << '_ref'
	end

	def handle_response(response, session, job, request, data)
		complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
		columns = klass.column_names
    	response[response_name].to_a.each do |qb|
    		instance = klass.find_or_initialize_by(:id => qb['list_id'])
    		qb.to_hash.each do |key, value|
    			if columns.include?(key.to_s)
          			instance.send("#{key}=", value)
          		end
          	end # end qb.to_hash.each do |key, value|
          	if klass.save
        		Rails.logger.info("saved it")
      		else
        		Rails.logger.info("Not saved")
      		end # end if customer save
         end # end each response
	end
end

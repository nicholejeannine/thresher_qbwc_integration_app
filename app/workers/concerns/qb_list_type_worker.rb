module QbListTypeWorker
	extend ActiveSupport::Concern

	included do
		def self.klass
		   self.name.remove(/^List/).remove(/Worker$/).constantize
		end

		def self.response_name
		    klass.to_s.underscore << '_ret'
		end

        def self.column_names
		    klass.column_names
        end

	 	def handle_response(response, session, job, request, data)
			complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
			columns = self.class.column_names
    		response["#{self.class.response_name}"].to_a.each do |qb|
    			instance = self.class.klass.find_or_initialize_by(:id => qb['list_id'])
    			qb.to_hash.each do |key, value|
    			if columns.include?(key.to_s)
          			instance.send("#{key}=", value)
          		elsif key.match /ship_address$|vendor_address$|bill_address$|block$/
			        instance.send("#{key}_addr1=", value['addr1'])
			        instance.send("#{key}_addr2=", value['addr2'])
			        instance.send("#{key}_addr3=", value['addr3'])
			        instance.send("#{key}_addr4=", value['addr4'])
			        instance.send("#{key}_addr5=", value['addr5'])
			        # Address blocks don't have city/state/postal)code/country/note
		        	if key.match /address$/
		          		instance.send("#{key}_city=", value['city'])
		          		instance.send("#{key}_state=", value['state'])
		          		instance.send("#{key}_postal_code=", value['postal_code'])
		          		instance.send("#{key}_country=", value['country'])
		          		instance.send("#{key}_note=", value['note'])
		        	end
		        elsif key.match(/parent_ref/)
          			instance.send("parent_id=", value['list_id'])
        		elsif key.remove(/_ref$/).match /customer_type$|terms$|sales_rep|sales_tax_code|item_sales_tax$|preferred_payment_method$|job_type$|price_level$/
          			name = key.remove(/_ref$/)
          			instance.send("#{name}_id=", value['list_id'])
          			instance.send("#{name}_full_name=", value['full_name'])
          		elsif key.match(/data_ext_ret/)
				    value.to_a.each do |arr|
				        if arr['data_ext_name'] == 'Site Contact'
				          instance.send("primary_contact=", "#{arr['data_ext_value']}")
				        elsif arr['data_ext_name'] == 'Site Email'
				          instance.send("primary_email=", "#{arr['data_ext_value']}")
				        elsif arr['data_ext_name'] == 'Site Phone'
				          instance.send("primary_phone=", "#{arr['data_ext_value']}")
				        end
				  	end # end value.each for data_extensions
          		end
          		end # end qb.to_hash.each do |key, value|
          		if instance.save
        			Rails.logger.info("#{self.class.name} completed without errors")
      			else
        			Rails.logger.info("#{instance.errors}")
      			end # end if customer save
         	end # end each response
             end	
         end
end

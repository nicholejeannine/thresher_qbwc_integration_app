module QbUtils
	extend ActiveSupport::Concern

	included do
		def self.klass
		   self.name.remove(/^List/).remove(/Worker$/).constantize
		end

		def self.line_klass
			(klass.to_s << "Line").constantize
		end

		def self.response_name
		    klass.to_s.underscore << '_ret'
		end

		def self.line_item_response_name
			klass.to_s.underscore << '_line_ret'
		end

        def columns
		    self.class.klass.column_names
        end

        def line_columns
        	self.class.line_class.columns_names
        end

        def address?(key)
        	key.match /ship_address$|vendor_address$|bill_address$|block$/
        end

        def extended_address?(key)
        	key.match /address$/
        end

        def handle_address(instance, key, value)
        	instance.send("#{key}_addr1=", value['addr1'])
			instance.send("#{key}_addr2=", value['addr2'])
			instance.send("#{key}_addr3=", value['addr3'])
			instance.send("#{key}_addr4=", value['addr4'])
			instance.send("#{key}_addr5=", value['addr5'])
			 # Address blocks don't have city/state/postal)code/country/note
		    if extended_address?(key)
		       instance.send("#{key}_city=", value['city'])
		       instance.send("#{key}_state=", value['state'])
		       instance.send("#{key}_postal_code=", value['postal_code'])
		       instance.send("#{key}_country=", value['country'])
		       instance.send("#{key}_note=", value['note'])
		    end
        end

        def ref_type?(key)
        	key.match(/_ref$/)
        end

        def handle_ref_type(instance, key, value)
        	name = key.remove(/_ref$/)
        	# Check if the ref type is one of the values we want to save
        	instance.send("#{name}_id=", value['list_id']) if columns.include?("#{name}_id")
          	instance.send("#{name}_full_name=", value['full_name']) if columns.include?("#{name}_full_name")
        end

        def custom_type?(key)
        	key.match(/data_ext_ret/)
        end

        def handle_custom_type(instance, key, value)
          value.to_a.each do |arr|
		    instance.send("primary_contact=", "#{arr['data_ext_value']}") if arr['data_ext_name'] == 'Site Contact' && columns.include?("primary_contact")
		    instance.send("primary_email=", "#{arr['data_ext_value']}") if arr['data_ext_name'] == 'Site Email' && columns.include?("primary_email")
		    instance.send("primary_phone=", "#{arr['data_ext_value']}") if arr['data_ext_name'] == 'Site Phone' && columns.include?("primary_phone")
		  end
		end 

	end
end
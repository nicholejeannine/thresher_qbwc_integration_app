module QbTxnTypeWorker
  extend ActiveSupport::Concern
  include QbLineItemUtils # defines the database table, columns, address types, reference types, return types


  included do
    def handle_response(response, session, job, request, data)
	  complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
	  response["#{self.class.response_name}"].to_a.each do |qb|
      instance_id = qb['txn_id']
	    instance = self.class.klass.find_or_initialize_by(:id => instance_id)
	    qb.to_hash.each do |key, value|
          if columns.include?(key.to_s)
            instance.send("#{key}=", value)
          elsif address?(key)
		    handle_address(instance, key, value)
          elsif ref_type?(key)
            handle_ref_type(instance, key, value)
          end
        end # end qb.to_hash.each do |key, value|
        if instance.save
          Rails.logger.info("Complete")
      	else
          Rails.logger.info("#{instance.errors}")
      	end # end if instance save
        if qb["#{self.class.line_item_response_name}"].class == Array
        qb["#{self.class.line_item_response_name}"].each do |line|
          instance_line = self.class.line_klass.find_or_initialize_by(:id => line['txn_line_id'])
          instance_line.send("#{self.class.klass.to_s.underscore}_id=", instance_id)
          line.to_hash.each do |k, v|
            if line_columns.include?(k.to_s)
              instance_line.send("#{k}=", v)
            elsif ref_type?(k)
              handle_ref_type(instance_line, k, v, true)
            end # end key matching logic statements for instance_line if Array
          end # end line.to_hash.each do |k,v|
          if instance_line.save
            Rails.logger.info("Saved ...")
          else
            Rails.logger.info("Messed up again")
          end # end if instance_line.save
        end # end each qb['instance_line_ret'].each do |line|
      end # end if qb['instance_line_ret'].class == Array
      if qb["#{self.class.line_item_response_name}"].class == Qbxml::Hash
        instance_line = self.class.line_klass.find_or_initialize_by(:id => qb["#{self.class.line_item_response_name}"]['txn_line_id'])
        instance_line.send("#{self.class.klass.to_s.underscore}_id=", instance_id)
        qb["#{self.class.line_item_response_name}"].to_hash.each do |k, v|
          if line_columns.include?(k.to_s)
            instance_line.send("#{k}=", v)
          elsif k.remove(/_ref$/).match /item$|override_uom_set$|inventory_site$|inventory_site_location$|sales_tax_code$/
            name = k.remove(/_ref$/)
            instance_line.send("#{name}_id=", v['list_id'])
            instance_line.send("#{name}_full_name=", v['full_name'])
          end # end key matching logic statements for estimate_line if Qbxml::Hash
       end # end qb['estimate_line_ret'].to_hash.each do |k,v|
        if instance_line.save
          Rails.logger.info("Saved a thing that was a hash!!")
        else
          Rails.logger.info("Messed up again.")
        end # end if estimate_line.save
      end # end if qb['estimate_line_ret'].class == Qbxml::Hash
    end # end each response
      end # end handle_response
    end # end included block
end
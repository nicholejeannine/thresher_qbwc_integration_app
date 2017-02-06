class ListPurchaseOrderWorker < QBWC::Worker

  # def should_run?

  def requests(job, session, data)
    {
      :purchase_order_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
         :modified_date_range_filter => {
         :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_purchase_orders').first.updated_at.localtime.strftime '%FT%R'}"
        },
        :include_line_items => true,
        :owner_id => 0
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get purchase_orders in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = PurchaseOrder.column_names
    response['purchase_order_ret'].to_a.each do |qb|
      purchase_order_id = qb['txn_id']
      purchase_order = PurchaseOrder.find_or_initialize_by(:id => purchase_order_id)
      qb.to_hash.each do |key, value|
        # send the message to save the values that can be directly translated into key/value pairs
        if columns.include?(key.to_s)
          purchase_order.send("#{key}=", value)
          # save address types
        elsif key.match /ship_address$|vendor_address$|block$/
            purchase_order.send("#{key}_addr1=", value['addr1'])
            purchase_order.send("#{key}_addr2=", value['addr2'])
            purchase_order.send("#{key}_addr3=", value['addr3'])
            purchase_order.send("#{key}_addr4=", value['addr4'])
            purchase_order.send("#{key}_addr5=", value['addr5'])
            # Address blocks don't have city/state/postal)code/country/note
            if key.match /address$/
              purchase_order.send("#{key}_city=", value['city'])
              purchase_order.send("#{key}_state=", value['state'])
              purchase_order.send("#{key}_postal_code=", value['postal_code'])
              purchase_order.send("#{key}_country=", value['country'])
              purchase_order.send("#{key}_note=", value['note'])
            end
        elsif key.remove(/_ref$/).match /vendor$|inventory_site$|ship_to_entity$|template$|ship_method$/
          name = key.remove(/_ref$/)
          purchase_order.send("#{name}_id=", value['list_id'])
          purchase_order.send("#{name}_full_name=", value['full_name'])
        end # end if statement
      end # end for each |key, value|
      if purchase_order.save
        Rails.logger.info("saved a purchase_order")
      else
        Rails.logger.info("Not saved:  #{purchase_order.errors}")
      end # end if purchase_order save
    end # end for each purchase_order
  end # end handle response
end # end class

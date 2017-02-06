class ListSalesOrderWorker < QBWC::Worker

  # def should_run?

  def requests(job, session, data)
    {
      :sales_order_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
         :modified_date_range_filter => {
         :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_sales_orders').first.updated_at.localtime.strftime '%FT%R'}"
        },
        :include_line_items => true
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get sales_orders in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = SalesOrder.column_names
    response['sales_order_ret'].to_a.each do |qb|
      sales_order_id = qb['txn_id']
      sales_order = SalesOrder.find_or_initialize_by(:id => sales_order_id)
      qb.to_hash.each do |key, value|
        # send the message to save the values that can be directly translated into key/value pairs
        if columns.include?(key.to_s)
          sales_order.send("#{key}=", value)
          # save address types
        elsif key.match /ship_address$|bill_address$|block$/
            sales_order.send("#{key}_addr1=", value['addr1'])
            sales_order.send("#{key}_addr2=", value['addr2'])
            sales_order.send("#{key}_addr3=", value['addr3'])
            sales_order.send("#{key}_addr4=", value['addr4'])
            sales_order.send("#{key}_addr5=", value['addr5'])
            # Address blocks don't have city/state/postal)code/country/note
            if key.match /address$/
              sales_order.send("#{key}_city=", value['city'])
              sales_order.send("#{key}_state=", value['state'])
              sales_order.send("#{key}_postal_code=", value['postal_code'])
              sales_order.send("#{key}_country=", value['country'])
              sales_order.send("#{key}_note=", value['note'])
            end
        elsif key.remove(/_ref$/).match /customer$|template$|terms$|sales_rep$|ship_method$|item_sales_tax$|customer_msg$|customer_sales_tax_code$/
          name = key.remove(/_ref$/)
          sales_order.send("#{name}_id=", value['list_id'])
          sales_order.send("#{name}_full_name=", value['full_name'])
        end # end if statement
      end # end for each |key, value|
      if sales_order.save
        Rails.logger.info("saved a sales_order")
      else
        Rails.logger.info("Not saved:  #{sales_order.errors}")
      end # end if sales_order save
    end # end for each sales_order
  end # end handle response
end # end class

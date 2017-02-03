class ListCustomerWorker < QBWC::Worker

  # def should_run?

  def requests(job, session, data)
    {
      :customer_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
        :active_status => 'All',
:from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_customers').first.updated_at.localtime.strftime '%FT%R'}",
        :owner_id => 0
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    unless response['xml_attributes']['iteratorRemainingCount'] == '0'
      columns = Customer.column_names
      response['customer_ret'].each do |qb|
        customer = Customer.find_or_initialize_by(:id => qb['list_id'])
        qb.to_hash.each do |key, value|
          # send the message to save the values that can be directly translated into key/value pairs
          if columns.include?(key.to_s)
            customer.send("#{key}=", value)
            # save address types
          elsif key.match /ship_address$|bill_address$|block$/
              customer.send("#{key}_addr1=", value['addr1'])
              customer.send("#{key}_addr2=", value['addr2'])
              customer.send("#{key}_addr3=", value['addr3'])
              customer.send("#{key}_addr4=", value['addr4'])
              customer.send("#{key}_addr5=", value['addr5'])
              # Address blocks don't have city/state/postal)code/country/note
              if key.match /address$/
                customer.send("#{key}_city=", value['city'])
                customer.send("#{key}_state=", value['state'])
                customer.send("#{key}_postal_code=", value['postal_code'])
                customer.send("#{key}_country=", value['country'])
                customer.send("#{key}_note=", value['note'])
              end
          elsif key.match(/parent_ref/)
            customer.send("parent_id=", value['list_id'])
          elsif key.remove(/_ref$/).match /customer_type$|terms$|sales_rep|sales_tax_code|item_sales_tax$|preferred_payment_method$|job_type$|price_level$/
            name = key.remove(/_ref$/)
            customer.send("#{name}_id=", value['list_id'])
            customer.send("#{name}_full_name=", value['full_name'])
          elsif key.match(/data_ext_ret/)
            value.to_a.each do |arr|
              if arr['data_ext_name'] == 'Site Contact'
                customer.send("primary_contact=", "#{arr['data_ext_value']}")
              elsif arr['data_ext_name'] == 'Site Email'
                customer.send("primary_email=", "#{arr['data_ext_value']}")
              elsif arr['data_ext_name'] == 'Site Phone'
                customer.send("primary_phone=", "#{arr['data_ext_value']}")
              end
           end # end value.each for data_extensions
          end # end key matching logic statements
        end # end for each |key, value|
        if customer.save
          Rails.logger.info("saved a customer")
        else
          Rails.logger.info("Not saved:  #{customer.errors}")
        end # end if customer save
      end # end for each customer
    end # end unless response == 0
  end # end handle response
end # end class
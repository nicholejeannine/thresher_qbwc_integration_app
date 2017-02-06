class ListInvoiceWorker < QBWC::Worker

  # def should_run?

  def requests(job, session, data)
    {
      :invoice_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100,
         :modified_date_range_filter => {
         :from_modified_date => "#{QBWC::ActiveRecord::Job::QbwcJob.where(:name => 'list_invoices').first.updated_at.localtime.strftime '%FT%R'}"
        },
        :include_line_items => true,
        :owner_id => 0
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get invoices in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    columns = Invoice.column_names
    response['invoice_ret'].to_a.each do |qb|
      invoice_id = qb['txn_id']
      invoice = Invoice.find_or_initialize_by(:id => qb['txn_id'])
      qb.to_hash.each do |key, value|
        # send the message to save the values that can be directly translated into key/value pairs
        if columns.include?(key.to_s)
          invoice.send("#{key}=", value)
          # save address types
        elsif key.match /ship_address$|bill_address$|block$/
            invoice.send("#{key}_addr1=", value['addr1'])
            invoice.send("#{key}_addr2=", value['addr2'])
            invoice.send("#{key}_addr3=", value['addr3'])
            invoice.send("#{key}_addr4=", value['addr4'])
            invoice.send("#{key}_addr5=", value['addr5'])
            # Address blocks don't have city/state/postal)code/country/note
            if key.match /address$/
              invoice.send("#{key}_city=", value['city'])
              invoice.send("#{key}_state=", value['state'])
              invoice.send("#{key}_postal_code=", value['postal_code'])
              invoice.send("#{key}_country=", value['country'])
              invoice.send("#{key}_note=", value['note'])
            end
         elsif key.remove(/_ref$/).match /customer$|ar_account$|template$|terms$|sales_rep$|ship_method$|item_sales_tax$|customer_msg$/
          name = key.remove(/_ref$/)
          invoice.send("#{name}_id=", value['list_id'])
          invoice.send("#{name}_full_name=", value['full_name'])
        end # end if statement
      end # end for each |key, value|
      if invoice.save
        Rails.logger.info("saved a invoice")
      else
        Rails.logger.info("Not saved:  #{invoice.errors}")
      end # end if invoice save
    end # end for each invoice
  end # end handle response
end # end class

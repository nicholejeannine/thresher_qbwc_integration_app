class ListInvoiceWorker < QBWC::Worker

  def requests(job, session, data)
    {
      :invoice_query_rq => {
        :xml_attributes => { "requestID" =>"1", 'iterator'  => "Start" },
        :max_returned => 100
      }
    }
  end

  def handle_response(response, session, job, request, data)
    # handle_response will get invoices in groups of 100. When this is 0, we're done.
    complete = response['xml_attributes']['iteratorRemainingCount'] == '0'
    response['invoice_ret'].each do |qb|
      Rails.logger.warn("#{qb}")

      # invoice = Invoice.find_or_create_by(qb.to_hash)
      # if invoice.save
      #   Rails.logger.info("great success")
      # else
      #   Rails.logger.info("Not saved:  #{invoice.errors}")
      # end # end if invoice save
    end # end for each invoice
  end # end handle response
end # end worker class

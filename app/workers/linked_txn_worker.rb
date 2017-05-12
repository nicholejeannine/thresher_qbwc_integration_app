class LinkedTxnWorker < QBWC::Worker

  def requests(job, session, data)
    [
        {:estimate_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :include_linked_txns => true,
            :include_ret_element => ['TxnID', 'LinkedTxn']
        }
        },
        {:sales_order_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :include_linked_txns => true,
            :include_ret_element => ['TxnID', 'LinkedTxn']
        }
        },
        {:purchase_order_query_rq => {
        :xml_attributes => { :requestID =>1, :iterator  => "Start" },
        :max_returned => 100,
        :include_linked_txns => true,
        :include_ret_element => ['TxnID', 'LinkedTxn']
        }
        },
        {:invoice_query_rq => {
            :xml_attributes => { :requestID =>1, :iterator  => "Start" },
            :max_returned => 100,
            :include_linked_txns => true,
            :include_ret_element => ['TxnID', 'LinkedTxn']
        }
        }]
  end
  
  
  def handle_response(r, session, job, request, data)
    # handle_response will get customers in groups of 100. When this is 0, we're done.
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['customer_ret']&.each{|qb|Customer.parse_customer_response(qb)}
      r['estimate_ret']&.each{|qb|Estimate.parse_qb_response(qb)}
      r['sales_order_ret']&.each{|qb|SalesOrder.parse_qb_response(qb)}
      r['purchase_order_ret']&.each{|qb|PurchaseOrder.parse_qb_response(qb)}
      r['invoice_ret']&.each{|qb|Invoice.parse_qb_response(qb)}
      r['receive_payment_ret']&.each{|qb|ReceivePayment.parse_qb_response(qb)}
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

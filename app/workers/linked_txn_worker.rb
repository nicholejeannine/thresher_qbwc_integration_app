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
    r['estimate_ret']&.each do |qb|
      Rails.logger.info("Estimate #{qb['txn_id']}: #{qb['linked_txn']}") if qb.has_key?('linked_txn')
    end
    r['sales_order_ret']&.each do |qb|
      Rails.logger.info("SalesOrder #{qb['txn_id']}: #{qb['linked_txn']}") if qb.has_key?('linked_txn')
    end
    r['purchase_order_ret']&.each do |qb|
      Rails.logger.info("PurchaseOrder #{qb['txn_id']}: #{qb['linked_txn']}") if qb.has_key?('linked_txn')
    end
    r['invoice_ret']&.each do |qb|
      Rails.logger.info("Invoice #{qb['txn_id']}: #{qb['linked_txn']}") if qb.has_key?('linked_txn')
    end
  end
end

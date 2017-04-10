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
  end
end
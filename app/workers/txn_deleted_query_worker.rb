class TxnDeletedQueryWorker < QBWC::Worker
  def requests(job, session, data)
    [{:txn_deleted_query_rq =>
         {:xml_attributes=> {"requestID"=>"1"},
          :txn_del_type=>'Estimate'}
    },
     {:txn_deleted_query_rq =>
          {:xml_attributes=> {"requestID"=>"1"},
           :txn_del_type=>'SalesOrder'}
     },
     {:txn_deleted_query_rq =>
          {:xml_attributes=> {"requestID"=>"1"},
           :txn_del_type=>'PurchaseOrder'}
     },
     {:txn_deleted_query_rq =>
          {:xml_attributes=> {"requestID"=>"1"},
           :txn_del_type=>'Invoice'}
  
     },
     {:txn_deleted_query_rq =>
          {:xml_attributes=> {"requestID"=>"1"},
           :txn_del_type=>'ReceivePayment'}
     }]
  end
  
  def handle_response(r, session, job, request, data)
    Rails.logger.warn(r)
  end
  
  def should_run?(job, session, data)
    true
  end
end
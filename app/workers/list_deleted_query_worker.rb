class ListDeletedQueryWorker < QBWC::Worker
  def requests(job, session, data)
    {:list_deleted_query_rq =>
         {:xml_attributes=> {"requestID"=>"1"},
          :list_del_type=>"Customer"}
    }
  end

  def handle_response(r, session, job, request, data)
    # TODO
  end
  
  def should_run?(job, session, data)
    # TODO
  end
end
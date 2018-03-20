class ListDeletedQueryWorker < QBWC::Worker
  def requests(job, session, data)
    [{:list_deleted_query_rq =>
         {:xml_attributes=> {"requestID"=>"1"},
          :list_del_type=>'Customer'
         }
    }]
  end

  def handle_response(r, session, job, request, data)
    r['list_deleted_ret']&.each{|qb|QbwcError.create(:worker_class => "Deleted Customer", :model_id => qb['list_id'], :error_message => qb)}
  end
  
  def should_run?(job, session, data)
    true
  end
end
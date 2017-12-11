class EmployeeQueryWorker < QBWC::Worker

  def requests(job, session, data)
    [
        {:employee_query_rq => {
            :max_returned => 100,
            :include_ret_element => ['ListID', 'Name', 'IsActive', 'BillingRateRef']
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    begin
      r['employee_ret']&.each{|qb|Employee.parse_qb_response(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

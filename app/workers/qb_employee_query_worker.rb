class QbEmployeeQueryWorker < QBWC::Worker

  def requests(job, session, data)
    [
        {:employee_query_rq => {
            :active_status => "All",
            :include_ret_element => ['ListID', 'Name', 'IsActive', 'FirstName', 'MiddleName', 'LastName']
        }
        }]
  end


  def handle_response(r, session, job, request, data)
    complete = r['xml_attributes']['iteratorRemainingCount'] == '0'
    begin
      r['employee_ret']&.each{|qb|QbEmployee.parse_qb_response(qb)}
    rescue StandardError => e
      QbwcError.create(:worker_class => self.class.name, :error_message => e)
    end
  end
end

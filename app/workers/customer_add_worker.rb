class CustomerAddWorker <  QBWC::Worker
  
  def handle_response(r, session, job, request, data)
    if r['xml_attributes']['statusCode'] == '0'
      begin
        r['customer_ret']&.each{|qb|Customer.parse_customer_response(qb)}
        QBWC.delete_job(job)
      rescue StandardError => e
        QbwcError.create(:worker_class => "CustomerAddWorker", :model_id => data, :error_message => "#{e}")
      end
    else
      QbwcError.create(:worker_class => "TimeTrackingAddWorker", :model_id => data, :error_message => "#{r['xml_attributes']['statusMessage']}")
    end
  end
end
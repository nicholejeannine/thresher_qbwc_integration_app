class TimeTrackingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout false

  # get '/time_trackings' - time trackings are only returned after successful import (they are received in the response from the QBWC Add Request - so these will all be "QB Stored")
  def index
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @entries = TimeTracking.between(start_date, end_date).all
    else
      @entries = TimeTracking.all
    end
  end

  # get '/time_trackings/errors'
  def errors
    render plain: "ERRORS!"
  end

  # post '/time_trackings - creates new "TimeTrackingAdd Requests" for the Web Connector, only if time card transaction is locked but not already "QB Stored"
  def create
    start_date = params[:start_date]
    end_date = params[:end_date]
    timecards = TimecardTransaction.between(start_date, end_date).locked
    timecards.each_with_index do |t, i|
        if t.valid_customer?
          request = t.build_request
          # Process each request as a separate job, and store the TimecardTransaction PKEY in the data field. This field can be accessed by the response returned from the Web Connector, so we will use it to find the same TimeCard Transaction and change the status to "QB Stored" if it is successful
          QBWC.add_job("AddTimeCards#{t.id}", true, '', TimeTrackingAddWorker, request, t.id)
        else
          QbwcTimecardError.create(:worker_class => "TimeCardTransaction Add Request", :model_id => t.id, :error_message => "No Quickbooks customer found for request TimecardTrans #{t.id}, project_id #{t.project_id}, job_id #{t.job_id}, customer #{t.client_id}, employee #{t.employee.employee_id}, date #{t.tc_date}")
        end
       end
      render plain: "OK"
    end

end
class TimecardTransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout false

  # get '/timecard_transactions' - "Portal-side" timecards that may or may not have been stored yet
  # def index
  #   if params[:start_date] && params[:end_date]
  #     start_date = params[:start_date]
  #     end_date = params[:end_date]
  #     @entries = TimecardTransaction.between(start_date, end_date).all
  #   else
  #     @entries = TimecardTransaction.locked
  #   end
  #   render json: @entries
  # end
  
  # show the timecard transactions that are in "locked" state
  def new
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @timecards = TimecardTransaction.between(start_date, end_date).locked.order(:tc_status, :tc_date, :employee_id)
    else
      @timecards = TimecardTransaction.locked.order(:tc_status, :tc_date, :employee_id)
    end
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
        QbwcTimecardError.create(:worker_class => "TimeCardTransaction Add Reqeust", :model_id => t.id, :error_message => "No Quickbooks customer found for request #{i}t, Timecard transaction with id #{t.id}")
      end
    end
    render plain: "OK"
  end

end
class TimecardTransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # get '/timecard_transactions' - "Portal-side" timecards that may or may not have been stored yet
  # def index
  #   if params[:start_date] && params[:end_date]
  #     start_date = params[:start_date]
  #     end_date = params[:end_date]
  #     @entries = TimecardTransaction.between(start_date, end_date).all
  #   else
  #     @entries = TimecardTransaction.all
  #   end
  #   render json: @entries
  # end
  
  # show the timecard transactions that are about to be sent to Quickbooks
  def new
    start_date = params[:start_date]
    end_date = params[:end_date]
    @timecards = TimecardTransaction.between(start_date, end_date).locked.order(:tc_status, :tc_date, :employee_id)
  end

  # post '/time_trackings - creates new "TimeTrackingAdd Requests" for the Web Connector, only if time card transaction is locked but not already "QB Stored"
  def create
    start_date = params[:start_date]
    end_date = params[:end_date]
    timecards = TimecardTransaction.between(start_date, end_date).locked
    timecards.each_with_index do |t, i|
      request = t.build_request
      # Process each request as a separate job, and store the TimecardTransaction PKEY in the data field. This field can be accessed by the response returned from the Web Connector, so we will use it to find the same TimeCard Transaction and change the status to "QB Stored" if it is successful
      QBWC.add_job("AddTimeCards#{t.id}", true, '', TimeTrackingAddWorker, request, t.id)
    end
    render plain: "OK"
  end

end
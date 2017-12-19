class TimeTrackingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # get '/time_trackings'
  def index
    @times = TimeTracking.all
    render json: @times
  end

  # post '/time_trackings
  def add_request
    start_date = params[:start_date]
    end_date = params[:end_date]
    timecards = TimecardTransaction.between(start_date, end_date).all
    timecards.each_with_index do |t, i|
      new_request = t.build_request
      name = "AddTime_#{i}"
      @job = QBWC.add_job(name, true, '', TimeTrackingAddWorker, new_request)
    end
    render plain: "OK"
  end

    # Take the start and end date and query the database to find:
      #  For each timecard entry that falls between this start date and this end date, get me:
      # - the transaction date
      # - the employee list id
      # - the customer's full name as it would appear in QB (or use list id)
      # - the ticket number (use the ticket # to service the "item service ref" or use "Video:0100 default")
      # - the duration (format this the funky way quickbooks wants it

      # Pass the following params to build request: item_service_ref (or nil), txn_date, employee_list_id, customer_full_name, duration, notes (ticket_id)

    # For each request, add a job to the qbwc job queue (see if Quickbooks supports bulk adds, at the moment it doens't appear to be working, but might just need to use an array instead of a hash?)
     #




  # def time_tracking_params
  #   params.require(:start_date).permit(:end_date)
  # end

end

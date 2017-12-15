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
    timecards = TimecardTransaction.between(start_date, end_date).first
    render plain: timecards.to_s
    # timecard_ids.each do |timecard|
    #
    # end

    # new_request = build_request(params)
    # name = "AddTime_#{Time.now.to_i}"
    # @job = QBWC.add_job(name, true, '', TimeTrackingAddWorker, new_request)
    # if @job
    #   render json: params
    # end
  end


  def build_request(txn_date, employee_list_id, customer_full_name, duration, notes)
    item_service_ref = params['item_service_ref'] ||= "Video:0100"
    {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => params['txn_date'], :entity_ref => {:list_id => params['employee_list_id']}, :customer_ref => {:full_name => params['customer_full_name']}, :item_service_ref => {:full_name => item_service_ref}, :duration => params['duration'], :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "Hourly Level 1"}, :notes => params['notes'], :billable_status => "NotBillable"}}}
  end

  private

  def calculate_timecards
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
  end




  # def time_tracking_params
  #   params.require(:start_date).permit(:end_date)
  # end

end

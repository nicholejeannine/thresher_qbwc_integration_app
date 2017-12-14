class TimeTrackingsController < ApplicationController

  # get '/time_trackings'
  def index
    @times = TimeTracking.all
    render json: @times
  end

  # post '/time_trackings
  def add_request
    respond_to do |format|
      format.json
    end
    # new_request = build_request(params)
    # name = "AddTime_#{Time.now.to_i}"
    @job = QBWC.add_job(name, true, '', TimeTrackingAddWorker, new_request)
    if @job
      render json: params
    end
  end



  def build_request(params)
    item_service_ref = params['item_service_ref'] ||= "Video:0100"
    {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => params['txn_date'], :entity_ref => {:list_id => params['employee_list_id']}, :customer_ref => {:full_name => params['customer_full_name']}, :item_service_ref => {:full_name => item_service_ref}, :duration => params['duration'], :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "Hourly Level 1"}, :notes => params['notes'], :billable_status => "NotBillable"}}}
  end



  # private
  # def time_tracking_params
  #   params.require(:start_date).permit(:end_date)
  # end

end
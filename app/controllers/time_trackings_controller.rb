class TimeTrackingsController < ApplicationController

  # get '/time_trackings'
  def index
    @times = TimeTracking.all
    render json: @times
  end

  # get '/time_trackings_add?employee_list_id=80001440-1460409806&txn_date=2017-12-11&duration=PT8H0M0S&customer_full_name=TCP:IT:P-903&notes=23004'
  def add_request
    new_request = build_request(params)
    name = "AddTime_#{Time.now.to_i}"
    @job = QBWC.add_job(name, true, '', TimeTrackingAddWorker, new_request)
    if @job
      render json: @job
    end
  end



  def build_request(params)
    item_service_ref = params['item_service_ref'] ||= "Video:0100"
    {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => params['txn_date'], :entity_ref => {:list_id => params['employee_list_id']}, :customer_ref => {:full_name => params['customer_full_name']}, :item_service_ref => {:full_name => item_service_ref}, :duration => params['duration'], :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "Hourly Level 1"}, :notes => params['notes'], :billable_status => "NotBillable"}}}
  end



  private
  def time_tracking_params
    params.require(:employee_list_id).permit(:txn_date, :customer_full_name, :item_service_ref, :duration, :notes)
  end

end
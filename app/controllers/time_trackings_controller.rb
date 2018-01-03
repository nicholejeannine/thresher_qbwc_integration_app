class TimeTrackingsController < ApplicationController

  # get '/time_trackings' - time trackings are only returned after successful import (they are received in the response from the QBWC Add Request - so these will all be "QB Stored")
  def index
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @entries = TimeTracking.between(start_date, end_date).all
    else
      @entries = TimeTracking.all
    end
    render json: @entries.to_json(:only => [:customer_full_name, :item_service, :payroll_item_wage, :notes, :employee_full_name], :methods => [:format_qb_duration, :tc_date, :format_notes])
  end

  


end
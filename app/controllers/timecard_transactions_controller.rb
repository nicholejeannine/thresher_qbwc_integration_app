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
      @timecards = TimecardTransaction.between(start_date, end_date).locked.order(:employee_name, :tc_date)
    else
      @timecards = TimecardTransaction.locked.order(:tc_status, :tc_date, :employee_id)
    end
  end

end
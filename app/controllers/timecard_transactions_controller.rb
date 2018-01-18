class TimecardTransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout false

  # get '/timecard_transactions' - "Portal-side" timecards that may or may not have been stored yet
  def index
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @entries = TimecardTransaction.between(start_date, end_date).all
      respond_to do |format|
        format.json {render json: @entries}
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"#{start_date}_timecard_invalid_customers.csv\""
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end
  end
  
  # show the timecard transactions that are in "locked" state
  def new
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @timecards = TimecardTransaction.between(start_date, end_date).locked.sort_by(&:employee_name)
    else
      @timecards = TimecardTransaction.locked.sort_by(&:employee_name)
    end
  end
  
end
class TimecardTransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_entries, only: :index
  layout false

  # get '/timecard_transactions' - "Portal-side" timecards that may or may not have been stored yet
  def index
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
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
  
  private
  # For index method (export to csv), export only the Thresher customer names associated with the unique set of time card transactions that have invalid customers. Reject empty values.
  def set_entries
    start_date = params[:start_date]
    end_date = params[:end_date]
    @entries = TimecardTransaction.between(start_date, end_date).locked.reject{|x|x.valid_customer?}.map{|y|y.customer_full_name}.reject{|y|y.empty?}.uniq
  end
end
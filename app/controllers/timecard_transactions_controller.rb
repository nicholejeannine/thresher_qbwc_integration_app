class TimecardTransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # get '/timecard_transactions'
  def index
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @entries = TimecardTransaction.between(start_date, end_date).all
    else
      @entries = TimecardTransaction.all
    end
  end
  
  def show
    jobs = QBWC::ActiveRecord::Job::QbwcJob.where(:worker_class => "TimeTrackingAddWorker").pluck(:data)
    @timecards = TimecardTransaction.find(jobs)
  end

end
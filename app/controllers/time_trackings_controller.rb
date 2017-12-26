class TimeTrackingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # get '/time_trackings'
  def index
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @entries = TimeTracking.between(start_date, end_date).all
    else
      @entries = TimeTracking.all
    @entries.each do |e|
      e.duration = e.format_qb_duration
      e.txn_date = e.tc_date
    end
    render json: @entries
  end

  # post '/time_trackings
  def add_request
    start_date = params[:start_date]
    end_date = params[:end_date]
    timecards = TimecardTransaction.between(start_date, end_date).all
    timecards.each_with_index do |t, i|
      request = t.build_request
      # Process each request as a separate job, and store the TimecardTransaction PKEY in the data field. This field can be accessed by the response returned from the Web Connector, so we will use it to find the same TimeCard Transaction and change the status to "QB Stored" if it is successful
      QBWC.add_job("AddTimeCards#{t.id}", true, '', TimeTrackingAddWorker, request, t.id)
    end
    render plain: "OK"
  end


end
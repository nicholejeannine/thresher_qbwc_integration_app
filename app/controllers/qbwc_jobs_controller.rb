class QbwcJobsController < ApplicationController
  
  def index
    if params[:all]
      @jobs = QBWC::ActiveRecord::Job::QbwcJob.all
    else
      @jobs = QBWC::ActiveRecord::Job::QbwcJob.where(:worker_class => "TimeTrackingAddWorker")
    end
  end
end

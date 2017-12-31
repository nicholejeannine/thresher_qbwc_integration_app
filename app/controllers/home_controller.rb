class HomeController < ApplicationController
  def index
    @jobs = QBWC::ActiveRecord::Job::QbwcJob.where(:worker_class => "TimeTrackingAddWorker")
  end
end

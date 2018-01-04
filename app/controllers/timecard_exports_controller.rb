class TimecardExportsController < ApplicationController

  # View history of all previous exports
  def index
    @exports = TimecardExport.all
  end
  
  def create
    t = TimecardExport.new
    t.yearweek = Time.now.strftime('%Y-%W')
    t.save
    redirect_to timecard_exports_path
  end


end
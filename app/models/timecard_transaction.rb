class TimecardTransaction < ActiveRecord::Base
  self.primary_key= :id
  belongs_to :employee
  belongs_to :holiday
  belongs_to :project
  belongs_to :ticket
  # grab all ids for timecards between a specified start and end date
  def self.between(start_date, end_date)
    includes(:employee, :holiday, :project).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date)
  end

end
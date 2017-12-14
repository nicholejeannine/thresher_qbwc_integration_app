class TimecardTransaction < ActiveRecord::Base
  belongs_to :employee
  # grab all ids for timecards between a specified start and end date
  def self.between(start_date, end_date)
    where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date)
  end

end
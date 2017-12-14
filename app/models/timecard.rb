class Timecard < ActiveRecord::Base

  # grab all ids for timecards between a specified start and end date
  def self.between(start_date, end_date)
    where('`tc_date1` >= ?', start_date).where('`tc_date1` <= ?', end_date).pluck(:id)
  end
end
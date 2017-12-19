class TimeTracking < ApplicationRecord

  # grab all time tracking entries between a specified start and end date
  def self.between(start_date, end_date)
    where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date)
  end
end

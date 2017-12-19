class TimeTracking < ApplicationRecord

  # grab all time tracking entries between a specified start and end date
  def self.between(start_date, end_date)
    where('`txn_date` >= ?', start_date).where('`txn_date` <= ?', end_date)
  end
end

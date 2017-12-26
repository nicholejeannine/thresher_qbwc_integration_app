class TimeTracking < ApplicationRecord

  # grab all time tracking entries between a specified start and end date
  def self.between(start_date, end_date)
    where('`txn_date` >= ?', start_date).where('`txn_date` <= ?', end_date).order(:employee_full_name, :txn_date)
  end

  # Time tracking in Quickbooks is formatted as "PT8H0M" ... Need to convert to "8.0" for API.
  def format_qb_duration
    hours = self.duration.remove(/PT/).match(/[\d]+/).to_s || 0
    minutes = (self.duration.split("H")[1].remove("M").to_f/60.0 || 0)
    minutes = minutes.to_s.split(".")[1] || 0
    self.duration = "#{hours}.#{minutes}"
  end

  def tc_date
    self.txn_date = txn_date.strftime('%F')
  end

  # Format the "notes" column so that the nulls show up as blanks, instead of the word "null"
  def format_notes
    self.notes = notes.blank? ? "" : notes
  end

end


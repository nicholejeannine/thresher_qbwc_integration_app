# "TimeTracking" is what Quickbooks calls a TimecardTransaction. A "TimeTracking" is therefore a Thresher TimecardTransaction that has been properly handled by Quickbooks. After the entry is imported into Quickbooks, it returns the record as the response, which gets stored in the time_trackings table.

class TimeTracking < ApplicationRecord
  
  self.table_name = 'qb.time_trackings'
  
  FIELD_MAP = {
    :txn_id => 'txn_id',
    :time_created => 'time_created',
    :time_modified => 'time_modified',
    :edit_sequence => 'edit_sequence',
    :txn_date => 'txn_date',
    :employee_list_id => {"entity_ref" => "list_id"},
    :employee_full_name => {"entity_ref" => "full_name"},
    :customer_full_name => {"customer_ref" => "full_name"},
    :item_service => {"item_service_ref" => "full_name"},
    :duration => "duration",
    :payroll_item_wage => {"payroll_item_wage_ref" => "full_name"},
    :notes => "notes",
    :billable_status => "billable_status"
  }

  # grab all time tracking entries between a specified start and end date
  def self.between(start_date, end_date)
    where('`txn_date` >= ?', start_date).where('`txn_date` <= ?', end_date).order(:employee_full_name, :txn_date)
  end

  # Time tracking in Quickbooks is formatted as "PT8H0M" ... Need to convert to "8.0" for display.
  def format_qb_duration
    hours = self.duration.remove(/PT/).match(/[\d]+/).to_s || 0
    minutes = (self.duration.split("H")[1].remove("M").to_f/60.0 || 0)
    minutes = minutes.to_s.split(".")[1] || 0
    self.duration = "#{hours}.#{minutes}"
  end

  # Change the Quickbooks-formatted datetime string to a regular date ("Y-m-d")
  def tc_date
    self.txn_date = txn_date.strftime('%F')
  end

  # Format the "notes" column so that the nulls show up as blanks, instead of the word "null"
  def format_notes
    self.notes = notes.blank? ? " " : notes
  end

end


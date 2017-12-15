class TimecardTransaction < ActiveRecord::Base
  self.primary_key= :id
  belongs_to :employee
  belongs_to :holiday, optional: true
  belongs_to :client
  belongs_to :job, optional: true
  belongs_to :project, optional: true
  belongs_to :ticket, optional: true

  # grab all timecards between a specified start and end date
  def self.between(start_date, end_date)
    includes(:employee, :holiday, :project, :ticket).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date)
  end


  def lookup_customer_name
    "TCP:IT:P-903"
  end

  def qb_duration
    "PT8H0M"
  end

end
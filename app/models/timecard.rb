class Timecard < ActiveRecord::Base

  def self.between(start_date, end_date)
    where('`tc_date1` >= ?', start_date).where('`tc_date1` <= ?', end_date).all
  end
end
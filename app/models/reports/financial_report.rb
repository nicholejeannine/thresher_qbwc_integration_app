class FinancialReport
  attr_accessor :start_date, :end_date
  
  
  def initialize(start_date, end_date)
    self.start_date = start_date
    self.end_date = end_date
  end
  
  def query_estimates
    sql = "SELECT SUBSTRING_INDEX(customer_full_name, ':', 1 ) AS client, sales_rep, COUNT(*) AS count, CONCAT('', TRUNCATE(SUM(total_amount), 2)) AS total FROM `estimates` WHERE time_created BETWEEN '#{start_date}' AND '#{end_date}' GROUP BY sales_rep, client, EXTRACT(YEAR_MONTH FROM `time_created`) ORDER BY sales_rep, client"
    records_array = ActiveRecord::Base.connection.execute(sql).to_a
  end
end
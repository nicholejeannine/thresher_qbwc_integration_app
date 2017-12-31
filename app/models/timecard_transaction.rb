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
    includes(:employee, :holiday, :project, :job, :client, :ticket).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date)
  end

  scope :stored, -> {
    where(:tc_status => "QB Stored")
  }

  scope :locked, -> {
    where(:tc_status => "Locked")
  }

  def lookup_customer_name
    begin
      if holiday_id
        return "TCP:Business"
      elsif self.project_id && self.project.full_name
        self.project.full_name
      elsif self.job_id && self.job.full_name
        self.job.full_name
      else
       self.client.full_name
      end
    rescue NoMethodError => e
      return self.client&.full_name
    rescue StandardError => e
      QbwcError.create(:worker_class => "TimecardTransaction#lookup_customer_name", :model_id => self.id, :error_message => "#{e}")
      return ""
    end
  end

  # Duration comes in as "0.875e1" - need to convert to format like "PT8H45M"
  def qb_duration
    # Convert exponential format to string, then split on the decimal
    t = duration.to_f.to_s.split(".")
    hours = t[0]
    minutes = ("0.#{t[1]}".to_f * 60).to_i
    "PT#{hours}H#{minutes}M"
  end

  def qb_notes
    if holiday_id
      Holiday.where(:date => self.tc_date).first.name
    elsif ticket_id
      self.ticket_id.to_s
    else ""
    end
  end



  def service_code
    self.ticket&.service_code || "Video:0100"
  end


  def qb_payroll_ref
    if holiday_id
      "Hourly Holiday Rate"
    elsif project_id == 914
      "Hourly PTO Rate"
    elsif project_id == 913
      "Hourly TWOP Rate"
    else
    "Hourly Level 1"
    end
  end

  def build_request
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "#{self.lookup_customer_name}"}, :item_service_ref => {:full_name => "#{self.service_code}"}, :duration => "#{qb_duration}", :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "#{self.qb_payroll_ref}"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
  end

end
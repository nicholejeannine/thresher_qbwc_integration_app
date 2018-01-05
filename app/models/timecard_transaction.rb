# A "TimecardTransaction" is a row in the Thresher TimeCardTrans table. It may or may not have been processed by Quickbooks yet. (If tc_status = "QB Stored", it has been processed, and a corresponding record will appear in the "time_trackings" table.

class TimecardTransaction < ActiveRecord::Base
  # We're using a view, so tell the view to treat "id" as a primary key
  self.primary_key= :id
  belongs_to :employee
  belongs_to :holiday, optional: true
  belongs_to :client
  belongs_to :job, optional: true
  belongs_to :project, optional: true
  belongs_to :ticket, optional: true
  belongs_to :qb_employee, class_name: "QbEmployee", foreign_key: "employee_id"

  # Queries for records that have been stored by Quickbooks.
  scope :stored, -> {
    where(:tc_status => "QB Stored")
  }

  # Queries for records that are "Locked" (ready to be processed, but not processed yet)
  scope :locked, -> {
    where(:tc_status => "Locked")
  }

  # A function to determine if the timecard transaction date is a holiday
  def holiday?
    holiday_id.present?
  end
  
  # Determine whether the lookup_customer_name method will produce a valid Quickbooks Customer
  ### TODO: FILL IN THIS METHOD
  def valid_customer?
    true
  end

  # grab all timecards between a specified start and end date
  def self.between(start_date, end_date)
    includes(:employee, :qb_employee, :holiday, :project, :job, :client, :ticket).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date)
  end

  # Attempt to find the Quickbooks Customer name assigned to the current client/job/project/holiday
  def lookup_customer_name
      begin
      if self.project_id && self.project.list_id
        self.project.full_name
      elsif self.job_id && self.job.list_id
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

  # The "duration" field comes in as an exponential number - e.g., "0.875e1".  For Quickbooks to handle it, we need to convert it to a really strange QB format, e.g. "PT8H45M"
  def qb_duration
    t = duration.to_f.to_s.split(".")
    hours = t[0]
    minutes = ("0.#{t[1]}".to_f * 60).to_i
    "PT#{hours}H#{minutes}M"
  end

  # The "notes" field is either the name of the holiday, or the ticket id
  def qb_notes
    if holiday_id
      Holiday.where(:date => self.tc_date).first.name
    elsif ticket_id
      self.ticket_id.to_s
    else ""
    end
  end

  # The service code is determined by the ticket; if nil is returned, the default is "Video:0100"
  def service_code
    self.ticket&.service_code || "Video:0100"
  end

  # The pay rate, according to Quickbooks (Holiday, PTO, TWOP, or Hourly Level 1)
  def qb_payroll_ref
    if project_id == 914
      "Hourly PTO Rate"
    elsif project_id == 913
      "Hourly TWOP Rate"
    else
    "Hourly Level 1"
    end
  end

  # Build the TimeTrackingAdd Request. This looks slightly different for holidays than non-holidays. The QBWC Programmers Guide specifically states NOT to send empty vallues when possible, so the holiday request is necessarily shorter.
  def build_request
    if holiday?
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "TCP:Business"}, :duration => "#{qb_duration}", :payroll_item_wage_ref => {:full_name => "Hourly Holiday Rate"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
    else
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "#{self.lookup_customer_name}"}, :item_service_ref => {:full_name => "#{self.service_code}"}, :duration => "#{qb_duration}", :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "#{self.qb_payroll_ref}"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
    end
  end

end
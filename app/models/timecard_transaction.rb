# A "TimecardTransaction" is a row in the Thresher TimeCardTrans table. It may or may not have been processed by Quickbooks yet. (If tc_status = "QB Stored", it has been processed, and a corresponding record will appear in the "time_trackings" table.

class TimecardTransaction < ActiveRecord::Base
  # We're using a view, so tell the view to treat "id" as a primary key
  self.primary_key= :id
  belongs_to :employee, optional: true
  belongs_to :holiday, optional: true
  belongs_to :ticket, optional: true
  # belongs_to :thresher_customer_full_name, optional: true
  attr_reader :employee_name

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
  
  # grab all timecards between a specified start and end date - only query active employees
  def self.between(start_date, end_date)
    includes(:employee, :holiday, :ticket).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date).where(employees: { is_active: 1 })
  end

  # Attempt to find the Quickbooks Customer name assigned to the current client/job/project/holiday
  def customer_full_name
    c = ""
    if self.holiday_id
        c = "TCP:Business"
    elsif self.project_id
        c = ThresherCustomerFullName.where(:customer_type => "Project").where(:customer_id => self.project_id).first.full_name
    elsif self.job_id
      c = ThresherCustomerFullName.where(:customer_type => "Job").where(:customer_id => self.job_id).first.full_name
    elsif self.client_id
      c = ThresherCustomerFullName.where(:customer_type => "Client").where(:customer_id => self.client_id).first.full_name
    end
    # TODO - NOW CHECK IF THIS RECORD THAT EXISTS IN THE PORTAL EXISTS IN QUICKBOOKS
    if c.blank?
      QbwcTimecardError.create(:worker_class => "TimecardTransaction#customer_full_name", :model_id => self.id, :error_message => "Customer lookup failed")
    end
    c
  end
  
  def valid_customer?
    !customer_full_name.blank?
  end
  
  def employee_name
    "#{self.employee&.last_name}, #{self.employee&.first_name} #{self.employee&.middle_name}".strip
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
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "#{self.customer_full_name}"}, :item_service_ref => {:full_name => "#{self.service_code}"}, :duration => "#{qb_duration}", :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "#{self.qb_payroll_ref}"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
    end
  end

end
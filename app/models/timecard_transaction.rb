# A "TimecardTransaction" is a row in the Thresher TimeCardTrans table. It may or may not have been processed by Quickbooks yet. (If tc_status = "QB Stored", it has been processed, and a corresponding record will appear in the "time_trackings" table.

class TimecardTransaction < ActiveRecord::Base
  # We're using a view, so tell the view to treat "id" as a primary key
  self.primary_key= :id
  
  # belongs_to has optional: true attributes to protect for nulls (in the case of an inactive employee who still has a time card entry, a non-holiday, or hours logged to a project without a ticket)
  belongs_to :employee, optional: true
  belongs_to :holiday, optional: true
  belongs_to :ticket, optional: true
  
  # Lookups are required to obtain the employee's full name and the customer full name (on the portal side)
  attr_reader :employee_name
  attr_reader :customer_full_name

  # Creates a scope of all PORTAL time card records that have been marked as "stored by Quickbooks"
  scope :stored, -> {
    where(:tc_status => "QB Stored")
  }

  # Creates a scope of all PORTAL time card records that have been marked "Locked", eg not yet stored by Quickbooks, but ready to be sent to Quickbooks
  scope :locked, -> {
    where(:tc_status => "Locked")
  }

  # Returns a boolean - was the time card transaction on a holiday?
  def holiday?
    holiday_id.present?
  end
  
  # grab all timecards between a specified start and end date - only query active employees
  # CLEANUP: Create a separate scope for "is active employees", or rename "between" to be more clear that only ACTIVE employees are returned in the scope.
  # THe "includes" command preloads all relevant table table, allowing faster data processing
  def self.between(start_date, end_date)
    includes(:employee, :holiday, :ticket).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date).where(employees: { is_active: 1 })
  end

  # TODO: CHANGE METHOD TO thresher_full_name
  # Checks the calculated thresher_customer_full_name, from the thresher_customer_full_name view.
  # If no match is found, it currently puts an error in the QbwcTimecardError table, with some information about where the error took place
  def customer_full_name
    begin
      if self.holiday_id
        "TCP:Business"
      elsif self.project_id
        ThresherCustomerFullName.where(:customer_type => "Project").where(:customer_id => self.project_id).first.full_name
      elsif self.job_id
        ThresherCustomerFullName.where(:customer_type => "Job").where(:customer_id => self.job_id).first.full_name
      elsif self.client_id
        ThresherCustomerFullName.where(:customer_type => "Client").where(:customer_id => self.client_id).first.full_name
      end
    rescue NoMethodError => e
        return ""
    end
  end
  
  # Checks THIS portal record, and checks the Quickooks customers list for a match
  def valid_customer?
    QbCustomer.where(:full_name => self.customer_full_name).exists?
  end
  
  # Calculates the employee's full name as it is shown in the portal. This is for display purposes ONLY, it is NOT send to Quickboks in the form (when it's sent to Quickbooks, we use the Quickbooks entity_ref_list_id, because that always matches and doesn't change)
  def employee_name
    self.employee&.full_name
  end

  # The "duration" field comes in as an exponential number - e.g., "0.875e1".  For Quickbooks to handle it, we need to convert it to a really strange QB format, e.g. "PT8H45M"
  def qb_duration
    t = duration.to_f.to_s.split(".")
    hours = t[0]
    minutes = ("0.#{t[1]}".to_f * 60).to_i
    "PT#{hours}H#{minutes}M"
  end

  # The "notes" field is either the name of the holiday, or the ticket id, or it is blank.
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

  # Build the TimeTrackingAdd Request. This looks slightly different for holidays than non-holidays. The QBWC Programmers Guide specifically states NOT to send empty values when possible (it could break the XML); holidays require mostly static fields, and fewer lookups, so the request is much shorter.
  def build_request
    if holiday?
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "TCP:Business"}, :duration => "#{qb_duration}", :payroll_item_wage_ref => {:full_name => "Hourly Holiday Rate"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
    else
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "#{self.customer_full_name}"}, :item_service_ref => {:full_name => "#{self.service_code}"}, :duration => "#{qb_duration}", :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "#{self.qb_payroll_ref}"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
    end
  end
  
  # # Export to csv format
  # def self.to_csv
  #   attributes = %w(&:customer_full_name)
  #   CSV.generate do |csv|
  #     csv << attributes
  #   end
  # end

end
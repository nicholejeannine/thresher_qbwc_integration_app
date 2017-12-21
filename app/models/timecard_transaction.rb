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
    includes(:employee, :holiday, :project, :job, :client, :ticket).where('`tc_date` >= ?', start_date).where('`tc_date` <= ?', end_date).where('`tc_status` = "Locked"')
  end


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
      Rails.logger.error("Lookup customer name failed for Timecard #{self.id} with error #{e}")
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



  # $ticketTypeQuery = " SELECT Tick_Type, Tick_subType1, Tick_subType2 FROM Tickets WHERE Tickets_PKEY = '".$ticketID."' ";
  # $ticketTypeArray = pdoGetArray($ticketTypeQuery);
  # $serviceCodeArray = array(0);
  # $i = 0;
  # if(!empty($ticketTypeArray)){// prevent errors while($i <= 2) {$serviceLookupQuery = " SELECT ServiceCode FROM Tickets_List_Type WHERE Tickets_List_Type_PKEY = '".$ticketTypeArray[0][$i]."' "; $serviceLookupArray = pdoGetResult($serviceLookupQuery);
  # if($serviceLookupArray != NULL OR $serviceLookupArray != ""){$serviceCodeArray[] = $serviceLookupArray;} else {$serviceCodeArray[] = 0;}
  # $i++;
  # }
  # }
  # return implode("", $serviceCodeArray);
  def qb_item_service
    # return "Video:0100" unless ticket_id.present?
    # service_code_array = [self.ticket.ticket_type_id, self.ticket.ticket_subtype1_id, self.ticket.ticket_subtype2_id]
    # # return tick_types
    "Video:0100"
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
      {:time_tracking_add_rq => {:time_tracking_add => {:txn_date => "#{tc_date}", :entity_ref => {:list_id => "#{self.employee.employee_list_id}"}, :customer_ref => {:full_name => "#{self.lookup_customer_name}"}, :item_service_ref => {:full_name => "#{self.qb_item_service}"}, :duration => "#{qb_duration}", :class_ref => {:list_id => "200000-991719211"}, :payroll_item_wage_ref => {:full_name => "#{self.qb_payroll_ref}"}, :notes => "#{self.qb_notes}", :billable_status => "NotBillable"}}}
  end

end
class Project < ApplicationRecord
  include QuickbooksQueryable
  
  def self.qb_id
    "list_id"
  end
  
  before_save :titleize_job_status

  def self.parse_qb_response(qb)
    begin
      # First try to find by list id
    p =   Project.where("list_id" => qb['list_id'])&.first
    # Then try to find by full name
    p ||= Project.where("full_name" => qb['full_name'])&.first
    # If it's not found, write to error log. If it's found, let it update.
    if p.nil?
      raise StandardError, "Project Not Found"
    else
      hash =  self.serialize_query_response(qb)
      p.update!(hash)
    end
    rescue StandardError => e
      QbwcError.create(:worker_class => "Project", :model_id => "#{qb["full_name"]}", :error_message => "#{e}")
    end
  end
  
  def self.attributes
    {"list_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "name" => nil, "full_name" => nil, "is_active" => true, "parent_id" => nil, "sublevel" => nil, "company_name" => nil, "salutation" => nil, "first_name" => nil, "middle_name" => nil, "last_name" => nil, "job_title" => nil, "bill_addr1" => nil, "bill_addr2" => nil, "bill_addr3" => nil, "bill_addr4" => nil, "bill_addr5" => nil, "bill_city" => nil, "bill_state" => nil, "bill_postal_code" => nil, "bill_country" => nil, "bill_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "phone" => nil, "alt_phone" => nil, "fax" => nil, "email" => nil, "cc" => nil, "contact" => nil, "alt_contact" => nil, "customer_type" => nil, "terms" => nil, "sales_rep" => nil, "balance" => 0, "total_balance" => 0, "sales_tax_code" => nil, "item_sales_tax" => nil, "account_number" => nil, "job_status" => nil, "job_start_date" => nil, "job_projected_end_date" => nil, "job_end_date" => nil, "job_desc" => nil, "job_type" => nil, "preferred_delivery_method" => nil, "site_contact" => nil, "site_email" => nil, "site_phone" => nil}
  end
  
  # job_status fields come back like "InProgress" - make it save as two separate words.
  def titleize_job_status
    self.job_status = self.job_status&.titleize
  end
end

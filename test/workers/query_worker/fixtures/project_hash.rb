module ProjectHash
  extend ActiveSupport::Concern
  included do
    def qb_hash
      {"xml_attributes" => {}, "list_id" => "1234-1234", "time_created" => "2009-11-06T11:12:43-08:00", "time_modified" => "2017-01-26T09:28:31-08:00", "edit_sequence" => "14824493s06", "name" => "P-1234", "full_name" => "Client:Job:P-1234", "is_active" => true, "parent_ref" => {"xml_attributes" => {}, "list_id" => "1234-1233", "full_name" => "Client:Job"}, "sublevel" => 2, "company_name" => "COMPANYNAME", "salutation" => "SA", "first_name" => "FIRST", "middle_name" => "M", "last_name" => "LAST", "bill_address" => {"xml_attributes" => {}, "addr1" => "ADDR1", "addr2" => "ADDR2", "addr3" => "ADDR3", "addr4" => "ADDR4", "city" => "CITY", "state" => "AA", "postal_code" => "99999"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "ADDR1", "addr2" => "ADDR2", "addr3" => "ADDR3", "city" => "CITY", "state" => "AA", "postal_code" => "99999"}, "phone" => "999-999-9999", "email" => "EMAIL@EMAIL.COM", "alt_phone" => "999-999-9999", "fax" => "999-999-9999", "cc" => "EMAIL@EMAIL.COM", "additional_contact_ref" => [{"xml_attributes" => {}, "contact_name" => "Main Phone", "contact_value" => "(650) 656-7172"}, {"xml_attributes" => {}, "contact_name" => "Main Email", "contact_value" => "hoile@fb.com"}, {"xml_attributes" => {}, "contact_name" => "CC Email", "contact_value" => "ap@fb.com"}, {"xml_attributes" => {}, "contact_name" => "Mobile", "contact_value" => "999-999-9999"}, {"xml_attributes" => {}, "contact_name" => "Other 1", "contact_value" => "p2phelp@fb.com"}], "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "80000013-1462662489", "full_name" => "AAA"},"job_start_date" => "1982-12-30", "job_projected_end_date" => "1982-12-30", "job_end_date" => "1982-12-30"}
    end

    def new_project_record
      {"xml_attributes" => {}, "list_id" => "333", "name" => "P-2467", "full_name" => "ASG:Construction:P-2467"}
    end

  end
end
module TimeTrackingHash
  extend ActiveSupport::Concern
  included do
    def qb_hash
     {"xml_attributes"=>{}, "txn_id"=>"5CA94-1183243364", "time_created"=>"2007-06-30T15:42:44-08:00", "time_modified"=>"2007-06-30T15:42:44-08:00", "edit_sequence"=>"1183243364", "txn_number"=>0, "txn_date"=>"2007-06-11", "entity_ref"=>{"xml_attributes"=>{}, "list_id"=>"5150000-1173314561", "full_name"=>"Apikelis, Roland"}, "customer_ref"=>{"xml_attributes"=>{}, "list_id"=>"49B0000-1133993641", "full_name"=>"Google:Construction"}, "item_service_ref"=>{"xml_attributes"=>{}, "list_id"=>"31A0000-989981084", "full_name"=>"Video:0100"}, "duration"=>"PT8H0M", "class_ref"=>{"xml_attributes"=>{}, "list_id"=>"200000-991719211", "full_name"=>"Video:Cabling Mgmt"}, "payroll_item_wage_ref"=>{"xml_attributes"=>{}, "list_id"=>"E0000-875338868", "full_name"=>"Hourly Level 1"}, "notes"=>"V/C Upgrades", "billable_status"=>"NotBillable"}
    end
  end
end
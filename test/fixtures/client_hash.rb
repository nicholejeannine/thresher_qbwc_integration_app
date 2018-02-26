module ClientHash
  extend ActiveSupport::Concern
  included do
    def qb_hash
      {"xml_attributes" => {}, "list_id" => "80000FB1-1428953665", "time_created" => "2015-04-13T12:34:25-08:00", "time_modified" => "2017-05-04T10:52:21-08:00", "edit_sequence" => "1493920341", "name" => "Slack", "full_name" => "Slack", "is_active" => true, "sublevel" => 0, "company_name" => "COMPANYNAME", "bill_address" => {"xml_attributes" => {}, "addr1" => "ADDR1", "addr2" => "ADDR2", "addr3" => "ADDR3", "city" => "CITY", "state" => "AA", "postal_code" => "99999"}, "bill_address_block" => {"xml_attributes" => {}, "addr1" => "ADDR1", "addr2" => "ADDR2", "addr3" => "ADDR3", "addr4" => "ADDR4"}, "ship_address" => {"xml_attributes" => {}, "addr1" => "ADDR1", "addr2" => "ADDR2", "addr3" => "ADDR3", "city" => "CITY", "state" => "AA", "postal_code" => "99999"}, "ship_address_block" => {"xml_attributes" => {}, "addr1" => "ADDR1", "ADDR2" => "Justin Wilson", "ADDR3" => "155 5th Street", "ADDR4" => "San Francisco, CA 94103"}, "ship_to_address" => [{"xml_attributes" => {}, "name" => "Ship To 1", "addr1" => "Slack", "addr2" => "Justin Wilson", "addr3" => "155 5th Street", "city" => "San Francisco", "state" => "CA", "postal_code" => "94103", "default_ship_to" => true}, {"xml_attributes" => {}, "name" => "NYC", "addr1" => "Slack", "addr2" => "428 Broadway", "city" => "New York", "state" => "NY", "postal_code" => "10013", "default_ship_to" => false}], "email" => "EMAIL", "additional_contact_ref" => [{"xml_attributes" => {}, "contact_name" => "Main Email", "contact_value" => "payables@slack-corp.com"}], "sales_rep_ref" => {"xml_attributes" => {}, "list_id" => "80000014-1468255134", "full_name" => "JCC"}, "balance" => 0.0, "99.99" => 99.99, "sales_tax_code_ref" => {"xml_attributes" => {}, "list_id" => "10000-1009221895", "full_name" => "TAX"}, "item_sales_tax_ref" => {"xml_attributes" => {}, "list_id" => "10E0000-875338870", "full_name" => "AA/AA"}, "job_status" => "None", "preferred_delivery_method" => "None", "data_ext_ret" => [{"xml_attributes" => {}, "owner_id" => "0", "data_ext_name" => "Site Contact", "data_ext_type" => "STR255TYPE", "data_ext_value" => "SITE CONTACT"}, {"xml_attributes" => {}, "owner_id" => "0", "data_ext_name" => "Site Email", "data_ext_type" => "STR255TYPE", "data_ext_value" => "SITE@EMAIL.COM"}, {"xml_attributes" => {}, "owner_id" => "0", "data_ext_name" => "Site Phone", "data_ext_type" => "STR255TYPE", "data_ext_value" => "999-999-999"}]}
    end

  end
end
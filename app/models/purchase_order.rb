class PurchaseOrder < ApplicationRecord
  include QuickbooksQueryable
  has_many :purchase_order_lines
  before_save :parse_memo
  
  def self.qb_id
    "txn_id"
  end
  
  def self.attributes
    {"txn_id" => nil, "time_created" => nil, "time_modified" => nil, "edit_sequence" => nil, "txn_number" => nil, "vendor_id" => nil, "sales_order_id" => nil, "inventory_site" => nil, "ship_to_entity" => nil, "template" => nil, "txn_date" => nil, "ref_number" => nil, "vendor_addr1" => nil, "vendor_addr2" => nil, "vendor_addr3" => nil, "vendor_addr4" => nil, "vendor_addr5" => nil, "vendor_city" => nil, "vendor_state" => nil, "vendor_postal_code" => nil, "vendor_country" => nil, "vendor_note" => nil, "ship_addr1" => nil, "ship_addr2" => nil, "ship_addr3" => nil, "ship_addr4" => nil, "ship_addr5" => nil, "ship_city" => nil, "ship_state" => nil, "ship_postal_code" => nil, "ship_country" => nil, "ship_note" => nil, "terms" => nil, "due_date" => nil, "expected_date" => nil, "ship_method" => nil, "fob" => nil, "total_amount" => 0, "is_manually_closed" => nil, "is_fully_received" => nil, "memo" => nil, "vendor_msg" => nil, "is_to_be_printed" => nil, "is_to_be_emailed" => nil}
  end
  
  def parse_memo
    begin
      if self.sales_order_id.nil? && memo&.downcase&.include?("sales order")
          ref = memo.try(:split)[2].remove(":")
          self.sales_order_id = SalesOrder.where(:ref_number => ref).first&.id
      end
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Purchase Order memo to assign estimate_id: #{e}")
    end
  end
end

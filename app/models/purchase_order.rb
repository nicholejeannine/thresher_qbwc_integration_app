class PurchaseOrder < ApplicationRecord
  has_many :purchase_order_lines
  before_save :parse_memo
  before_save :lookup_vendor
  
  def lookup_vendor
    id = Vendor.find_by("list_id", self.vendor_id).id
    send.send("vendor_id=", id) unless id.nil?
  end

  def self.attributes
    %w(txn_id time_created time_modified edit_sequence txn_number vendor_id sales_order_id inventory_site ship_to_entity template txn_date ref_number vendor_addr1 vendor_addr2 vendor_addr3 vendor_addr4 vendor_addr5 vendor_city vendor_state vendor_postal_code vendor_country vendor_note ship_addr1 ship_addr2 ship_addr3 ship_addr4 ship_addr5 ship_city ship_state ship_postal_code ship_country ship_note terms due_date expected_date ship_method fob total_amount is_manually_closed is_fully_received memo vendor_msg is_to_be_printed is_to_be_emailed)
  end
  
  def parse_memo
    begin
      if self.sales_order_id.nil? && memo&.downcase&.include?("sales order")
          ref = memo.try(:split)[2].remove(":")
          self.sales_order_id = SalesOrder.where(:ref_number => ref).first&.id
      end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Purchase Order memo to assign estimate_id: #{e}")
    end
  end
end

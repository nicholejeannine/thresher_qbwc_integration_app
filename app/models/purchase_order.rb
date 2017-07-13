class PurchaseOrder < ApplicationRecord
  has_many :purchase_order_lines
  before_save :parse_memo
  before_save :lookup_vendor
  
  def lookup_vendor
    id = Vendor.find_by("list_id", self.vendor_id)&.id
    send.send("vendor_id=", id) unless id.nil?
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

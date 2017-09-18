class PurchaseOrder < ApplicationRecord
  include QuickbooksLineItemUtils
  has_many :purchase_order_lines
  before_save :parse_memo

  def parse_memo
    begin
      references = memo.downcase.split(":")
      references.each do |slice|
        if slice.strip.match(/sales order|salesorder/)
          ref = slice.match(/(\d+)/)
          ref = $1
          self.sales_order_id = SalesOrder.where(:ref_number => ref).first&.id
        elsif slice.strip.match(/estimate/)
          ref = slice.match(/(\d+)/)
          ref = $1
          self.estimate_id = Estimate.where(:ref_number => ref)&.first&.id
        end
      end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Purchase Order memo to assign estimate_id or sales order id: #{e}")
    end
  end
end

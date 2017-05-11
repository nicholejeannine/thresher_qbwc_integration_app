class PurchaseOrder < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  has_many :purchase_order_lines
  before_save :parse_memo

  def parse_memo
    begin
      # TODO: put the various common incorrect spellings here to catch most of them
      if self.sales_order_id.nil? memo.downcase.match(/sales order/)
          ref = memo.try(:split)[2].remove(":")
          self.sales_order_id = SalesOrder.where(:ref_number => ref).first&.id
      end
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Purchase Order memo to assign estimate_id: #{e}")
    end
  end
end

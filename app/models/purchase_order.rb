class PurchaseOrder < ApplicationRecord
  include QuickbooksLineItemUtils
  has_many :purchase_order_lines
  before_save :parse_memo

  def parse_memo
    begin
       so = /[sSalesOrder ](\d+)/
       estimate = /[estimate (\d+)]/
       if memo&.downcase&.match(so)
        ref = $1
        self.sales_order_id = SalesOrder.where(:ref_number => ref).first&.id
      end
      if memo&.downcase&.match(estimate)
        e_ref = $1
        self.estimate_id = Estimate.where(:ref_number => e_ref)&.first&.id
      end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Purchase Order memo to assign estimate_id or sales order id: #{e}")
    end
  end
end

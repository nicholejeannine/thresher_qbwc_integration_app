class Invoice < ApplicationRecord
  include QuickbooksLineItemUtils
  has_many :invoice_lines
  has_many :receive_payments, through: :invoices_receive_payments
  before_save :parse_memo

  def self.parse_linked_txn(ret, invoice_id)
    begin
      ret.each do |hash|
        if hash["txn_type"] == "SalesOrder"
        i = Invoice.find(invoice_id)
        txn_id = hash["txn_id"]
        sales_order_id = SalesOrder.find_by("txn_id" => txn_id)&.id
        i.update!({"sales_order_id" => sales_order_id}) unless sales_order_id.nil?
        end
      end
    rescue => e
      QbwcError.create(:worker_class => "Parse Linked Txn Invoice", :model_id => "#{invoice_id}", :error_message => "Error parsing Invoice txn to assign sales_order_id: #{e}")
    end
  end

  def parse_memo
    begin
      if self.estimate_id.nil? && memo&.downcase&.include?("estimate")
        i = memo&.downcase&.remove(":")&.split
        ref = i[i.index("estimate") + 1]
        self.estimate_id = Estimate.where(:ref_number => ref).first&.id
      end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Invoice memo to assign estimate_id: #{e}")
    end
  end
end

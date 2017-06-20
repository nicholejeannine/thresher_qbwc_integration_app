class Invoice < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
  belongs_to :customer, optional: true
  has_many :invoice_lines
  before_save :parse_memo


  def parse_link(hash)
    QbwcError.create(:worker_class => "InvoiceLINK", :error_message => "#{hash}")
    if hash["txn_type"] == "SalesOrder"
      self.sales_order_id = hash["txn_id"]
    end
  end

  def parse_memo
    begin
      if self.estimate_id.nil? && memo&.downcase&.include?("estimate")
        i = memo&.downcase&.remove(":")&.split
        ref = i[i.index("estimate") + 1]
        self.estimate_id = Estimate.where(:ref_number => ref).first&.id
      end
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Invoice memo to assign estimate_id: #{e}")
    end
  end
end

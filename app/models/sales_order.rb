class SalesOrder < ApplicationRecord
  include QuickbooksQueryable
  belongs_to :customer, optional: true
  has_many :sales_order_lines
  before_save :parse_memo
  
  def parse_memo
    begin
    if self.estimate_id.nil? && memo&.downcase&.include?("estimate")
      ref = memo.try(:split)[1].remove(":")
      self.estimate_id = Estimate.where(:ref_number => ref).first&.id
    end
    rescue Exception => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Sales Order memo to assign estimate_id: #{e}")
    end
  end
end

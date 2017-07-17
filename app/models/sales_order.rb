class SalesOrder < ApplicationRecord
  include QuickbooksLineItemUtils
  has_many :sales_order_lines
  before_save :parse_memo
  def parse_memo
    begin
    if memo&.downcase&.include?("estimate")
      ref = memo&.downcase&.from("estimate ".size)&.split(" ")&.first&.remove(":")
      unless ref.nil?
        self.estimate_id = Estimate.where(:ref_number => ref)&.first&.id
      end
    end
    rescue => e
      QbwcError.create(:worker_class => self.class.name, :model_id => self.id, :error_message => "Error parsing Sales Order memo to assign estimate_id: #{e}")
    end
  end
end

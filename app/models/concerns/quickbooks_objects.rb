module QuickbooksObjects
  extend ActiveSupport::Concern
  include QuickbooksReturnTypes
  module ClassMethods
    # Determine if the current model is a "list type" in Quickbooks
  def list_type?
    QBWC.parser.describe("#{self.name}Ref")&.elements&.first&.name == 'ListID'
  end

  # Determine if the current model is a "transaction type" in Quickbooks
  def txn_type?
    QBWC.parser.describe("#{self.name}Ref")&.elements&.first&.name == 'TxnID'
  end

  # Approximate the model attributes by parsing an empty xml request (these elements can be used to generate migration/scaffold templates)
  def elements
    QBWC.parser.describe("#{self.name}Ret").elements.map{|e|e.name.underscore.match(/_ref$/).nil? ? e.name.underscore : [e.name.underscore.remove(/_ref$/).concat('_id'), e.name.underscore.remove(/_ref$/).concat('_full_name')]}.flatten
  end
  
  # Determine if the current model represents a line item type
  def line_item?
    self.name.match(/Line$/)
  end
  end
end
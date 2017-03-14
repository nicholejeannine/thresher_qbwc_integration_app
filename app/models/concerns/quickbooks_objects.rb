module QuickbooksObjects
  extend ActiveSupport::Concern
  include QuickbooksReturnTypes
  module ClassMethods
  def list_type?
    QBWC.parser.describe("#{self.name}Ref")&.elements&.first&.name == 'ListID'
  end
  
  def txn_type?
    QBWC.parser.describe("#{self.name}Ref")&.elements&.first&.name == 'TxnID'
  end

  def approximate_elements
    QBWC.parser.describe("#{self.name}Ret").elements.map{|e|e.name.underscore.match(/_ref$/).nil? ? e.name.underscore : [e.name.underscore.remove(/_ref$/).concat('_id'), e.name.underscore.remove(/_ref$/).concat('_full_name')]}.flatten
  end
  
  def line_item?
    self.name.match('Line$')
  end
  end
end
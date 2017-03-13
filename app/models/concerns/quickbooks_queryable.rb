module QuickbooksQueryable
  extend ActiveSupport::Concern

  # Takes a qb hash and deals with each key/value pair according to its contents.
  # This is the method called by CustomerQueryWorker (and other list-type list workers)
  def parse_qb_hash(qb)
    qb.to_hash.each do |key, value|
      k = QuickbooksReturnType.new(key)
      # skip ignored items. Skip line items unless we're in a line item.
      if k.line_item_type?
        next unless self.class.name.match(/Line/)
      end
      if k.ignored_type?
        next
      elsif k.address?
        handle_address(key, value)
      elsif k.ref_type?
        handle_ref_type(key, value)
      elsif k.custom_type?
        handle_custom_type(value)
      elsif self.respond_to?("#{key}=")
        self.send("#{key}=", value)
      end
    end
  end
end

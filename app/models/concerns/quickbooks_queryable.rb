module QuickbooksQueryable
  extend ActiveSupport::Concern
  include QuickbooksReturnTypes
  # Takes a qb hash and deals with each key/value pair according to its contents.
  # This is the method called by CustomerQueryWorker (and other list-type list workers)
  def parse_qb_hash(qb)
    qb.to_hash.each do |key, value|
      # skip ignored items. Skip line items unless we're in a line item.
      if line_item_type?(key)
        next unless self.class.name.match(/Line/)
      end
      next if ignored_type?(key)
      if address?(key)
        handle_address(key, value)
      elsif ref_type?(key)
        handle_ref_type(key, value)
      elsif custom_type?(key)
        handle_custom_type(value)
      else update_attribute(key, value)
      end
    end
  end

  def handle_address(key, value)
    if value && value.is_a?(Qbxml::Hash)
      value.each do |k, v|
        update_attribute("#{key}_#{k}", v)
      end
    end
  end

  # Handle reference types - save the "list_id" and "full_name" values, only if those fields are in the DB
  def handle_ref_type(key, value)
    begin
      name = key.remove(/_ref$/)
      update_attribute("#{name}_id", value['list_id'])
      update_attribute("#{name}_full_name", value['full_name'])
    rescue Exception => e
      QbwcError.create(:worker_class => "#{self.class}", :model_id => "#{self.id}", :error_message => "#{e} in persisting #{key}")
    end
  end

  # Customer objects have custom fields - this method parses the value returned for this part of a qb hash
  def handle_custom_type(value)
    value.to_a.each do |arr|
      if arr['data_ext_name'] == 'Site Contact'
        update_attribute("primary_contact", "#{arr['data_ext_value']}")
      elsif arr['data_ext_name'] == 'Site Email'
        update_attribute("primary_email", "#{arr['data_ext_value']}")
      elsif arr['data_ext_name'] == 'Site Phone'
        update_attribute("primary_phone", "#{arr['data_ext_value']}")
      end
    end
  end

  def update_attribute(column_name, new_value)
    self.send("#{column_name}=", new_value) if self.respond_to?("#{column_name}=")
  end
end

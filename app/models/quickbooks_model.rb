class QuickbooksModel < ActiveRecord::Base
  include QuickbooksQueryable

  # Handle each piece of an address
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

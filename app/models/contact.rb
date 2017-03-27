class Contact < ApplicationRecord
  include QuickbooksQueryable
  def self.handle_contact(hash, klass, id)
    begin
      contact_instance = Contact.find_or_initialize_by(:id => id, :contact_type => klass)
      contact_instance.update_attribute('primary_contact', nil)
      contact_instance.update_attribute('primary_email', nil)
      contact_instance.update_attribute('primary_phone', nil)
      hash.each do |k, v|
        if k.match(/data_ext_ret/)
          # Customer objects have custom fields
          v.each do |arr|
            if arr['data_ext_name'] == 'Site Contact'
              contact_instance.update_attribute("primary_contact", arr['data_ext_value'])
            elsif arr['data_ext_name'] == 'Site Email'
              contact_instance.update_attribute("primary_email", arr['data_ext_value'])
            elsif arr['data_ext_name'] == 'Site Phone'
              contact_instance.update_attribute("primary_phone", arr['data_ext_value'])
            end
          end
        else
          contact_instance.update_attribute(k, v)
        end
      end
      contact_instance.save
    rescue Exception => e
      QbwcError.create(:worker_class => "Contact: #{klass}", :model_id => "#{id}", :error_message => "#{e}")
    end
  end
end
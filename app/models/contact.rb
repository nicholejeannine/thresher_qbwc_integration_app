class Contact < ApplicationRecord
  include QuickbooksQueryable
  def self.handle_contact(id, hash = nil)
    begin
      contact_instance = Contact.find_or_initialize_by(:id => id)
      contact_instance.send('site_contact=', nil)
      contact_instance.send('site_email=', nil)
      contact_instance.send('site_phone=', nil)
      contact_instance.save
      hash&.each do |k, v|
        if k.match(/data_ext_ret/)
          # Customer objects have custom fields
          v.each do |arr|
            if arr['data_ext_name'] == 'Site Contact'
              contact_instance.update_attribute("site_contact", arr['data_ext_value'])
            elsif arr['data_ext_name'] == 'Site Email'
              contact_instance.update_attribute("site_email", arr['data_ext_value'])
            elsif arr['data_ext_name'] == 'Site Phone'
              contact_instance.update_attribute("site_phone", arr['data_ext_value'])
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
class Contact < ApplicationRecord
  include QuickbooksQueryable
  def self.handle_contact(hash, klass, id)
    begin
      contact_instance = Contact.find_or_initialize_by(:id => id, :contact_type => klass)
      contact_instance.update_attribute('primary_contact', nil)
      contact_instance.update_attribute('primary_email', nil)
      contact_instance.update_attribute('primary_phone', nil)
      hash.each do |k, v|
        if custom_type?(k)
          # Customer objects have custom fields
          v.each{|i| contact_instance.send("#{i['data_ext_name'].sub('Site ', 'primary').underscore}=", "#{i['data_ext_value']}")}
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

class Contact < ApplicationRecord
  include QuickbooksQueryable
  def self.handle_contact(hash, klass, id)
    begin
      contact_instance = Contact.find_or_initialize_by(:id => id, :contact_type => klass)
      hash.each do |k, v|
        if k.match(/data_ext_ret/)
          contact_instance.site_contact = hash['data_ext_ret']&.select{|x|x.has_value?("Site Contact")}.map{|x|x.values_at("data_ext_value")}
          contact_instance.site_phone = hash['data_ext_ret']&.select{|x|x.has_value?("Site Phone")}.map{|x|x.values_at("data_ext_value")}
          contact_instance.site_email = hash['data_ext_ret']&.select{|x|x.has_value?("Site Email")}.map{|x|x.values_at("data_ext_value")}
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
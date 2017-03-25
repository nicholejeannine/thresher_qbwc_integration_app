class Address < ActiveRecord::Base
  extend QuickbooksTypes
  self.abstract_class = true
  
  def self.handle_address(key, value, klass, id)
    begin
      address_instance = key.classify.constantize.find_or_initialize_by(:id => id, :addressable_type => klass)
      # if value && value.is_a?(Qbxml::Hash)
        value.each do |k, v|
          address_instance.send("#{k}=", v) unless ignored_type?(k)
        end
      # end
      address_instance.save
    rescue Exception => e
      QbwcError.create(:worker_class => "#{address_instance.class.name}: klass}", :model_id => "#{id}", :error_message => "Address parsing error: #{e}")
    end
  end
end
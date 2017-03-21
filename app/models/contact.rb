class Contact < ApplicationRecord
	include QuickbooksQueryable

 def attributes
  {:id => nil, :contact_type => nil, :salutation => nil, :first_name => nil, :middle_name => nil, :last_name => nil, :job_title => nil, :phone => nil, :alt_phone => nil, :fax => nil, :email => nil, :cc => nil, :contact => nil, :alt_contact => nil, :primary_contact => nil, :primary_email => nil,:primary_phone  => nil }
 end
end

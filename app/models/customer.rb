class Customer < ApplicationRecord
	self.abstract_class = true
	def self.parse_customer_response(qb)
		unless qb.has_key?('data_ext_ret')
			qb.merge!('data_ext_ret' => nil)
		end
		if qb['sublevel'] == 0 && !qb['name'].upcase.start_with?('P-')
			client_exclusion_keys = %w('name', 'parent_id', 'sublevel', 'job_status', 'job_start_date', 'job_projected_end_date', 'job_end_date', 'job_desc')
			Client.parse_qb_response(qb.extract!(*client_exclusion_keys))
			QbwcError.create(:worker_class => 'Client - QB', :model_id => qb['list_id'], :error_message => qb)
		elsif qb['sublevel'] > 0 && !qb['name'].upcase.start_with?('P-')
			Job.parse_qb_response(qb)
		elsif qb['sublevel'] > 0 && qb['name'].upcase.start_with?('P-')
			Project.parse_qb_response(qb)
		end
	end
end


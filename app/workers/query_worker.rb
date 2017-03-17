class QueryWorker < QBWC::Worker

	def requests

	end

	def handle_response(r, session, job, request, data)
		QBWC.delete_job(job)
		QbwcError.create(:worker_class => self.class.name, :error_message => data)
	end
end
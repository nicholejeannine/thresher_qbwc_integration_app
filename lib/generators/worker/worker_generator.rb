class WorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  # id_type should be list_id or txn_id
  def copy_list_worker
    template('ListWorker.rb', "app/workers/list_#{name.underscore}_worker.rb", {'name' => name })
  end

end

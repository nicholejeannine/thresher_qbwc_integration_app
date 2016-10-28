class WorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_list_worker
    template('ListWorker.rb', "app/workers/#{name.underscore}_worker.rb", {:name => name})
  end

end

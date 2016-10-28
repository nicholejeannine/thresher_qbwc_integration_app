class WorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_worker
    template('Worker.rb', "app/workers/#{name.underscore}_worker.rb", {:name => name})
  end

end

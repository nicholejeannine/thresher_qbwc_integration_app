class QueryWorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :args
  
  def generate
    arguments = args.flat_map(&:to_s).join(" ")
    in_root { run_ruby_script("bin/rails generate model #{name} #{arguments}", verbose: false) }
  end
end

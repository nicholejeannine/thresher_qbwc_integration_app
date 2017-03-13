class QueryWorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  def generate
    arguments = elements.flat_map(&:to_s).join(" ")
    in_root { run_ruby_script("bin/rails generate model #{name} #{arguments} --parent=QuickbooksModel --no-migration", verbose: false) }
    in_root { run_ruby_script("bin/rails generate migration Create#{name.classify} #{arguments}", verbose: false) }
  end

  def copy_worker
    template('query_worker.rb', "app/workers/#{name.underscore}_query_worker.rb")
  end
  
  def elements
    QBWC.parser.describe('ReceivePaymentRet').elements.map{|e|e.name.underscore}
  end
  
end

class QueryWorkerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  def generate
    arguments = elements(&:to_s).join(" ")
    in_root { run_ruby_script("bin/rails generate model #{name.classify} #{arguments}") }
      in_root { run_ruby_script("bin/rails generate model #{name.classify}Line #{arguments}") }
  end

  def copy_worker
    type = QBWC.parser.describe("#{name}Ret").elements.first.name
    if type == 'ListID'
    template('list_query_worker.rb', "app/workers/#{name.underscore}_query_worker.rb")
    elsif type == 'TxnID'
      template('txn_query_worker.rb', "app/workers/#{name.underscore}_query_worker.rb")
    end
  end

  def elements
    QBWC.parser.describe("#{name}Ret").elements&.map{|e|e.name.underscore.match(/_ref$/).nil? ? e.name.underscore : [e.name.underscore.remove(/_ref$/).concat('_id'), e.name.underscore.remove(/_ref$/).concat('_full_name')]}&.flatten
  end
  
end

namespace :db do
  desc "Update and create SQL views"
  task :views => :environment do
    STDERR.puts "Don't run these view from this program. Leave them alone."
  end # task
end
# Load the Rails application.
require_relative 'application'
Rails.application.configure do
  config.autoload_paths << "#{Rails.root}/app/models/reports"
end
# Initialize the Rails application.
Rails.application.initialize!

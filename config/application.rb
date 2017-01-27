require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railstest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.assets = false
      g.helper = false
      g.stylesheets_engine = :scss
      g.test_framework = :rspec
    end

    config.beginning_of_week = :sunday

    config.autoload_paths += %W(
    #{config.root}/vendor
    )
    config.assets.paths << Rails.root.join('vendor', 'assets', 'lib')
  end
end

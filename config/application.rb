require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railstest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.api_only = :true

    config.beginning_of_week = :sunday

    QBWC.session_complete_success = lambda do |session|
      total_time = Time.now - session.began_at
      QbwcError.create(:worker_class => 'Success', :error_message => "Total run time of worker was #{total_time} seconds")
    end
    config.time_zone = 'Pacific Time (US & Canada)'
  end
end

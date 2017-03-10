source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0', '>= 5.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.4.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
#gem 'rack-cors'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Provides a better error page for Rails and other Rack apps. Includes source code inspection, a live REPL and local/instance variable inspection for all stack frames.
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  # Retrieve the binding of a method's caller. Can also retrieve bindings even further up the stack.
  gem 'binding_of_caller', '~> 0.7.2'
  # Testing framework
end

group :development do
  # Access a console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '~> 3.4'
  # Use pry as web console
  gem 'pry-rails', '~> 0.3.4'
  # The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!
  gem 'listen', '~> 3.1', '>= 3.1.5'
  # Preloads app so things like console, rake and tests run faster
  gem 'spring', '~> 2.0', '>= 2.0.1'
  # Makes spring watch files using the listen gem.
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'


end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Quickbooks web connector
gem 'qbwc', github: 'qbwc/qbwc'
gem 'qbxml', github: 'qbwc/qbxml'

# Easily and efficiently make ActiveRecord models support hierarchies https://github.com/mceachen/closure_tree
#gem 'closure_tree', github: "mceachen/closure_tree"

# because winblows is suck, you add this thing:
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

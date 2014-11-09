source 'https://rubygems.org'
ruby '2.1.4'

# Rails
gem 'rails', '4.1.7'

# Asset preprocessors
gem 'sass-rails', '4.0.3'
gem 'uglifier'
gem 'coffee-rails'

# Assets
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'

# Views
gem 'haml-rails'
gem 'simple_form', '~> 3.1.0.rc1', github: 'plataformatec/simple_form', branch: 'master'
gem 'high_voltage'

# JavaScript runtime
gem 'therubyracer', platform: :ruby

# Web server
gem 'thin'

# Configuration management
gem 'figaro'

# I18n
gem 'rails-i18n'

# Active Record
gem 'pg'
gem 'enumerize'

# Asynchronous jobs
gem 'sidekiq'
gem 'clockwork'

# Freshdesk integration
gem 'httparty'

# API
gem 'jbuilder'

# Monitoring
gem 'newrelic_rpm'

group :development do
  # Bower assets
  gem 'bower-rails'

  # Error reporting
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]

  # Deployment
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'

  # Process management
  gem 'foreman'

  # Continuous testing
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false

  # Views
  gem 'html2haml'

  # Asset logging suppression
  gem 'quiet_assets'

  # Console
  gem 'pry-rails'
  gem 'pry-rescue'

  # Preloading
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  # Factories
  gem 'factory_girl_rails'

  # RSpec
  gem 'rspec-rails'
end

group :test do
  # Database cleansing
  gem 'database_cleaner'

  # Acceptance testing
  gem 'capybara'
  gem 'launchy'
  gem 'rack_session_access'
  gem 'poltergeist'

  # Factories
  gem 'faker'

  # RSpec
  gem 'shoulda-matchers', require: false
  gem 'fuubar'

  # Mocking
  gem 'mocha'
end

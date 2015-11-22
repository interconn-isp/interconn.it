source 'https://rubygems.org'
ruby '2.2.3'

# Rails
gem 'rails', '4.2.5'

# Asset preprocessors
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

# Assets
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'

# Views
gem 'haml-rails'
gem 'simple_form'
gem 'high_voltage'

# JavaScript runtime
gem 'therubyracer', platform: :ruby

# Web server
gem 'thin'

# Configuration management
gem 'figaro'

# I18n
gem 'rails-i18n'

# Database
gem 'pg'
gem 'enumerize'
gem 'friendly_id'
gem 'active_hash', '1.4.0'

# Controllers
gem 'responders'

# Asynchronous jobs
gem 'sidekiq'

# API
gem 'jbuilder'

# Monitoring
gem 'newrelic_rpm'

# Logging
gem 'lograge'

# Heroku
gem 'rails_12factor', group: :production

# Process management
gem 'foreman'

# Bower assets
gem 'bower-rails'

group :development do
  # Deployment
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'

  # Asset logging suppression
  gem 'quiet_assets'

  # Console
  gem 'pry-rails'
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
  gem 'shoulda-matchers'
  gem 'fuubar'

  # Mocking
  gem 'mocha'
  gem 'webmock'
end

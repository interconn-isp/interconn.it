source 'https://rubygems.org'
ruby '2.5.0'

# Rails
gem 'rails', '~> 5.1.4'

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

# Web server
gem 'thin'

# Configuration management
gem 'figaro'

# I18n
gem 'rails-i18n'

# Database
gem 'pg', '~> 0.21'
gem 'enumerize'
gem 'friendly_id'
gem 'active_hash', '1.4.0'

# Controllers
gem 'responders'

# Asynchronous jobs
gem 'sidekiq'

# API
gem 'jbuilder'

# Logging
gem 'lograge'

# Process management
gem 'foreman'

# Bower assets
gem 'bower-rails'

# 3rd-party APIs
gem 'rest-client'

# Caching
gem 'redis-rails'

group :production do
  # Error tracking
  gem 'bugsnag'
end

group :development do
  # Console
  gem 'pry-rails'

  # Coding style
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :development, :test do
  # Factories
  gem 'factory_bot_rails'

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

  # CI
  gem 'rspec_junit_formatter'
end

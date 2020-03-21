# frozen_string_literal: true

source 'https://rubygems.org'
ruby '~> 2.6'

# Rails
gem 'rails', '~> 5.2'

# Asset preprocessors
gem 'coffee-rails'
gem 'sass-rails'
gem 'uglifier'

# Assets
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'jquery-rails'

# Views
gem 'haml-rails'
gem 'high_voltage'
gem 'simple_form'

# Web server
gem 'puma'

# Configuration management
gem 'figaro'

# I18n
gem 'rails-i18n'

# Database
gem 'active_hash', '1.4.0'
gem 'enumerize'
gem 'friendly_id'
gem 'pg', '~> 0.21'

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
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
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
  gem 'apparition'
  gem 'capybara'
  gem 'launchy'
  gem 'rack_session_access'

  # Factories
  gem 'faker'

  # RSpec
  gem 'fuubar'
  gem 'shoulda-matchers'

  # Mocking
  gem 'mocha'
  gem 'webmock'

  # CI
  gem 'rspec_junit_formatter'
end

source 'https://rubygems.org'
ruby '2.1.2'

# Rails
gem 'rails', '4.1.4'

# Asset preprocessors
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# Assets
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'

# Views
gem 'haml-rails'
gem 'simple_form', '~> 3.1.0.rc1', github: 'plataformatec/simple_form', branch: 'master'
gem 'high_voltage', '~> 2.2.0'

# JavaScript runtime
gem 'therubyracer', platform: :ruby

# Web server
gem 'thin'

# Configuration management
gem 'figaro'

# I18n
gem 'rails-i18n'
gem 'devise-i18n'

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

group :development do
  # Bower assets
  gem 'bower-rails'

  # Error reporting
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]

  # Deployment
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'capistrano-sidekiq' , github: 'seuros/capistrano-sidekiq'

  # Process management
  gem 'foreman'

  # Continuous testing
  gem 'guard-bundler'
  gem 'guard-rails'
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

  # Mocking
  gem 'mocha'

  # API testing
  gem 'webmock'
  gem 'vcr'
end

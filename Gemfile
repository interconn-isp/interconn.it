source 'https://rubygems.org'
ruby '2.1.2'

# Rails
gem 'rails', '4.1.4'

# Asset preprocessors
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# Assets
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'jquery-turbolinks'
gem 'font-awesome-rails'

# Views
gem 'haml-rails'
gem 'simple_form'
gem 'high_voltage', '~> 2.2.0'

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

# Heroku
group :production do
  gem 'rails_12factor'
end

group :development do
  # Error reporting
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]

  # Deployment
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'

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
end

group :development, :test do
  # Factories
  gem 'factory_girl_rails'

  # Console
  gem 'pry-rails'
  gem 'pry-rescue'

  # RSpec
  gem 'rspec-rails'
end

group :test do
  # Database cleansing
  gem 'database_cleaner'

  # Acceptance testing
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'

  # Factories
  gem 'faker'
end

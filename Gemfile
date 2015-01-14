source 'https://rubygems.org'

gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'pg'
gem 'activeadmin'
gem 'hpricot'
gem 'haml', '~> 4.0.6'
gem 'formtastic'
gem "meta_search"
gem 'haml-rails'
gem 'sendgrid'

gem 'sass', '~> 3.2.15'
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.3'
gem 'tilt'

gem 'airbrake'
gem 'jquery-rails'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'

gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'draper'

gem 'money-rails'
gem 'cancan'
gem 'uuid' #UUID.generate
#gem 'ice_cube' for scheduling

gem 'tzinfo'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

group :development do
  gem 'ruby_parser'
  gem 'brakeman'
  gem 'letter_opener'
  gem 'rails-erd'

  gem 'sextant' #rake routes on http://localhost:3000/rails/routes
  gem "better_errors"
  gem "binding_of_caller"
  gem 'quiet_assets' #turns off the Rails asset pipeline log. E.g. Served asset /application.js - 304 Not Modified (8ms)
end

group :test do
  gem 'ci_reporter'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-byebug'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

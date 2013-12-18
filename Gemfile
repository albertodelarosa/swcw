source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'pg'
gem 'activeadmin'
gem 'hpricot'
gem 'haml'
gem 'formtastic'
gem "meta_search",    '>= 1.1.0.pre'
gem 'haml-rails'

gem 'bootstrap3-rails'
gem 'anjlab-bootstrap-rails', '>= 3.0.2.0', :require => 'bootstrap-rails'
gem "breadcrumbs_on_rails"

gem 'airbrake'
gem 'jquery-rails', '~> 2.3.0'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'

gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'draper', '~> 1.3'

gem 'money-rails', "~> 0.8.1"
gem 'cancan'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
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
  gem 'factory_girl_rails'
  gem 'capybara' 
  gem 'guard-rspec' 
  gem 'launchy'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
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

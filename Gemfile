source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
#gem 'rails', '~> 4.2', '>= 4.2.6'

# Use thin as server
gem 'thin'

# Use postgresql as the database for Active Record
gem 'pg'

# Use hamle for html
gem 'haml-rails'

# Use html2haml to hamlfy erb files
gem "html2haml"

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc'

# Use bootstrap for front-end framework
gem 'bootstrap-sass'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'

# User activeadmin for admin
gem 'activeadmin', github: 'activeadmin'

gem 'hpricot'
gem 'formtastic'

#gem 'sprockets_better_errors'
# use ransack for extensible searching
gem 'ransack'

#use airbrake for bug tracking for dev and prod
gem 'airbrake'

#use devise for system login
gem 'devise'

#Use omniauth for social media login
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'

#use sendgrid for system email
gem 'sendgrid'

gem 'draper'

gem 'money-rails'
gem 'cancan'
gem 'uuid' #UUID.generate
#gem 'ice_cube' for scheduling

gem 'tzinfo'

# use braintree for merchant processing
#gem 'braintree'

# Use for parallax scroll
#gem 'scrollmagicjs-rails'
#gem 'modernizr-rails'
#gem 'skrollr-rails'
#gem 'parallax-rails'

# Gems used only for assets and not required
# in production environments by default.
group :development do
  gem 'ruby_parser'
  gem 'brakeman'
  gem 'letter_opener'
  gem 'guard-rspec', require: false

  # Generate Entity-Relationship Diagrams
  gem "rails-erd"

  gem 'sextant' #rake routes on http://localhost:3000/rails/routes

  #gem "better_errors" replacement
  gem 'web-console', '~> 3.0'

  gem "binding_of_caller"
  gem 'quiet_assets' #turns off the Rails asset pipeline log. E.g. Served asset /application.js - 304 Not Modified (8ms)
end

group :test do
  gem 'ci_reporter'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false

  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'

  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver', '~> 2.52'
end

group :test, :development do
  # Use rspec for testing
  gem 'rspec-rails'

  gem 'factory_girl_rails', "~> 4.0"
  gem 'pry-byebug'
end

#gem 'rails_12factor', group: :production

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

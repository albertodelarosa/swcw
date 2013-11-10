source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'unicorn', :group => [:production] #https://devcenter.heroku.com/articles/rails-unicorn
gem 'thin', :group => [:test, :development]
gem 'pg', '0.14.1'
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'


gem 'devise', '2.2.4'
gem 'cancan'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'symmetric-encryption'
gem 'activemerchant'



gem 'airbrake'



gem 'activeadmin'
#gem "ransack" #object based searching, maybe later


gem 'paypal_adaptive'



gem 'formtastic'
gem "meta_search",    '>= 1.1.0.pre'


gem 'fastimage'


gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'
gem 'bootstrap-sass-rails'
gem 'font-awesome-sass-rails'


gem 'money-rails', "~> 0.8.1"


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
#  gem 'therubyracer'
  gem 'letter_opener'
  gem 'rails-erd'
end

group :test do
  gem 'ci_reporter'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'factory_girl_rails'
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

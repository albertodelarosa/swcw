# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'herokuapp.com',
  :enable_starttls_auto => true
}
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = Rails.application.secrets.bt_merchant_id
Braintree::Configuration.public_key  = Rails.application.secrets.bt_public_key
Braintree::Configuration.private_key = Rails.application.secrets.bt_private_key

# Initialize the rails application
Sitelerwash::Application.initialize!


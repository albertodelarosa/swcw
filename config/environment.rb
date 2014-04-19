# Load the rails application
require File.expand_path('../application', __FILE__)

#ActionMailer::Base.smtp_settings = {
  #:user_name => 'betodelarosa',
  #:password => '1952Chevy',
  #:domain => 'enigmatic-inlet-5364.herokuapp.com',
  #:address => 'smtp.sendgrid.net',
  #:port => 587,
  #:authentication => :plain,
  #:enable_starttls_auto => true
#}

# Initialize the rails application
Sitelerwash::Application.initialize!


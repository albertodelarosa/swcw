Sitelerwash::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  config.action_mailer.default_url_options = { :host => 'localhost:3001' }

  config.action_mailer.delivery_method = :letter_opener

  #config.action_mailer.smtp_settings = {
    #address:              'smtp.gmail.com',
    #port:                 587,
    #domain:               'gmail.com',
    #user_name:            ENV['GMAIL_USERNAME'],
    #password:             ENV['GMAIL_PASSWORD'],
    #authentication:       'plain',
    #enable_starttls_auto: true  }

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Do care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Send emails
  config.action_mailer.perform_deliveries = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  #:consumer_key, 
  #:consumer_secret, 
  #:access_token, 
  #:token_secret, 
  #:realm
  #
  #
  #credit_card_options = {first_name: "Alberto", last_name: "de la Rosa", month: '9', year: "2016", brand: "visa", number: "4242424242424242", verification_value: "123"}
  #credit_card = ActiveMerchant::Billing::CreditCard.new(credit_card_options)
  #gateway_options = {billing_address: {name: "Alberto de la Rosa", address: "123 Main Street", city: "New York", state: "NY", country: "US", zip: "10001"}}
  #gateway_options = {ip: "", billing_address: {name: "Alberto de la Rosa", address: "123 Main Street", city: "New York", state: "NY", country: "US", zip: "10001"}}
  #gateway_response = GATEWAY.purchase(13000, credit_card, gateway_options)

  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test

    ::GATEWAY = ActiveMerchant::Billing::QuickbooksGateway.new(
      consumer_key:     QB_CREDS['dev_secret'],
      consumer_secret:  QB_CREDS['secret'],
      access_token:     QB_CREDS['access_token'],
      token_secret:     QB_CREDS['access_token_secret'],
      realm:            QB_CREDS['dev_realm']
    )
  end
end

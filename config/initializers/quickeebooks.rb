$qb_oauth_consumer = OAuth::Consumer.new(Rails.application.secrets.qb_consumer_key, Rails.application.secrets.qb_consumer_secret, {
  site:                "https://oauth.intuit.com",
  request_token_path:  "/oauth/v1/get_request_token",
  authorize_url:       "https://appcenter.intuit.com/Connect/Begin",
  access_token_path:   "/oauth/v1/get_access_token"
})


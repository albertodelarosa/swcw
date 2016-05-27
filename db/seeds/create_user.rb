printStarting("ADDING USER")
developer = User.new(
  email:      Rails.application.secrets.user_email,
  password:   Rails.application.secrets.user_password,
  last_name:  Rails.application.secrets.user_last_name,
  first_name: Rails.application.secrets.user_first_name,
  salutation: Rails.application.secrets.user_salutation
)
developer.skip_confirmation!
developer.save! if Rails.env.eql?( "development" )
printFinished()


printStarting("ADDING DEVELOPER USER")
developer = User.create!(
  email:      Rails.application.secrets.user_email,
  username:   Rails.application.secrets.user_username,
  password:   Rails.application.secrets.user_password,
  last_name:  Rails.application.secrets.user_last_name,
  first_name: Rails.application.secrets.user_first_name,
  salutation: Rails.application.secrets.user_salutation
)
developer.skip_confirmation!
developer.save!
printFinished()

printStarting("ADDING ALL DEVELOPER ASSOCIATIONS")

printStarting("ASSOCIATING DEVELOPER HOME ADDRESS")
developer.home_address =
  HomeAddress.create!(
    street1: Rails.application.secrets.user_street1,
    city:    Rails.application.secrets.user_city,
    state:   Rails.application.secrets.user_state,
    zip:     Rails.application.secrets.user_zip
  )
printFinished()

printStarting("ASSOCIATING DEVELOPER HOME CONTACT INFO")
developer.home_contact_info = HomeContactInfo.create!(mobile: Rails.application.secrets.user_mobile)
printFinished()


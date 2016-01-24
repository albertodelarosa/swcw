printStarting("CREATING ACCOUNT LIST")

account = Account.create!(
  status:           "new",
  sd_percent:       10.5,
  regular_allowed:  true,
  coupons_allowed:  true
)
developer = User.find_by(email: Rails.application.secrets.user_email)
account.user = developer
developer.account = account

printFinished()


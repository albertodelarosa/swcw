printStarting("CREATING ACCOUNT LIST")

account = Account.create!(
  status:           "new",
  sd_percent:       10.5,
  regular_allowed:  true,
  coupons_allowed:  true
)
account.user = User.find_by(email: Rails.application.secrets.user_email)

printFinished()


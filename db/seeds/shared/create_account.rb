printStarting("CREATING ACCOUNT LIST")

Account.create!(
  account_number:   UUID.generate,
  status:           "new",
  sd_percent:       10.5,
  regular_allowed:  true,
  coupons_allowed:  true
)

printFinished()


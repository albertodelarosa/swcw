printStarting("ADDING ALL ASSOCIATIONS")
account = Account.all.first
associate_account_user(account)
create_user_home_info(account.user)
associate_account_companies(account, ["google%", "genentech%"])
create_user_work_info(account)
associate_account_sites(account)
#associate_account_vehicle(account) if account.vehicles.empty?
#associate_account_appointments(account)


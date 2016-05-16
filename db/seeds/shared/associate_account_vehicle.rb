printStarting("CREATING ACCOUNT VEHICLE")
Account.find(Account.all.first.id).vehicles << Vehicle.all.first
printFinished()


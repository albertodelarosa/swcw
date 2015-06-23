6.times{puts}
5.times{seedEnvironment()}

printStarting("DELETING ADMIN USERS")
AdminUser.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING ACCOUNTS")
Account.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING USERS")
User.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING SITES")
Site.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING COMPANIES")
Company.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING VEHICLES")
Vehicle.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING APPOINTMENTS")
Appointment.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING TYPES")
VehicleType.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING DOORS")
VehicleDoor.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING SIZES")
VehicleSize.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING SITELER DOLLARS")
SitelerDollar.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING DISCOUNTS")
Discount.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING SERVICE PLANS")
ServicePlan.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING SERVICES")
Service.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING ASSOCIATIONS")
VehicleSetting.all.each(&:destroy)
ContactInfo.all.each(&:destroy)
Location.all.each(&:destroy)
Address.all.each(&:destroy)
printFinished()


finished = " CLEARED ALL SETTINGS ".ljust(70, "#")
puts finished.rjust(120, "#")
10.times{puts}
finished = nil


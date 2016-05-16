3.times{puts}
5.times{seedEnvironment()}

if AdminUser.all.size > 0
  printStarting("DELETING ADMIN USERS")
  AdminUser.all.each(&:destroy)
  printFinished()
else
  puts("No #{AdminUser.to_s}s found")
end


if Account.all.size > 0
  printStarting("DELETING EXISTING ACCOUNTS")
  Account.all.each(&:destroy)
  printFinished()
else
  puts("No #{Account.to_s}s found")
end

if User.all.size > 0
  printStarting("DELETING EXISTING USERS")
  User.all.each(&:destroy)
  printFinished()
else
  puts("No #{User.to_s}s found")
end

if Site.all.size > 0
  printStarting("DELETING EXISTING SITES")
  Site.all.each(&:destroy)
  printFinished()
else
  puts("No #{Site.to_s}s found")
end

if Company.all.size > 0
  printStarting("DELETING EXISTING COMPANIES")
  Company.all.each(&:destroy)
  printFinished()
else
  puts("No #{Company.to_s}s found")
end

if Appointment.all.size > 0
  printStarting("DELETING EXISTING APPOINTMENTS")
  Appointment.all.each(&:destroy)
  printFinished()
else
  puts("No #{Appointment.to_s}s found")
end

if SitelerDollar.all.size > 0
  printStarting("DELETING EXISTING SITELER DOLLARS")
  SitelerDollar.all.each(&:destroy)
  printFinished()
else
  puts("No #{SitelerDollar.to_s}s found")
end

if Discount.all.size > 0
  printStarting("DELETING EXISTING DISCOUNTS")
  Discount.all.each(&:destroy)
  printFinished()
else
  puts("No #{Discount.to_s}s found")
end

if Service.all.size > 0
  printStarting("DELETING EXISTING SERVICES")
  Service.all.each(&:destroy)
  printFinished()
else
  puts("No #{Service.to_s}s found")
end

if ServicePlan.all.size > 0
  printStarting("DELETING EXISTING SERVICE PLANS")
  ServicePlan.all.each(&:destroy)
  printFinished()
else
  puts("No #{ServicePlan.to_s}s found")
end

if Cart.all.size > 0
  printStarting("DELETING EXISTING CARTS")
  Cart.all.each(&:destroy)
  printFinished()
else
  puts("No #{Cart.to_s}s found")
end


#printStarting("DELETING EXISTING YEARS")
#VehicleYear.all.each(&:destroy)
#printFinished()

#printStarting("DELETING EXISTING MAKES")
#VehicleMake.all.each(&:destroy)
#printFinished()

#printStarting("DELETING EXISTING MODELS")
#VehicleModel.all.each(&:destroy)
#printFinished()

#printStarting("DELETING EXISTING TRIM")
#VehicleTrim.all.each(&:destroy)
#printFinished()

#printStarting("DELETING EXISTING TYPES")
#VehicleType.all.each(&:destroy)
#printFinished()

#printStarting("DELETING EXISTING DOORS")
#VehicleDoor.all.each(&:destroy)
#printFinished()

#printStarting("DELETING EXISTING SIZES")
#VehicleSize.all.each(&:destroy)
#printFinished()


#printStarting("DELETING EXISTING VEHICLES")
#Vehicle.all.each(&:destroy)
#printFinished()


printStarting("DELETING EXISTING ASSOCIATIONS")
#VehicleSetting.all.each(&:destroy)
ContactInfo.all.each(&:destroy)
Location.all.each(&:destroy)
Address.all.each(&:destroy)
printFinished()


finished = " CLEARED ALL SETTINGS ".ljust(70, "#")
puts finished.rjust(120, "#")
10.times{puts}
finished = nil


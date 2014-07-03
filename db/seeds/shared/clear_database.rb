6.times{puts}
5.times{simpleSeed()}

printStarting("DELETING ADMIN USERS")
AdminUser.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING USERS")
User.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING COMPANIES")
Company.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING ADDRESSES")
Address.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING YEARS")
VehicleYear.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING MAKES")
VehicleMake.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING MODELS")
VehicleModel.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING TRIMS")
VehicleTrim.all.each(&:destroy)
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


finished = " CLEARED ALL SETTINGS ".ljust(70, "#")
puts finished.rjust(120, "#")
10.times{puts}
finished = nil


6.times{puts}
5.times{seedEnvironment()}

printStarting("DELETING ADMIN USERS")
AdminUser.all.each(&:destroy)
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

printStarting("DELETING EXISTING ADDRESSES")
Address.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING VEHICLES")
Vehicle.all.each(&:destroy)
printFinished()

printStarting("DELETING EXISTING APPOINTMENTS")
Appointment.all.each(&:destroy)
printFinished()

unless @answer.eql?("n") || @answer.eql?("no")
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
end

printStarting("DELETING EXISTING ASSOCIATIONS")
#Clientele.all.each(&:destroy)
ContactInfo.all.each(&:destroy)
Location.all.each(&:destroy)
#Schedule.all.each(&:destroy)
#Transportation.all.each(&:destroy)
printFinished()


finished = " CLEARED ALL SETTINGS ".ljust(70, "#")
puts finished.rjust(120, "#")
10.times{puts}
finished = nil


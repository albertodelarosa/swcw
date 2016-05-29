printStarting("CREATING DEFAULT VEHICLE")

vehicle = Vehicle.new(
  license_plate:    "hotweel",
  state_registered: "CA",
  color:            "Artic White",
  comments:         "Please wash the mats",
  my_year:          "1997",
  my_make:          "Chevrolet",
  my_model:         "Camaro",
  my_trim:          "Z/28",
  my_type:          "Convertible",
  my_door:          "2 Door",
  my_size:          "Small"
)
vehicle.vehicle_year  = VehicleYear.find_by_name( "1997" )
vehicle.vehicle_make  = VehicleMake.find_by_name( "Chevrolet" )
vehicle.vehicle_model = VehicleModel.find_by_name( "Camaro" )
vehicle.vehicle_trim  = VehicleTrim.find_by_name( "Z/28" )
#vehicle.vehicle_type  = VehicleType.find_by_name( "Convertible" )
#vehicle.vehicle_door  = VehicleDoor.find_by_name( "2 Door" )
#vehicle.vehicle_size  = VehicleSize.find_by_name( "Small" )
vehicle.save
printFinished()


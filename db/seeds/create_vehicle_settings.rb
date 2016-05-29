printStarting("CREATING DEFAULT VEHICLE SETTINGS")
VehicleSetting.create!(
  vehicle_year:  VehicleYear.find( name: "1997" ),
  vehicle_make:  VehicleMake.find( name: "Chevrolet" ),
  vehicle_model: VehicleYear.find( name: "Camaro" ),
  vehicle_trim:  VehicleYear.find( name: "Z/28" ),
  vehicle_type:  VehicleYear.find( name: "Convertible" ),
  vehicle_door:  VehicleDoor.find( name: "2 Door" ),
  vehicle_size:  VehicleYear.find( name: "Small" )
)
printFinished()


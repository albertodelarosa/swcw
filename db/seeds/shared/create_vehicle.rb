printStarting("ASSOCIATING DEVELOPER DEFAULT VEHICLE")
Vehicle.create!(
  vehicle_year:     "1997",
  vehicle_make:     "Chevrolet",
  vehicle_model:    "Camaro",
  vehicle_trim:     "Z28",
  vehicle_type:     "Convertible",
  vehicle_door:     "2 Door",
  vehicle_size:     "Small",
  license_plate:    "hotweel",
  state_registered: "CA",
  color:            "Artic White",
  comments:         "Please wash the mats"
)
printFinished()



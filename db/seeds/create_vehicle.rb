printStarting("CREATING DEFAULT VEHICLE")
Vehicle.create!(
  my_year:     "1997",
  my_make:     "Chevrolet",
  my_model:    "Camaro",
  my_trim:     "Z28",
  my_type:     "Convertible",
  my_door:     "2 Door",
  my_size:     "Small",
  license_plate:    "hotweel",
  state_registered: "CA",
  color:            "Artic White",
  comments:         "Please wash the mats"
)
printFinished()



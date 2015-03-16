printStarting("CREATING SERVICE REGULAR LIST")
ServiceRegular.create!(
  name:         "Cottage",
  description:  "Service Includes: Exterior Hand Wash. Hand cleaning of outside windows. Hand cleaning of rims.",
  price_large:  16.95,
  price_small:  14.95,
  duration:     30
)
ServiceRegular.create!(
  name:         "Villa",
  description:  "Cottage Service plus: Hand cleaning of inside windows. Vacuum of carpets and mats. Dusting of dash with a dry towel. Cleaning of cup holders. Tire dressing",
  price_large:  29.95,
  price_small:  24.95,
  duration:     60
)
ServiceRegular.create!(
  name:         "Estate",
  description:  "Villa Service plus: Hand wax of exterior. Interior wipe down with a wet cloth. Vacuum of seats and between seats and center console or doors",
  price_large:  69.95,
  price_small:  59.95,
  duration:     120
)
ServiceRegular.create!(
  name:         "Palace Interior",
  description:  "Villa Service plus: Vacuum of seats and between seats and center console or doors. Shampoo, stain removal, and disinfection of carpets and mats. Leather seats: Hand cleaning and conditioning. Upholstery seats: Shampoo and hand cleaning. Detailed cleaning and conditioning of your dash and panels.",
  price_large:  169.95,
  price_small:  149.95,
  duration:     180
)
ServiceRegular.create!(
  name:         "Palace Exterior",
  description:  "Villa Service plus: Clay-bar cleaning of the pores of the paint, including rust crystal and oxidation removal. Removal of tree sap, bugs, paint overspray, and road tar. Hand wax and polish of car’s surface + light scratch removal. Interior wipe down with a wet cloth. Vacuum of seats and between seats and center console or doors.",
  price_large:  169.95,
  price_small:  149.95,
  duration:     180
)
ServiceRegular.create!(
  name:         "Palace Complete",
  description:  "Palace Interior and Palace Exterior Services",
  price_large:  16.95,
  price_small:  14.95,
  duration:     360
)
printFinished()

printStarting("CREATING SERVICE GOOGLE LIST")
ServiceGoogle.create!(
  name:         "Cottage",
  description:  "Service Includes: Exterior Hand Wash. Hand cleaning of outside windows. Hand cleaning of rims.",
  price_large:  16.00,
  price_small:  12.00,
  duration:     30
)
ServiceGoogle.create!(
  name:         "Villa",
  description:  "Cottage Service plus: Hand cleaning of inside windows. Vacuum of carpets and mats. Dusting of dash with a dry towel. Cleaning of cup holders. Tire dressing",
  price_large:  24.00,
  price_small:  20.00,
  duration:     60
)
ServiceGoogle.create!(
  name:         "Estate",
  description:  "Villa Service plus: Hand wax of exterior. Interior wipe down with a wet cloth. Vacuum of seats and between seats and center console or doors",
  price_large:  48.00,
  price_small:  40.00,
  duration:     120
)
ServiceGoogle.create!(
  name:         "Palace Interior",
  description:  "Villa Service plus: Vacuum of seats and between seats and center console or doors. Shampoo, stain removal, and disinfection of carpets and mats. Leather seats: Hand cleaning and conditioning. Upholstery seats: Shampoo and hand cleaning. Detailed cleaning and conditioning of your dash and panels.",
  price_large:  120.00,
  price_small:  100.00,
  duration:     180
)
ServiceGoogle.create!(
  name:         "Palace Exterior",
  description:  "Villa Service plus: Clay-bar cleaning of the pores of the paint, including rust crystal and oxidation removal. Removal of tree sap, bugs, paint overspray, and road tar. Hand wax and polish of car’s surface + light scratch removal. Interior wipe down with a wet cloth. Vacuum of seats and between seats and center console or doors.",
  price_large:  120.00,
  price_small:  100.00,
  duration:     180
)
ServiceGoogle.create!(
  name:         "Palace Complete",
  description:  "Palace Interior and Palace Exterior Services",
  price_large:  240.00,
  price_small:  200.00,
  duration:     360
)
printFinished()


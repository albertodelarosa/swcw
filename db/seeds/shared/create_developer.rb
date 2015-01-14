printStarting("ADDING DEVELOPER USER")
developer = User.create!(username: 'developers',   email: 'alberto.g.delrosa+sitelerwash_developer@gmail.com',    password: 'password')
developer.skip_confirmation!
developer.save!
printFinished()

printStarting("ADDING DEVELOPER CONTACT INFOS & ADDRESSES")

printStarting("ASSOCIATING DEVELOPER HOME ADDRESS")
developer.home_address = HomeAddress.create!(street1: "2527 Ortega Street" , apt_no: "12", city: "San Francisco", state: "CA", zip: "94122")
printFinished()

printStarting("ASSOCIATING DEVELOPER HOME CONTACT INFO")
developer.home_contact_info = HomeContactInfo.create!(phone1: "415.661.7226" , mobile: "415.845.0274")
printFinished()

printStarting("ASSOCIATING DEVELOPER WORK CONTACT INFO")
developer.work_contact_info = CompanyContactInfo.create!(phone1: "(650) 333-0168", ext: "329")
printFinished()

printFinished()

printStarting("ADDING DEVELOPER ASSOCIATIONS")

printStarting("ASSOCIATING DEVELOPER DEFAULT SITES")
first_site_id = Site.first.id
limit = Site.count + first_site_id - 1
site1 = Site.find(rand(first_site_id..limit))
site2 = Site.find(rand(first_site_id..limit))
developer.sites << site1 << site2
printFinished()

printStarting("ASSOCIATING DEVELOPER DEFAULT COMPANIES")
developer.companies << site1.companies[0] << site2.companies[0]
printFinished()

printStarting("ADDING MY DEFAULT COMPANY ADDRESSES")
developer.work_address = CompanyAddress.create!(
                                                  street1: site1.companies[0].address.street1,
                                                  street2: site1.companies[0].address.street2,
                                                 suite_no: site1.companies[0].address.suite_no,
                                                     city: site1.companies[0].address.city,
                                                    state: site1.companies[0].address.state,
                                                      zip: site1.companies[0].address.zip       )
printFinished()

printStarting("ASSOCIATING DEVELOPER DEFAULT VEHICLE")
my_vehicle = Vehicle.create!(
  license_plate_number: "hotweel",
  state_registered: "CA",
  color: "Artic White",
  comments: "Please wash the mats"
)

my_vehicle.vehicle_years << VehicleYear.find_by_name("1997")
my_vehicle.vehicle_makes << VehicleMake.find_by_name("Chevrolet")
my_vehicle.vehicle_models << VehicleModel.find_by_name("Camaro")
my_vehicle.vehicle_trims << VehicleTrim.find_by_name("Z28")
my_vehicle.vehicle_types << VehicleType.find_by_name("Convertible")
my_vehicle.vehicle_doors << VehicleDoor.find_by_name("2-door")
developer.vehicles << my_vehicle
printFinished()


printStarting("ASSOCIATING DEFAULT APPOINTMENTS")
first_appointment_id = Appointment.first.id

appointment_today = Appointment.find(first_appointment_id)
appointment_tomorrow = Appointment.find(first_appointment_id + 1)
appointment_last_week = Appointment.find(first_appointment_id + 2)

appointment_last_week.sites << site1
appointment_last_week.companies << site1.companies[0]
appointment_last_week.vehicles << my_vehicle


appointment_today.sites << site1
appointment_today.companies << site1.companies[0]
appointment_today.vehicles << my_vehicle

appointment_tomorrow.sites << site1
appointment_tomorrow.companies << site1.companies[0]
appointment_tomorrow.vehicles << my_vehicle
printFinished()

printFinished()

printStarting("ASSOCIATING DEVELOPER DEFAULT APPOINTMENTS")
developer.appointments << appointment_last_week << appointment_today << appointment_tomorrow
printFinished()




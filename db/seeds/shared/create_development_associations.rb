developer = User.first
printStarting("ADDING ALL DEVELOPER ASSOCIATIONS")

printStarting("ASSOCIATING DEVELOPER HOME ADDRESS")
developer.home_address =
  HomeAddress.create!(
    street1: "2527 Ortega Street",
    apt_no: "12",
    city: "San Francisco",
    state: "CA",
    zip: "94122"
  )
printFinished()

printStarting("ASSOCIATING DEVELOPER HOME CONTACT INFO")
developer.home_contact_info =
  HomeContactInfo.create!(
    phone1: "415.661.7226",
    mobile: "415.845.0274"
  )
printFinished()

printStarting("ASSOCIATING DEVELOPER WORK CONTACT INFO")
developer.work_contact_info =
  CompanyContactInfo.create!(
    phone1: "(650) 333-0168",
    ext: "329"
  )
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
developer.work_address =
  CompanyAddress.create!(
    street1:  site1.companies[0].address.street1,
    street2:  site1.companies[0].address.street2,
    suite_no: site1.companies[0].address.suite_no,
    city:     site1.companies[0].address.city,
    state:    site1.companies[0].address.state,
    zip:      site1.companies[0].address.zip
  )
printFinished()

#printStarting("ASSOCIATING DEVELOPER DEFAULT VEHICLE")
#my_vehicle =
  #Vehicle.create!(
    #year:             "1997",
    #make:             "Chevrolet",
    #model:            "Camaro",
    #trim:             "Z28",
    #type:             "Convertible",
    #doors:            "2 Door",
    #size:             "Small",
    #license_plate:    "hotweel",
    #state_registered: "CA",
    #color:            "Artic White",
    #comments:         "Please wash the mats"
  #)
#developer.vehicles << my_vehicle
#printFinished()


printStarting("ASSOCIATING DEFAULT APPOINTMENTS")
first_appointment_id = Appointment.first.id

appointment_today =     Appointment.find(first_appointment_id)
appointment_tomorrow =  Appointment.find(first_appointment_id + 1)
appointment_last_week = Appointment.find(first_appointment_id + 2)

appointment_last_week.sites     << site1
appointment_last_week.companies << site1.companies[0]
#appointment_last_week.vehicles  << my_vehicle


appointment_today.sites     << site1
appointment_today.companies << site1.companies[0]
#appointment_today.vehicles  << my_vehicle

appointment_tomorrow.sites      << site1
appointment_tomorrow.companies  << site1.companies[0]
#appointment_tomorrow.vehicles   << my_vehicle
printFinished()

printFinished()

printStarting("ASSOCIATING DEVELOPER DEFAULT APPOINTMENTS")
developer.appointments << appointment_last_week << appointment_today << appointment_tomorrow
printFinished()


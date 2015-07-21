developer = User.first
account = Account.first

account.user = developer
account.generate_number
account.save!

printStarting("ADDING DEVELOPER ASSOCIATIONS")

printStarting("ASSOCIATING DEVELOPER DEFAULT SITES")
first_site_id = Site.first.id
limit = Site.count + first_site_id - 1
site1 = Site.find(rand(first_site_id..limit))
site2 = Site.find(rand(first_site_id..limit))
account.sites << site1 << site2
printFinished()

printStarting("ASSOCIATING DEVELOPER DEFAULT COMPANIES")
account.companies << site1.companies[0] << site2.companies[0]
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

printStarting("ASSOCIATING DEVELOPER DEFAULT VEHICLE")
account.vehicles << Vehicle.all.first
printFinished()


#printStarting("ASSOCIATING DEFAULT APPOINTMENTS")
#first_appointment_id = Appointment.first.id

#appointment_today =     Appointment.find(first_appointment_id)
#appointment_tomorrow =  Appointment.find(first_appointment_id + 1)
#appointment_last_week = Appointment.find(first_appointment_id + 2)

#appointment_last_week.sites     << site1
#appointment_last_week.companies << site1.companies[0]
##appointment_last_week.vehicles  << my_vehicle


#appointment_today.sites     << site1
#appointment_today.companies << site1.companies[0]
##appointment_today.vehicles  << my_vehicle

#appointment_tomorrow.sites      << site1
#appointment_tomorrow.companies  << site1.companies[0]
##appointment_tomorrow.vehicles   << my_vehicle

#developer.appointments << appointment_last_week << appointment_today << appointment_tomorrow
#printFinished()


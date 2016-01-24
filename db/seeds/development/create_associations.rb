printStarting("ADDING ACCOUNT ASSOCIATIONS")

developer = User.find_by(email: Rails.application.secrets.user_email)
account = developer.account
account.generate_number
account.save!


printStarting("ASSOCIATING ACCOUNT DEFAULT SITES")
first_site_id = Site.first.id
limit = (Site.count - 1) + first_site_id
site1 = Site.find(rand(first_site_id..limit))
site2 = Site.find(rand(first_site_id..limit))
account.sites << site1 << site2
printFinished()

printStarting("ASSOCIATING ACCOUNT DEFAULT COMPANIES")
account.companies << site1.companies[0] << site2.companies[0]
printFinished()

printStarting("ASSOCIATING ACCOUNT DEFAULT VEHICLE")
account.vehicles << Vehicle.all.first
printFinished()


printStarting("ADDING ALL DEVELOPER ASSOCIATIONS")

printStarting("ASSOCIATING DEVELOPER HOME ADDRESS")
developer.home_address =
  HomeAddress.create!(
    street1: Rails.application.secrets.user_street1,
    city:    Rails.application.secrets.user_city,
    state:   Rails.application.secrets.user_state,
    zip:     Rails.application.secrets.user_zip
  )
printFinished()

printStarting("ASSOCIATING DEVELOPER HOME CONTACT INFO")
developer.home_contact_info =
  HomeContactInfo.create!(
    phone1: Rails.application.secrets.user_phone1,
    mobile: Rails.application.secrets.user_mobile
  )
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

printStarting("ASSOCIATING DEVELOPER WORK CONTACT INFO")
developer.work_contact_info =
  CompanyContactInfo.create!(
    phone1: "(650) 555-5555",
    ext: "329"
  )
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


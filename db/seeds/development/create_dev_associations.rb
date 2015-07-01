account = Account.first
develper = User.first

printStarting("ASSOCIATING TO DEFAULT ACCOUNT...")

printStarting(" DEVELOPER")
account.user = User.first
printFinished()

printStarting("SITES")
first_site_id = Site.first.id
limit = Site.count + first_site_id - 1
site1 = Site.find(rand(first_site_id..limit))
site2 = Site.find(rand(first_site_id..limit))
account.sites << site1 << site2
printFinished()

printStarting("COMPANIES")
account.companies << site1.companies[0] << site2.companies[0]
printFinished()

printStarting("VEHICLE")
account.vehicles << Vehicle.first
printFinished()

#printStarting("SITELER DOLLARS")
#account.siteler_dollar = SitelerDollar.first
#printFinished()

#printStarting("DISCOUNT")
#account.discounts << Discount.first
#printFinished()

#printStarting("APPOINTMENTS")
#first_appointment_id = Appointment.first.id

#appointment_today =     Appointment.find(first_appointment_id)
#appointment_tomorrow =  Appointment.find(first_appointment_id + 1)
#appointment_last_week = Appointment.find(first_appointment_id + 2)

#account.appointments << appointment_last_week << appointment_today  << appointment_tomorrow

#printFinished()

printStarting("DEFAULT COMPANY ADDRESS FOR DEVELOPER")
develper.work_address =
  CompanyAddress.create!(
    street1:  site1.companies[0].address.street1,
    street2:  site1.companies[0].address.street2,
    suite_no: site1.companies[0].address.suite_no,
    city:     site1.companies[0].address.city,
    state:    site1.companies[0].address.state,
    zip:      site1.companies[0].address.zip
  )
develper.save!
printFinished()

account.save!

printFinished()



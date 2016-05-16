def seedEnvironment()
  puts "Seeding Environment: #{Rails.env}"
  puts " STARTING SEED FILE... ".rjust(10, "#")
  2.times{puts}
  puts
end

def printStartingSeedFile()
  5.times{simpleSeed()}
end

def printStarting(starting)
  temp = " #{starting}...".ljust(10, ".")
  puts "#{temp}...".rjust(10, "#")
  puts ".".ljust(10, ".")
  puts
end

def printFinished()
  finished = "Finished ".ljust(10, "#")
  puts finished.rjust(10, ".")
  6.times{puts}
end

def associate_account_user(account)
  printStarting("ADDING ACCOUNT ASSOCIATIONS")
  account.user = User.find_by(email: Rails.application.secrets.user_email)
  account.generate_number
  account.save!
  printFinished()
  return account
end

def create_user_home_info(user)
  printStarting("ASSOCIATING DEVELOPER HOME INFORMATION")
  user.home_address =
    HomeAddress.create!(
      street1: Rails.application.secrets.user_street1,
      city:    Rails.application.secrets.user_city,
      state:   Rails.application.secrets.user_state,
      zip:     Rails.application.secrets.user_zip
    )
  user.home_contact_info =
    HomeContactInfo.create!(
      phone1: Rails.application.secrets.user_phone1,
      mobile: Rails.application.secrets.user_mobile
    )
  user.save!
  printFinished()
end

def associate_account_companies(account, names)
  printStarting("ASSOCIATING ACCOUNT DEFAULT COMPANIES")
  account.companies << Company.where("lower(name) like ?", names.first) << Company.where("lower(name) like ?", names.last)
  account.save!
  printFinished()
end

def create_user_work_info(account)
  printStarting("ASSOCIATING COMPANY WORK ADDRESS")
  account.user.work_address =
    CompanyAddress.create!(
      street1:  account.companies.last.address.street1,
      street2:  account.companies.last.address.street2,
      suite_no: account.companies.last.address.suite_no,
      city:     account.companies.last.address.city,
      state:    account.companies.last.address.state,
      zip:      account.companies.last.address.zip
    )
  account.user.work_contact_info =
    CompanyContactInfo.create!(
      phone1: "(650) 555-5555",
      ext: "329"
    )
  account.user.save!
  printFinished()
end

def associate_account_sites(account)
  printStarting("ASSOCIATING ACCOUNT DEFAULT SITES")
  account.sites << get_site(account.companies.first) << get_site(account.companies.last)
  account.save!
  printFinished()
end

def get_site(company)
  limit = company.sites.count - 1
  company.sites[rand(0..limit)]
end

def associate_account_vehicle(account)
  printStarting("ASSOCIATING ACCOUNT DEFAULT VEHICLE")
  account.vehicles << Vehicle.all.first
  account.save!
  printFinished()
end

def associate_account_appointments(account)
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

  #developer.appointments << appointment_last_week << appointment_today << appointment_tomorrow
  printFinished()
end



printStarting("ADDING DEVELOPER USER")
developer = User.create!(username: 'developers',   email: 'alberto.g.delrosa+sitelerwash_developer@gmail.com',    password: 'password')
developer.skip_confirmation!
developer.save!
printFinished()



printStarting("ASSOCIATING DEVELOPER HOME ADDRESS")
developer.home_address = HomeAddress.create!(street1: "2527 Ortega Street" , apt_no: "12", city: "San Francisco", state: "CA", zip: "94122")
printFinished()

printStarting("ASSOCIATING DEVELOPER HOME CONTACT INFO")
developer.home_contact_info = HomeContactInfo.create!(phone1: "415.661.7226" , mobile: "415.845.0274")
printFinished()



printStarting("ASSOCIATING DEVELOPER WORK CONTACT INFO")
developer.work_contact_info = CompanyContactInfo.create!(phone1: "(650) 333-0168", ext: "329")
printFinished()

printStarting("ADDING MY DEFAULT COMPANIES")
developer.companies << Company.find_by(name: "Genentech, Inc.") << Company.find_by(name: "Google, Inc.")
printFinished()

printStarting("ADDING MY DEFAULT COMPANY ADDRESSES")
developer.work_address = developer.companies[0].address
printFinished()


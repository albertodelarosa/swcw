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

printStarting("ASSOCIATING DEVELOPER DEFAULT COMPANIES")
developer.companies << Company.find_by_name("Genentech, Inc.") << Company.find_by_name("Google, Inc.")
printFinished()

printStarting("ADDING MY DEFAULT COMPANY ADDRESSES")
developer.work_address = CompanyAddress.create!(
                                                  street1: developer.companies[0].address.street1,
                                                  street2: developer.companies[0].address.street2,
                                                 suite_no: developer.companies[0].address.suite_no,
                                                     city: developer.companies[0].address.city,
                                                    state: developer.companies[0].address.state,
                                                      zip: developer.companies[0].address.zip       )
printFinished()


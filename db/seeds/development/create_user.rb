printStarting("ADDING DEVELOPER USER")
developer = User.create!(
  email:      'alberto.g.delarosa@gmail.com',
  username:   'developer',
  password:   'password',
  last_name:  'de la Rosa',
  first_name: 'Alberto',
  salutation: 'Beto'
)
developer.skip_confirmation!
developer.save!
printFinished()

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


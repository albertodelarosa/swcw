printStarting("ADDING DEVELOPER USER")
developer = User.create!(username: 'developers',   email: 'alberto.g.delrosa+sitelerwash_developer@gmail.com',    password: 'password')
developer.skip_confirmation!
developer.save!
printFinished()


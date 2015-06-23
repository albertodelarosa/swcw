printStarting("ADDING ADMIN USER")
admin = AdminUser.create!(username: 'developers', email: "alberto.g.delrosa+sitelerwash_developer@gmail.com", password: 'password')#, without_protection: true)
admin.save!
printFinished()


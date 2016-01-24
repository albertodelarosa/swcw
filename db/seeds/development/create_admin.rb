printStarting("ADDING ADMIN USER")
admin = AdminUser.create!(
  #username: 'developers',
  email: Rails.application.secrets.admin_email,
  password: Rails.application.secrets.admin_password
)
admin.save!
printFinished()


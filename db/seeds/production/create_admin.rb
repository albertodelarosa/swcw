printStarting("ADDING ADMIN USER")
admin = AdminUser.create!(email: Rails.application.secrets.admin_email, username: Rails.application.secrets.admin_username, password: Rails.application.secrets.admin_password)
admin.save!
printFinished()


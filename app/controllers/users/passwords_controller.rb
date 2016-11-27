class Users::PasswordsController < Devise::PasswordsController

  def register_password
    @user = User.sanitize_omniauth( session[ "devise.user_attributes" ] )
  end


end

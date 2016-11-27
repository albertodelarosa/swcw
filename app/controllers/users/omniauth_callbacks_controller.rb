class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :redirect_to_login_if_required

  def all
    if @user = User.find_by( provider: request.env["omniauth.auth"].provider, uid: request.env["omniauth.auth"].uid )
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      session["devise.user_attributes"] = request.env["omniauth.auth"]
      respond_to do |format|
        format.html { redirect_to register_password_url, alert: 'Almost done. Simply enter a password!' }
      end
    end
    #generate_account(user)
    #redirect_to password_url
  end

  alias_method :twitter,  :all
  alias_method :facebook, :all

end



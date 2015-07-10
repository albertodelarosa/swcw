class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :redirect_to_login_if_required

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    generate_account(user)
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user#, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :twitter,  :all
  alias_method :facebook, :all

  def authenticate
    callback = oauth_callback_vendors_url
    token = $qb_oauth_consumer.get_request_token(:oauth_callback => callback)
    session[:qb_request_token] = token
    redirect_to("https://appcenter.intuit.com/Connect/Begin?oauth_token=#{token.token}") and return
  end

  def oauth_callback
    at = session[:qb_request_token].get_access_token(:oauth_verifier => params[:oauth_verifier])
    session[:token] = at.token
    session[:secret] = at.secret
    session[:realm_id] = params['realmId']
    flash.notice = "Your QuickBooks account has been successfully linked."
    @msg = 'Redirecting. Please wait.'
    @url = vendors_path
    render 'close_and_redirect', layout: false
  end

end


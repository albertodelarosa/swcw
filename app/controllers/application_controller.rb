class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  before_action :authenticate_user!

  def stored_location_for(resource)
    nil
  end

  # from your application log (in this case, all fields with names like "password")
  #filter_parameter_logging :card_number, :card_verification

  def generate_account(user)
    if user.account.nil?
      account = Account.new
      account.user = user
      account.generate_number
      account.save!
    end
  end

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  def after_sign_in_path_for(resource)
    unless resource.instance_of?(AdminUser)
      dashboard_root_path()
    else
      super
    end
  end

  def after_inactive_sign_up_path_for(resource)
    dashboard_root_path()
  end

  def add_breadcrumb name, url = "", icon = ""
      @breadcrumbs ||= []
      url = eval(url) if url =~ /_path|_url|@/
      @breadcrumbs << [name, url, icon]
  end

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end

  helper_method :mobile_device?

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    elsif user_signed_in?
      "application"
    else
      "welcome"
    end
  end

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  #end

end

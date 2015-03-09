class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  def stored_location_for(resource)
    nil
  end
  #def after_sign_in_path_for(resource)
    #path_to_redirect_to
    #if current_user.customer?
      #customers_root_path
    #end
  #end

  def after_sign_in_path_for(resource)
    unless resource.instance_of?(AdminUser)
      dashboard_path()
    else
      super
    end
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

end

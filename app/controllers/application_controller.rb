class ApplicationController < ActionController::Base
  protect_from_forgery
  def stored_location_for(resource)
    nil
  end
  def after_sign_in_path_for(resource)
    #path_to_redirect_to
    #if current_user.customer?
      customers_root_path
    #end
  end
end

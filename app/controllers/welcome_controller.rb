class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    #add_breadcrumb 'Hotel Manager', '<a href="/hotelmanager/">Hotel Manager</a>'
    #add_breadcrumb 'Hotel Manager', 'Hotels'
    if user_signed_in?
      redirect_to dashboard_root_path()
    end
  end
end

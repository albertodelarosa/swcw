class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    #add_breadcrumb 'Hotel Manager', '<a href="/hotelmanager/">Hotel Manager</a>'
    #add_breadcrumb 'Hotel Manager', 'Hotels'
    if user_signed_in?
      redirect_to dashboard_path()
    end
  end

  def dashboard
    @vehicles = current_user.vehicles || []
    @new_vehicle = Vehicle.new
  end

  def create_vehicle

  end

  def update_vehicle

  end

  def vehicles
    @models = Model.all
  end
end

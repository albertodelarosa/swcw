class Customers::CustomerController < ApplicationController
  layout "customers"

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    @vehicles = current_user.vehicles || []
    @companies = current_user.companies || []
    @sites = current_user.sites || []
  end

  def create_vehicle
  end

  def update_vehicle
  end
end

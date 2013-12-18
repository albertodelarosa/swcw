class Customers::CustomerController < ApplicationController
  layout "customers"

  before_filter :authenticate_user!

  def index
    @vehicles = current_user.vehicles || []
    @companies = current_user.companies || []
    @sites = current_user.sites || []
    add_breadcrumb "home", root_path
  end

  def create_vehicle
  end

  def update_vehicle
  end
end

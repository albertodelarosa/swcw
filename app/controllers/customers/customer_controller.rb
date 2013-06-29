class Customers::CustomerController < ApplicationController
  layout "customers"

  before_filter :authenticate_user!

  def index
    @vehicles = current_user.vehicles || []
  end

  def create_vehicle
  end

  def update_vehicle
  end
end

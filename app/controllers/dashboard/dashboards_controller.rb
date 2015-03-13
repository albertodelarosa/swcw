class Dashboard::DashboardsController < ApplicationController

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    @appointments = current_user.appointments || []
    @appointment = Appointment.new

    @sites = current_user.sites.to_a || []
    @site = Site.new

    @companies = current_user.companies || []
    @company = Company.new

    @vehicles = current_user.vehicles || []
    @vehicle  = Vehicle.new

    @years    = VehicleYear.all
    @makes    = []
    @models   = []
    @trims    = []
    @types    = []
    @doors    = []
    @sizes    = []
  end
end

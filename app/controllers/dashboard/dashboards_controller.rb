class Dashboard::DashboardsController < ApplicationController
  layout "dashboard"

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index

    current_user.appointments.empty? ? ( @appointment = Appointment.new, @appointments = [] ) : ( @appointments = current_user.appointments )

    @vehicles = current_user.vehicles || []
    @companies = current_user.companies || []
    @sites = current_user.sites || []
    @appointments = current_user.appointments || []
    @appointment = Appointment.new
    @company = Company.new
    @site = Site.new
    @vehicle  = Vehicle.new
    @years    = VehicleYear.all
    @makes    = []
    @models   = []
    @trims    = []
    @types    = []
    @doors    = []
    @sizes    = []
  end

  def create_vehicle
  end

  def update_vehicle
  end
end

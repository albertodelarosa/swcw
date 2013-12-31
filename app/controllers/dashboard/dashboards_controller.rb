class Dashboard::DashboardsController < ApplicationController
  layout "dashboard"

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    @appointments = current_user.appointments || []
    @appointment = Appointment.new

    @sites = current_user.sites || []
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

  #def update_make
    #makes = VehicleMake.joins(vehicle_models: [vehicle_trims: :vehicle_years]).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    #@makes = makes.map{|make| [make.name, make.id]}.insert(0, "Select Make")
  #end

  #def update_model
    #models = VehicleModel.joins(:vehicle_makes, :vehicle_trims => :vehicle_years).where(vehicle_makes: {id: params[:vehicle_make]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    #@models = models.map{|model| [model.name, model.id]}.insert(0, "Select Model")
  #end

  #def update_trim
    #trims = VehicleTrim.joins(:vehicle_years, :vehicle_models).where(vehicle_models: {id: params[:vehicle_model]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    #@trims = trims.map{|trim| [trim.name, trim.id]}.insert(0, "Select Trim")
  #end

  #def update_type
    #types = VehicleType.joins(:vehicle_trims, :vehicle_years).where(vehicle_trims: {id: params[:vehicle_trim]}).where(vehicle_years: {id: params[:vehicle_year]})
    #@types = types.map{|type| [type.name, type.id]}.insert(0, "Select Type")
  #end

  #def update_doors
    #doors = VehicleDoor.joins(:vehicle_types, :vehicle_years).where(vehicle_types: {id: params[:vehicle_type]}).where(vehicle_years: {id: params[:vehicle_year]})
    #@doors = doors.map{|door| [door.name, door.id]}.insert(0, "Select Doors")
  #end

  #def update_size
    #sizes = VehicleSize.joins(:vehicle_types).where(vehicle_types: {id: params[:vehicle_type]})
    #@sizes = sizes.map{|size| [size.name, size.id]}.insert(0, "Select Size")
  #end

end

class Dashboard::VehiclesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "vehicles", dashboard_vehicles_path, "glyphicon-dashboard" }

  # GET /customers/vehicles
  # GET /customers/vehicles.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    #@vehicles = Vehicle.all
    @vehicles = current_user.vehicles || []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end

  # GET /customers/vehicles/1
  # GET /customers/vehicles/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @vehicle = Vehicle.find(params[:id])
    #if current_user.vehicles.contain?(@vehicle)

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @vehicle }
      end
    #end
  end

  # GET /customers/vehicles/new
  # GET /customers/vehicles/new.json
  def new
    add_breadcrumb "add", nil, "glyphicon-plus-sign"

    @vehicle  = Vehicle.new
    @years    = VehicleYear.all
    @makes    = []
    @models   = []
    @trims    = []
    @types    = []
    @doors    = []
    @sizes    = []

    @select_years    = VehicleYear.all
    @select_makes    = VehicleMake.all
    @select_models   = VehicleModel.all
    @select_trims    = VehicleTrim.all
    @select_types    = VehicleType.all
    @select_doors    = VehicleDoor.all
    @select_sizes    = VehicleSize.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /customers/vehicles/1/edit
  def edit
    add_breadcrumb "edit", nil, "glyphicon-edit"

    @vehicle = Vehicle.find(params[:id])
  end

  # POST /customers/vehicles
  # POST /customers/vehicles.json
  def create
    temp = params_vehicle_unfound
    vehicle_unfound = temp[:vehicle_unfound].to_i
    if vehicle_unfound == 0
      @vehicle = Vehicle.new(params_custom_vehicle)
    elsif vehicle_unfound == 1
      @vehicle = Vehicle.new(params_new_vehicle)
    end

    if (@vehicle.vehicle_type.casecmp("Pickup") == 0) || (@vehicle.vehicle_type.casecmp("SUV") == 0) || (@vehicle.vehicle_type.casecmp("Crossover") == 0) || (@vehicle.vehicle_type.casecmp("CUV") == 0) || (@vehicle.vehicle_type.casecmp("Van") == 0) || (@vehicle.vehicle_type.casecmp("Minivan") == 0)
      @vehicle.vehicle_size = "Large"
    elsif (@vehicle.vehicle_type.casecmp("Convertible") == 0) || (@vehicle.vehicle_type.casecmp("Coupe") == 0) || (@vehicle.vehicle_type.casecmp("Sedan") == 0) || (@vehicle.vehicle_type.casecmp("Wagon") == 0) || (@vehicle.vehicle_type.casecmp("Hatchback") == 0)
      @vehicle.vehicle_size = "Small"
    end
    respond_to do |format|
      if @vehicle.save!
        @vehicle.accounts << current_user.account
        format.html { redirect_to root_path, notice: 'Vehicle was successfully created.' }
        format.json { render @vehicle.id}#json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_make
    makes = VehicleMake.joins(vehicle_models: [vehicle_trims: :vehicle_years]).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    @makes = makes.map{|make| [make.name, make.id]}.insert(0, "Select Make")
  end

  def update_model
    models = VehicleModel.joins(:vehicle_makes, vehicle_trims: :vehicle_years).where(vehicle_makes: {id: params[:vehicle_make]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    @models = models.map{|model| [model.name, model.id]}.insert(0, "Select Model")
  end

  def update_trim
    trims = VehicleTrim.joins(:vehicle_years, :vehicle_models).where(vehicle_models: {id: params[:vehicle_model]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    @trims = trims.map{|trim| [trim.name, trim.id]}.insert(0, "Select Trim")
  end

  def update_type
    types = VehicleType.joins(:vehicle_trims, :vehicle_years).where(vehicle_trims:  {id: params[:vehicle_trim ]}).where(vehicle_years:  {id: params[:vehicle_year ]}).uniq
    @types = types.map{|type| [type.name, type.id]}.insert(0, "Select Type")
  end

  def update_doors
    doors = VehicleDoor.joins(:vehicle_types, :vehicle_years).where(vehicle_types: {id: params[:vehicle_type]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    @doors = doors.map{|door| [door.name, door.id]}.insert(0, "Select Doors")
  end

  def update_size
    sizes = VehicleSize.joins(:vehicle_types).where(vehicle_types: {id: params[:vehicle_type]}).uniq
    @sizes = sizes.map{|size| [size.name, size.id]}.insert(0, "Select Size")
  end

  # PUT /customers/vehicles/1
  # PUT /customers/vehicles/1.json
  def update
    @vehicle = Vehicle.new(params_update_vehicle)
    if (@vehicle.vehicle_type.casecmp("Pickup") == 0) || (@vehicle.vehicle_type.casecmp("SUV") == 0) || (@vehicle.vehicle_type.casecmp("Crossover") == 0) || (@vehicle.vehicle_type.casecmp("CUV") == 0) || (@vehicle.vehicle_type.casecmp("Van") == 0) || (@vehicle.vehicle_type.casecmp("Minivan") == 0)
      @vehicle.size = "Large"
    elsif(@vehicle.vehicle_type.casecmp("Convertible") == 0) || (@vehicle.vehicle_type.casecmp("Coupe") == 0) || (@vehicle.vehicle_type.casecmp("Sedan") == 0) || (@vehicle.vehicle_type.casecmp("Wagon") == 0) || (@vehicle.vehicle_type.casecmp("Hatchback") == 0)
      @vehicle.size = "Small"
    end

    respond_to do |format|
      if @vehicle.update_attributes(params_update_vehicle)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/vehicles/1
  # DELETE /customers/vehicles/1.json
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def params_new_vehicle
    params.required(:vehicle).permit(:vehicle_year, :vehicle_make, :vehicle_model, :vehicle_trim, :vehicle_type, :vehicle_door, :color, :license_plate, :state_registered, :comments)
  end

  def params_vehicle_unfound
    params.required(:vehicle).permit(:vehicle_unfound)
  end

  def params_custom_vehicle
    params[:vehicle][:vehicle_year]  = VehicleYear.find(params.required( :vehicle ).permit(vehicle_years: [:id])[:vehicle_years][:id].to_i).name
    params[:vehicle][:vehicle_make]  = VehicleMake.find(params.required( :vehicle ).permit(vehicle_makes: [:id])[:vehicle_makes][:id].to_i).name
    params[:vehicle][:vehicle_model] = VehicleModel.find(params.required(:vehicle ).permit(vehicle_models: [:id])[:vehicle_models][:id].to_i).name
    params[:vehicle][:vehicle_trim]  = VehicleTrim.find(params.required( :vehicle ).permit(vehicle_trims: [:id])[:vehicle_trims][:id].to_i).name
    params[:vehicle][:vehicle_type]  = VehicleType.find(params.required( :vehicle ).permit(vehicle_types: [:id])[:vehicle_types][:id].to_i).name
    params[:vehicle][:vehicle_door]  = VehicleDoor.find(params.required( :vehicle ).permit(vehicle_doors: [:id])[:vehicle_doors][:id].to_i).name
    params_new_vehicle
  end

  def params_update_vehicle
    params.required(:vehicle).permit(:vehicle_year, :vehicle_make, :vehicle_model, :vehicle_trim, :vehicle_type, :vehicle_doors, :color, :license_plate, :state_registered, :comments, :id)
  end

end

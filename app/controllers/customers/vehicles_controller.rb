class Customers::VehiclesController < Customers::DashboardsController
  # GET /customers/vehicles
  # GET /customers/vehicles.json
  def index
    add_breadcrumb 'Customer', '<a href="/customers">Customer</a>'
    add_breadcrumb 'Customer', 'Vehicles'

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
    @vehicle  = Vehicle.new
    @years    = VehicleYear.all
    @makes    = []
    @models   = []
    @trims    = []
    @types    = []
    @doors    = []
    @sizes    = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /customers/vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /customers/vehicles
  # POST /customers/vehicles.json
  def create
    @vehicle = Vehicle.new(color: params[:vehicle][:color], 
                           comments: params[:vehicle][:comments], 
                           license_plate_number: params[:vehicle][:license_plate_number], 
                           state_registered: params[:vehicle][:state_registered] 
                           #vehicle_years:   VehicleYear.find(params[:vehicle][:vehicle_years][:id]), 
                           #vehicle_makes:   VehicleMake.find(params[:vehicle][:vehicle_makes][:id]), 
                           #vehicle_models:  VehicleModel.find(params[:vehicle][:vehicle_models][:id]), 
                           #vehicle_trims:   VehicleTrim.find(params[:vehicle][:vehicle_trims][:id]), 
                           #vehicle_types:   VehicleType.find(params[:vehicle][:vehicle_types][:id]), 
                           #vehicle_doors:   VehicleDoor.find(params[:vehicle][:vehicle_doors][:id]) 
                           #vehicle_sizes:   VehicleSize.find(params[:vehicle][:vehicle_sizes][:id])
                          )
    @vehicle.vehicle_years        << VehicleYear.find(params[:vehicle][:vehicle_years][:id])
    @vehicle.vehicle_makes        << VehicleMake.find(params[:vehicle][:vehicle_makes][:id])
    @vehicle.vehicle_models       << VehicleModel.find(params[:vehicle][:vehicle_models][:id])
    @vehicle.vehicle_trims        << VehicleTrim.find(params[:vehicle][:vehicle_trims][:id])
    @vehicle.vehicle_types        << VehicleType.find(params[:vehicle][:vehicle_types][:id])
    @vehicle.vehicle_doors        << VehicleDoor.find(params[:vehicle][:vehicle_doors][:id])

    respond_to do |format|
      if @vehicle.save
        @vehicle.owners << current_user
        format.html { redirect_to root_path, notice: 'Vehicle was successfully created.' }
        format.json { render params[:id]}#json: @vehicle, status: :created, location: @vehicle }
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
    models = VehicleModel.joins(:vehicle_makes, :vehicle_trims => :vehicle_years).where(vehicle_makes: {id: params[:vehicle_make]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    @models = models.map{|model| [model.name, model.id]}.insert(0, "Select Model")
  end

  def update_trim
    trims = VehicleTrim.joins(:vehicle_years, :vehicle_models).where(vehicle_models: {id: params[:vehicle_model]}).where(vehicle_years: {id: params[:vehicle_year]}).uniq
    @trims = trims.map{|trim| [trim.name, trim.id]}.insert(0, "Select Trim")
  end

  def update_type
    types = VehicleType.joins(:vehicle_trims, :vehicle_years).where(vehicle_trims: {id: params[:vehicle_trim]}).where(vehicle_years: {id: params[:vehicle_year]})
    @types = types.map{|type| [type.name, type.id]}.insert(0, "Select Type")
  end

  def update_doors
    doors = VehicleDoor.joins(:vehicle_types, :vehicle_years).where(vehicle_types: {id: params[:vehicle_type]}).where(vehicle_years: {id: params[:vehicle_year]})
    @doors = doors.map{|door| [door.name, door.id]}.insert(0, "Select Doors")
  end

  def update_size
    sizes = VehicleSize.joins(:vehicle_types).where(vehicle_types: {id: params[:vehicle_type]})
    @sizes = sizes.map{|size| [size.name, size.id]}.insert(0, "Select Size")
  end

  # PUT /customers/vehicles/1
  # PUT /customers/vehicles/1.json
  def update
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
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
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end

end

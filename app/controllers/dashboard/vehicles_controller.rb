class Dashboard::VehiclesController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "vehicles", dashboard_vehicles_path, "glyphicon-dashboard" }

  # GET /customers/vehicles
  # GET /customers/vehicles.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    #@vehicles = Vehicle.all
    @vehicles = current_user.account.vehicles || []

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

  end

  # POST /customers/vehicles
  # POST /customers/vehicles.json
  def create
    @vehicle = get_vehicle_from_params

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
    @vehicle = Vehicle.find(id_from_params)
    #if (@vehicle.vehicle_type.casecmp("Pickup") == 0) || (@vehicle.vehicle_type.casecmp("SUV") == 0) || (@vehicle.vehicle_type.casecmp("Crossover") == 0) || (@vehicle.vehicle_type.casecmp("CUV") == 0) || (@vehicle.vehicle_type.casecmp("Van") == 0) || (@vehicle.vehicle_type.casecmp("Minivan") == 0)
      #@vehicle.size = "Large"
    #elsif(@vehicle.vehicle_type.casecmp("Convertible") == 0) || (@vehicle.vehicle_type.casecmp("Coupe") == 0) || (@vehicle.vehicle_type.casecmp("Sedan") == 0) || (@vehicle.vehicle_type.casecmp("Wagon") == 0) || (@vehicle.vehicle_type.casecmp("Hatchback") == 0)
      #@vehicle.size = "Small"
    #end

    respond_to do |format|
      if @vehicle.update_attributes(params_update_vehicle)
        format.html { redirect_to root_path, notice: 'Vehicle was successfully updated.' }
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

  def get_vehicle_from_params
    unfound = params.require( :vehicle ).require( :vehicle_unfound ).to_i
    params_hash = build_vehicle_params
    if unfound == 0
      return params_vehicle( params_hash )
    else
      return params_custom_vehicle( params_hash )
    end
  end

  def params_vehicle( params_hash )
    if vehicle = Vehicle.find_by( license_plate: params_hash[ :license_plate ].upcase, state_registered: params_hash[ :state_registered ].upcase )
      return vehicle
    else
      return Vehicle.new( update_my_params( params_hash ) )
    end
  end

  def build_vehicle_params;
    temp_params = params.require( :vehicle ).permit( :vehicle_unfound, :my_year, :my_make, :my_model, :my_trim, :my_type, :my_door, :my_size, :color, :license_plate, :state_registered, :comments )
    temp_params[ :my_year ] = params.require( :vehicle ).require( :vehicle_years ).require( :id ).to_i if params.require( :vehicle ).has_key?( :vehicle_years )
    temp_params[ :my_make ] = params.require( :vehicle ).require( :vehicle_makes ).require( :id ).to_i if params.require( :vehicle ).has_key?( :vehicle_makes )
    temp_params[ :my_model ] = params.require( :vehicle ).require( :vehicle_models ).require( :id ).to_i if params.require( :vehicle ).has_key?( :vehicle_models )
    temp_params[ :my_trim ] = params.require( :vehicle ).require( :vehicle_trims ).require( :id ).to_i if params.require( :vehicle ).has_key?( :vehicle_trims )
    temp_params[ :my_type ] = params.require( :vehicle ).require( :vehicle_types ).require( :id ).to_i if params.require( :vehicle ).has_key?( :vehicle_types )
    temp_params[ :my_door ] = params.require( :vehicle ).require( :vehicle_doors ).require( :id ).to_i if params.require( :vehicle ).has_key?( :vehicle_doors )
    temp_params[ :my_size ] = ""
    return sanatize_params(  temp_params )
  end

  def update_my_params( params_hash )
    params_hash[ :my_year ] = get_vehicle_attribute( "VehicleYear", params_hash[ :my_year ] ).name
    params_hash[ :my_make ] = get_vehicle_attribute( "VehicleMake", params_hash[ :my_make ] ).name
    params_hash[ :my_model ] = get_vehicle_attribute( "VehicleModel", params_hash[ :my_model ] ).name
    params_hash[ :my_trim ] = get_vehicle_attribute( "VehicleTrim", params_hash[ :my_trim ] ).name
    params_hash[ :my_type ] = get_vehicle_attribute( "VehicleType", params_hash[ :my_type ] ).name
    params_hash[ :my_door ] = get_vehicle_attribute( "VehicleDoor", params_hash[ :my_door ] ).name
    params_hash[ :my_size ] = get_vehicle_size( params_hash[ :my_type ] )
    return sanatize_params( params_hash )
  end

  def sanatize_params( params_hash )
    params_hash.delete( :vehicle_unfound )
    params_hash.delete( :vehicle_years )
    params_hash.delete( :vehicle_makes )
    params_hash.delete( :vehicle_models )
    params_hash.delete( :vehicle_trims )
    params_hash.delete( :vehicle_types )
    params_hash.delete( :vehicle_doors )
    params_hash.delete( :vehicle_sizes )
    params_hash.delete( :vehicle_size )
    return params_hash
  end

  def get_vehicle_size( params_type )
    if ( params_type == "Pickup" ) || ( params_type == "SUV" ) || ( params_type == "Crossover" ) || ( params_type == "CUV" )   || ( params_type == "Van" ) || ( params_type == "Minivan" )
      return "Large"
    elsif ( params_type == "Convertible" ) || ( params_type == "Coupe" ) || ( params_type == "Sedan" ) || ( params_type == "Hatchback" )   || ( params_type == "Wagon" )
      return "Small"
    end
  end

  def params_custom_vehicle( params_hash )
    return build_new_vehicle( update_vehicle_params( params_hash ) )
  end

  def update_vehicle_params( params_hash )
    params_hash[ :my_year ]  = VehicleYear.where(name:  params_hash[ :my_year ] ).first_or_create
    params_hash[ :my_make ]  = VehicleMake.where(name:  params_hash[ :my_make ] ).first_or_create
    params_hash[ :my_model ] = VehicleModel.where(name: params_hash[ :my_model ]).first_or_create
    params_hash[ :my_trim ]  = VehicleTrim.where(name:  params_hash[ :my_trim ] ).first_or_create
    params_hash[ :my_type ]  = VehicleType.find( params_hash[ :my_type ] )
    params_hash[ :my_door ]  = VehicleDoor.find( params_hash[ :my_door ] )
    apply_vehicle_associations( params_hash[ :my_year ], params_hash[ :my_make ], params_hash[ :my_model ], params_hash[ :my_trim ], params_hash[ :my_type ], params_hash[ :my_door ] )
    return params_hash
  end

  def build_new_vehicle( params_hash )
    return Vehicle.new(
                my_year:  params_hash[ :my_year  ].name,
                my_make:  params_hash[ :my_make  ].name,
                my_model: params_hash[ :my_model ].name,
                my_trim:  params_hash[ :my_trim  ].name,
                my_type:  params_hash[ :my_type  ].name,
                my_door:  params_hash[ :my_door  ].name,
                color:    params_hash[ :color ],
                comments: params_hash[ :comments ],
                license_plate:    params_hash[ :license_plate ].upcase,
                state_registered: params_hash[ :state_registered ].upcase
               )
  end

  def apply_vehicle_associations( year, make, model, trim, v_type, door )
    trim.vehicle_years   << year   unless trim.vehicle_years.exists?(year.id)
    trim.vehicle_models  << model  unless trim.vehicle_models.exists?(model.id)
    trim.vehicle_types   << v_type unless trim.vehicle_types.exists?(v_type.id)
    model.vehicle_makes  << make   unless model.vehicle_makes.exists?(make.id)
    year.vehicle_types   << v_type unless year.vehicle_types.exists?(v_type.id)
    year.vehicle_doors   << door   unless year.vehicle_doors.exists?(door.id)
    v_type.vehicle_doors << door   unless v_type.vehicle_doors.exists?(door.id)
  end

  def get_vehicle_attribute( class_name, attribute )
    class_name.constantize.find( attribute );
  end

  def vehicle_found
    params.require(:vehicle).require(:vehicle_unfound).to_i
  end

  def params_update_vehicle
    params_hash = build_vehicle_params
    params_hash[ :my_type ]  = VehicleType.find( params_hash[ :my_type ] ).name
    params_hash[ :my_door ]  = VehicleDoor.find( params_hash[ :my_door ] ).name
    return sanatize_params( params_hash )
  end
end

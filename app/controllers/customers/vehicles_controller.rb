class Customers::VehiclesController < Customers::CustomerController
  # GET /customers/vehicles
  # GET /customers/vehicles.json
  def index
    add_breadcrumb 'Customer', '<a href="/customers">Customer</a>'
    add_breadcrumb 'Customer', 'Vehicles'

    @vehicles = Vehicle.all
    @models = Model.all

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
    @vehicle = Vehicle.new
    @years = Year.all
    @makes = Make.all
    @models = Model.all
    @trims = Trim.all
    @types = Type.all

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
    @vehicle = Vehicle.new()

#{ "utf8"=>"✓",
  #"authenticity_token"=>"seEXZz2K+RgkUWgIv3gzCUXkspjmaoFtCDXARBMjosE=",
  #"vehicle"=>{
    #"year"=>"1",
    #"color"=>"",
    #"comments"=>"",
    #"license_plate_number"=>"",
    #"state_registered"=>""
  #},
  #"year"=>{"makes"=>"1"},
  #"make"=>{"models"=>"1"},
  #"model"=>{"trims"=>"511"},
  #"trim"=>{"types"=>"4"},
  #"type"=>{"doors"=>"2",
  #"sizes"=>""},
  #"commit"=>"Save"}




    @vehicle.year     = Year.find(params[:vehicle][:year]).name
    @vehicle.color    = params[:vehicle][:color]
    @vehicle.comments = params[:vehicle][:comments]
    @vehicle.license_plate_number = params[:vehicle][:license_plate_number]
    @vehicle.state_registered = params[:vehicle][:state_registered]
    @vehicle.make     = Make.find(params[:year][:makes]).name
    @vehicle.model    = Model.find(params[:make][:models]).name
    @vehicle.trim     = Trim.find(params[:model][:trims]).name
    @vehicle.type     = Type.find(params[:trim][:types]).name
    @vehicle.doors    = Door.find(params[:type][:doors]).name
    #@vehicle.size     = Size.find(params[:type][:sizes]).name

    respond_to do |format|
      if @vehicle.save
        @vehicle.owners << current_user
        format.html { redirect_to customers_vehicle_path(@vehicle), notice: 'Vehicle was successfully created.' }
        format.json { render params[:id]}#json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
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
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
    if current_user.vehicles.contain?(@vehicle)

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @vehicle }
      end
    end
  end

  # GET /customers/vehicles/new
  # GET /customers/vehicles/new.json
  def new
    @vehicle = Vehicle.new
    @make = Make.all

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
    make = Make.new
    model = Model.new
    if params[:vehicle][:make_attributes].present?
      make = Make.find(params[:vehicle][:make_attributes][:id])
      if params[:vehicle][:make_attributes][:models_attributes].present?
        model = Model.find(params[:vehicle][:make_attributes][:models_attributes][:model_id])
      end
      params[:vehicle].delete :make_attributes
    end
    @vehicle = Vehicle.new(params[:vehicle])
    @vehicle.make = make
    @vehicle.make.models << model
    @vehicle.owners << current_user

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to customers_vehicle_path(@vehicle), notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
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

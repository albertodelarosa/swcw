class Dashboard::AppointmentsController < Dashboard::DashboardsController
  # GET /dashboard/appointments
  # GET /dashboard/appointments.json
  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /dashboard/appointments/1
  # GET /dashboard/appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /dashboard/appointments/new
  # GET /dashboard/appointments/new.json
  def new
    @appointments = Appointment.all
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /dashboard/appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /dashboard/appointments
  # POST /dashboard/appointments.json
  def create
    #@appointment = Appointment.new(params[:Appointment])
    @appointment = Appointment.find(params[:Appointment][:id])
    current_user.companies << @appointment

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to root_path, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dashboard/appointments/1
  # PUT /dashboard/appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:Appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/appointments/1
  # DELETE /dashboard/appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_appointments_url }
      format.json { head :no_content }
    end
  end

end

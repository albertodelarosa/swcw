class Dashboard::AppointmentsController < Dashboard::DashboardsController
  before_filter { add_breadcrumb "appointments", dashboard_appointments_path, "glyphicon-time" }

  # GET /dashboard/appointments
  # GET /dashboard/appointments.json
  def index
    add_breadcrumb "all", nil, "glyphicon-list"

    @appointments = current_user.appointments || []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /dashboard/appointments/1
  # GET /dashboard/appointments/1.json
  def show
    add_breadcrumb "all", nil, "glyphicon-screenshot"

    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /dashboard/appointments/new
  # GET /dashboard/appointments/new.json
  def new
    add_breadcrumb "add", nil, "glyphicon-plus-sign"

    @appointment = Appointment.new
    @current_appointments = get_current_appointments(current_user.appointments || [])
    @past_appointments = current_user.appointments - @current_appointments

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /dashboard/appointments/1/edit
  def edit
    add_breadcrumb "edit", nil, "glyphicon-edit"

    @appointment = Appointment.find(params[:id])
  end

  # POST /dashboard/appointments
  # POST /dashboard/appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        current_user.appointments << @appointment

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

  private

  def get_current_appointments(appointments)
    upcoming_appointments = []
    appointments.each{|appointment| upcoming_appointments << appointment if appointment.appointment_date >= Time.current.to_date }
    return upcoming_appointments
  end

end

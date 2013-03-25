class Customers::AppointmentsController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /customers/appointments
  # GET /customers/appointments.json
  def index
    @customers_appointments = Customers::Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers_appointments }
    end
  end

  # GET /customers/appointments/1
  # GET /customers/appointments/1.json
  def show
    @customers_appointment = Customers::Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customers_appointment }
    end
  end

  # GET /customers/appointments/new
  # GET /customers/appointments/new.json
  def new
    @customers_appointment = Customers::Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customers_appointment }
    end
  end

  # GET /customers/appointments/1/edit
  def edit
    @customers_appointment = Customers::Appointment.find(params[:id])
  end

  # POST /customers/appointments
  # POST /customers/appointments.json
  def create
    @customers_appointment = Customers::Appointment.new(params[:customers_appointment])

    respond_to do |format|
      if @customers_appointment.save
        format.html { redirect_to @customers_appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @customers_appointment, status: :created, location: @customers_appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @customers_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/appointments/1
  # PUT /customers/appointments/1.json
  def update
    @customers_appointment = Customers::Appointment.find(params[:id])

    respond_to do |format|
      if @customers_appointment.update_attributes(params[:customers_appointment])
        format.html { redirect_to @customers_appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customers_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/appointments/1
  # DELETE /customers/appointments/1.json
  def destroy
    @customers_appointment = Customers::Appointment.find(params[:id])
    @customers_appointment.destroy

    respond_to do |format|
      format.html { redirect_to customers_appointments_url }
      format.json { head :no_content }
    end
  end
end

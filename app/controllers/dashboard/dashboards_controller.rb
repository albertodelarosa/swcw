class Dashboard::DashboardsController < ApplicationController

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    @account = Account.includes(:companies, :sites, :vehicles, :appointments, :service_plan).find(current_user.account.id)
    @current_cart = current_cart unless session[:cart_id].nil?

    if @account.companies.empty?
      redirect_empty_association( @account.companies )
    elsif @account.sites.empty?
      redirect_empty_association( @account.sites )
    elsif @account.vehicles.empty?
      redirect_empty_association( @account.vehicles )
    elsif ( ( @account.service_plan.nil? ) && ( @current_cart.nil? ) )
      respond_to do |format|
        format.html { redirect_to service_plan_purchase_path, alert: "#{@account.user.first_name}, you must first purchase a plan" }
      end
    else
      puts
      puts
      puts @current_cart.nil?
      puts
      puts

      if @current_cart.nil?
        @service_plan = @account.service_plan
        @service_plan.set_prices if @service_plan.price == 0
      end
      @account.status = Account::STATUS.first
      @appointments = @account.appointments || []
      @sites        = @account.sites        || []
      @companies    = @account.companies    || []
      @vehicles     = @account.vehicles     || []
      @appointment = Appointment.new
      @next_app = @appointments.last unless @appointments.empty?

      respond_to do |format|
        format.html
        format.json { render json: @account }
      end
    end

  end

  private

  def redirect_empty_association( association )
    new_class = association.scope.class.to_s.split('::').first.constantize.new
    new_class_name = new_class.class.to_s.downcase
    instance_variable_set("@" + new_class_name, new_class)

    respond_to do |format|
      format.html { redirect_to public_send( "new_dashboard_#{ new_class_name }_path" ), notice: "you must select your #{ new_class_name }..." }
      format.json { render json: instance_variable_get( "@" + new_class_name ) }
    end
  end

  def generate_regular_services
    services = []
    Pricing::RegularServices::SERVICE_NAMES.each_with_index do |name, index|
      temp = ServiceRegular.new
      temp.populate_regular_service(name)
      services << temp
    end
    return services
  end

  def generate_regular_packages
    packages = []

    Pricing::RegularServices::PACKAGE_NAMES.each do |package_name|
      services_array = []
      temp_package = ServiceRegular.new
      temp_package.name = package_name
      temp_package.small_price = 0.0
      temp_package.large_price = 0.0

      service_names = Pricing::RegularServices.const_get((package_name + " names").upcase.tr(" ","_"))
      service_names.each_with_index do |service_name, index|
        temp_serivce = ServiceRegular.new
        temp_serivce.populate_regular_service(service_name)
        unless index == (service_names.size - 1)
          temp_package.small_price += temp_serivce.small_price
          temp_package.large_price += temp_serivce.large_price
        end
        services_array << temp_serivce
      end
      packages << {package: temp_package, services: services_array}
    end
    return packages
  end

  def entity_id_from_params(entity)
    return params.require(entity).permit(:id)[:id].to_i
  end

  def id_from_params
    puts params.permit(:id)[:id].to_i
    return params.permit(:id)[:id].to_i
  end

  def params_process_vehicle
    params[:vehicle][:my_year] = params.require( :vehicle ).require( :vehicle_year )
  end

end

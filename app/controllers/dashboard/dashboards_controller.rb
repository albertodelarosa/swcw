class Dashboard::DashboardsController < ApplicationController

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    @account = Account.includes(:companies, :sites, :vehicles, :appointments).find(current_user.id)

    if @account.new?
      if @account.companies.empty?
        @company = Company.new
        respond_to do |format|
          format.html { redirect_to new_dashboard_company_path, notice: "you must select your site..." }
          format.json { render json: @company }
        end
      elsif @account.sites.empty?
        @site = Site.new
        respond_to do |format|
          format.html { redirect_to new_dashboard_site_path, notice: "you must select your site..." }
          format.json { render json: @site }
        end
      elsif @account.vehicles.empty?
        @vehicle = Vehicle.new
        respond_to do |format|
          format.html { redirect_to new_dashboard_vehicle_path, notice: "you must first enter your vehicle..." }
          format.json { render json: @vehicle }
        end
      else
        @account.status = Account::STATUS.first
      end
    end

    if @service_plan = @account.service_plan
      @appointments = @account.appointments || []
      @sites        = @account.sites        || []
      @companies    = @account.companies    || []
      @vehicles     = @account.vehicles     || []
      @current_cart = current_cart unless session[:cart_id].nil?
      @appointment = Appointment.new
    else
      respond_to do |format|
        format.html { redirect_to service_plan_purchase, notice: "#{@account.user.first_name}, you must first purchase a plan" }
      end
    end
  end

  private

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
    puts "in: entity_id_from_params"
    puts
    id = params.required(entity).permit(:id)
    puts id[:id]
    puts
    puts
    return id[:id]
  end

  def id_from_params
    return params.permit(:id)[:id].to_i
  end

end

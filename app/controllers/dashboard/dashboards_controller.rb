class Dashboard::DashboardsController < ApplicationController

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    if current_user.account.new?
      if current_user.account.vehicles.empty?
        @vehicle = Vehicle.new
        respond_to do |format|
          format.html { redirect_to new_dashboard_vehicle_path, notice: "you must first enter your vehicle..." }
          format.json { render json: @vehicle }
        end
      elsif current_user.account.companies.empty? || current_user.account.sites.empty?
        @site = Site.new
        respond_to do |format|
          format.html { redirect_to new_dashboard_site_path, notice: "you must select your site..." }
          format.json { render json: @vehicle }
        end
      else
        @account = current_user.account
        @account.status = Account::STATUS[0]
      end
    end
















    @appointments = current_user.account.appointments || []
    @appointment = Appointment.new

    @sites = current_user.account.sites.to_a || []
    @site = Site.new

    @companies = current_user.account.companies || []
    @company = Company.new

    @vehicles = current_user.account.vehicles || []
    @vehicle  = Vehicle.new

    @sample_individual_plans = ServicePlan.where(package_type: ServicePlan::TYPE[0])
    @sample_plans = ServicePlan.where(package_type: ServicePlan::TYPE[1])

    #if current_user.account.nil?
      #@account = Account.new
      #@service_plan = ServicePlan.new
      #@siteler_dollar = SitelerDollar.new
      #@service = Service.new
      #@discount = Discount.new

      #@account.service_plan = @service_plan
      #@account.siteler_dollar = @siteler_dollar
      #@service_plan.services << @service
      #@account.discounts << @discount

      #@account.status = Account::STATUS[0]
      #@service_plan.status = ServicePlan::STATUS[0]

      #current_user.account = @account
    #else
      #@cart = current_cart
      #@account = current_user.account
      #@siteler_dollar = @account.siteler_dollar
      #@service_plan = @account.service_plan
      #@services = @service_plan.services
      ##@discounts << @account.discounts
    #end
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

end

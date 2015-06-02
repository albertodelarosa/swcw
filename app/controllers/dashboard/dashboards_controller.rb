class Dashboard::DashboardsController < ApplicationController

  before_filter :authenticate_user!
  before_filter { add_breadcrumb "home", root_path, "glyphicon-home" }

  def index
    @appointments = current_user.appointments || []
    @appointment = Appointment.new

    @sites = current_user.sites.to_a || []
    @site = Site.new

    @companies = current_user.companies || []
    @company = Company.new

    @vehicles = current_user.vehicles || []
    @vehicle  = Vehicle.new

    if current_user.account
      @account = current_user.account
    else
      @account = Account.new
      @service_plan = ServicePlan.new
      @service_plan.type = "new"
      @siteler_dollar = SitelerDollar.new
      @service = Service.new
      @discount = Discount.new

      @account.service_plan = @service_plan
      @account.siteler_dollar = @siteler_dollar
      @service_plan.services << @service
      @account.discounts << @discount

      @service_samples =  generate_regular_samples
    end
  end

  private
  def generate_regular_samples
    services = []
    Pricing::RegularServices::SERVICE_NAMES.each_with_index do |name, index|
      temp = ServiceRegular.new
      temp.populate_regular_service(name)
      services << temp
    end
    return services
  end
end

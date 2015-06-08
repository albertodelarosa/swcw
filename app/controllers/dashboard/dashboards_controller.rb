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

    @service_samples =  generate_regular_samples

    if current_user.account.nil?
      @account = Account.new
      @service_plan = ServicePlan.new
      @siteler_dollar = SitelerDollar.new
      @service = Service.new
      @discount = Discount.new

      @account.service_plan = @service_plan
      @account.siteler_dollar = @siteler_dollar
      @service_plan.services << @service
      @account.discounts << @discount

      @account.status = Account::STATUS[0]
      @service_plan.status = ServicePlan::STATUS[0]

      current_user.account = @account
    else
      @account = current_user.account
      @siteler_dollar = @account.siteler_dollar
      @service_plan = @account.service_plan
      @services = @service_plan.services
      #@discounts << @account.discounts
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

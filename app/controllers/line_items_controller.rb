class LineItemsController < ApplicationController
  def create
    @service_plan = create_plan(params_service_plan)

    if @service_plan.save!
      @line_item = LineItem.create!(quantity: 1, unit_price: @service_plan.price)
      @line_item.cart = current_cart
      @line_item.service_plan = @service_plan
      @line_item.save!
      flash[:notice] = "Added #{@service_plan.name} to cart."
      redirect_to root_path
    end
  end

  private

  def params_service_plan
    plan_params = params.require(:package).permit(:package_name, :package_type, :vehicle_size, :package_price)
    return plan_params
  end

  def create_plan(plan_params)
    package_name = plan_params[:package_name]
    package_type = plan_params[:package_type]
    package_price = plan_params[:package_price]
    vehicle_size = plan_params[:vehicle_size]

    plan = ServicePlan.new
    options = {package_name: package_name, package_type: package_type, service_name: package_name}
    plan.populate_regular_plan(options)
    plan.vehicle_size = vehicle_size
    plan.set_prices()
    plan.price = package_price
    return plan
  end
end

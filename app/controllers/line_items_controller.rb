class LineItemsController < ApplicationController
  def create
    service_plan = ServicePlan.new(params_service_plan)
    line_item = LineItem.new(quantity: 1, unit_price: service_plan.price)
    current_cart.line_items << line_item
    service_plan.line_item = line_item

    if service_plan.save! && line_item.save!
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Added #{service_plan.name} to cart." }
        format.json { render json: line_item }
      end
    end
  end

  def destroy
    line_item = LineItem.find(params_line_item)
    plan = line_item.service_plan
    name = plan.name

    if current_cart.line_items.destroy(line_item)
      plan.destroy
      respond_to do |format|
        format.html { redirect_to cart_url, notice: "Service Plan #{name} was removed from your cart." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Service Plan #{name} wasn't removed from your cart." }
        format.json { head :no_content }
      end
    end
  end

  private

  def params_service_plan
    params.require(:service_plan).permit(:name, :plan_type, :status, :price, :vehicle_size)
  end
  def params_line_item
    params.permit(:id)
    params[:id]
  end

end

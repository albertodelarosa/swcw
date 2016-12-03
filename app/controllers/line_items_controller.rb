class LineItemsController < ApplicationController
  def create
    line_item = LineItem.new( quantity: 1 )
    line_item.service_plan = ServicePlan.new( params_service_plan )
    line_item.unit_price = line_item.service_plan.price
    line_item.vehicle = Vehicle.find( params_vehicle )
    current_cart.line_items << line_item

    if line_item.save! && line_item.service_plan.save!
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Added #{ line_item.service_plan.name} to cart." }
        format.json { render json: line_item }
      end
    end
  end

  def destroy
    line_item = LineItem.find( params_line_item )
    plan = line_item.service_plan
    name = plan.name
    line_item_destroyed = false
    if current_cart.line_items.destroy( line_item )
      plan.destroy
      line_item_destroyed = true
    end

    unless line_item_destroyed
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Service Plan #{name} was removed from your cart." }
        format.json { head :no_content }
      end
    end

    if current_cart.line_items.size == 0
      Cart.delete( session[ :cart_id ] )
      session[:cart_id] = nil
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Service Plan #{name} was removed from your cart." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to cart_url, notice: "Service Plan #{name} was removed from your cart." }
        format.json { head :no_content }
      end
    end
  end

  private

  def params_vehicle
    return params.require( :service_plan ).require( :vehicle ).to_i
  end

  def params_service_plan
    return params.require( :service_plan ).permit( :name, :plan_type, :status, :price )
  end

  def params_line_item
    params.permit( :id )
    params[ :id ]
  end

end

class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = current_cart
  end

  def create
    @order = current_cart.build_order(params_order)
    @order.ip_address = request.remote_ip
    if @order.save
      respond_to do |format|
        if @order.purchase
          current_user.account.service_plan = @order.cart.line_items.first.service_plan
          format.html { redirect_to root_path, success: "Your order was processed" }
        else
          render action: "failure", error: "Your order was not processed. Please check your credit card"
        end
      end
    else
      render action: 'new'
    end
  end

  def success
  end

  def failure
  end

  private

  def params_order
    params.require( :order ).permit( :first_name, :last_name, :card_type, :card_number, :card_verification, "card_expires_on_month(1i)", "card_expires_on_month(2i)", "card_expires_on_month(3i)", "card_expires_on_year(1i)", "card_expires_on_year(2i)", "card_expires_on_year(3i)" )
    if params[:order]["card_expires_on_year(1i)"] && params[:order]["card_expires_on_month(2i)"] && params[:order]["card_expires_on_year(3i)"]
      params[:order][:card_expires_on] = Date.new(params[:order].delete("card_expires_on_year(1i)").to_i, params[:order].delete("card_expires_on_month(2i)").to_i, params[:order].delete("card_expires_on_year(3i)").to_i)
      params[:order][:cart_id] = current_cart.id
      params[:order].delete("card_expires_on_month(1i)")
      params[:order].delete("card_expires_on_month(2i)")
      params[:order].delete("card_expires_on_month(3i)")
      params[:order].delete("card_expires_on_year(2i)")
    end

  end

end

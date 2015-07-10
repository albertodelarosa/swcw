class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = current_cart.build_order(params_order)
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render action: "success"
      else
        render action: "failure"
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
    if params[:order]["card_expires_on(1i)"] && params[:order]["card_expires_on(2i)"] && params[:order]["card_expires_on(3i)"]
      params[:order][:card_expires_on] = Date.new(params[:order].delete("card_expires_on(1i)").to_i, params[:order].delete("card_expires_on(2i)").to_i, params[:order].delete("card_expires_on(3i)").to_i)
    end
    params.require(:order).permit(:first_name, :last_name, :card_type, :card_number, :card_verification, :card_expires_on)
  end

end

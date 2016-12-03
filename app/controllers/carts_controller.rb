class CartsController < ApplicationController
  def show
    @cart = current_cart
    #session[:cart_id] = nil
  end

  def purchase
  end
end

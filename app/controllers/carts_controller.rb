class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def purchase
  end
end

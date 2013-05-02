class Customers::CustomersController < ApplicationController

  before_filter :authenticate_user!

  layout 'customers'

  def index
  end

  def my_dashboard
  end

  def notacustomer
  end
end

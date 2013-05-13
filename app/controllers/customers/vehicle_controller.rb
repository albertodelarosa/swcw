class Customers::VehicleController < Customers::CustomerController
  def index
   #add_breadcrumb 'Hotel Manager', '<a href="/hotelmanager/">Hotel Manager</a>'
    #add_breadcrumb 'Hotel Manager', 'Hotels'
    add_breadcrumb 'Customer', '<a href="/customers">Customer</a>'
    add_breadcrumb 'Customer', 'Vehicles'
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

class WelcomeController < ApplicationController
  def index
    #add_breadcrumb 'Hotel Manager', '<a href="/hotelmanager/">Hotel Manager</a>'
    #add_breadcrumb 'Hotel Manager', 'Hotels'
  end
  def dashboard
  end
  def vehicles
    @models = Model.all
  end
end

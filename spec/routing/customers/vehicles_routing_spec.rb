require "spec_helper"

describe Customers::VehiclesController do
  describe "routing" do

    it "routes to #index" do
      get("/customers/vehicles").should route_to("customers/vehicles#index")
    end

    it "routes to #new" do
      get("/customers/vehicles/new").should route_to("customers/vehicles#new")
    end

    it "routes to #show" do
      get("/customers/vehicles/1").should route_to("customers/vehicles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customers/vehicles/1/edit").should route_to("customers/vehicles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customers/vehicles").should route_to("customers/vehicles#create")
    end

    it "routes to #update" do
      put("/customers/vehicles/1").should route_to("customers/vehicles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customers/vehicles/1").should route_to("customers/vehicles#destroy", :id => "1")
    end

  end
end

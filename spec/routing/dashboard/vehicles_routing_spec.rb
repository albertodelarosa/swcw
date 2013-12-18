require "spec_helper"

describe Dashboard::VehiclesController do
  describe "routing" do

    it "routes to #index" do
      get("/dashboard/vehicles").should route_to("dashboard/vehicles#index")
    end

    it "routes to #new" do
      get("/dashboard/vehicles/new").should route_to("dashboard/vehicles#new")
    end

    it "routes to #show" do
      get("/dashboard/vehicles/1").should route_to("dashboard/vehicles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dashboard/vehicles/1/edit").should route_to("dashboard/vehicles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dashboard/vehicles").should route_to("dashboard/vehicles#create")
    end

    it "routes to #update" do
      put("/dashboard/vehicles/1").should route_to("dashboard/vehicles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dashboard/vehicles/1").should route_to("dashboard/vehicles#destroy", :id => "1")
    end

  end
end

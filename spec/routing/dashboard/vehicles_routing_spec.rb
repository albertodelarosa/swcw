require "spec_helper"

describe Dashboard::VehiclesController do
  describe "routing" do
    it{ expect( get("/dashboard/vehicles")).to route_to("dashboard/vehicles#index")}
    it{ expect( get("/dashboard/vehicles/new")).to route_to("dashboard/vehicles#new")}
    it{ expect( get("/dashboard/vehicles/1")).to route_to("dashboard/vehicles#show", :id => "1")}
    it{ expect( get("/dashboard/vehicles/1/edit")).to route_to("dashboard/vehicles#edit", :id => "1")}
    it{ expect( post("/dashboard/vehicles")).to route_to("dashboard/vehicles#create")}
    it{ expect( put("/dashboard/vehicles/1")).to route_to("dashboard/vehicles#update", :id => "1")}
    it{ expect( delete("/dashboard/vehicles/1")).to route_to("dashboard/vehicles#destroy", :id => "1")}
  end
end

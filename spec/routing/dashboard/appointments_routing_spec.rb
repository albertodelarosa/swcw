require "spec_helper"

describe Dashboard::AppointmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/dashboard/appointments").should route_to("dashboard/appointments#index")
    end

    it "routes to #new" do
      get("/dashboard/appointments/new").should route_to("dashboard/appointments#new")
    end

    it "routes to #show" do
      get("/dashboard/appointments/1").should route_to("dashboard/appointments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dashboard/appointments/1/edit").should route_to("dashboard/appointments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dashboard/appointments").should route_to("dashboard/appointments#create")
    end

    it "routes to #update" do
      put("/dashboard/appointments/1").should route_to("dashboard/appointments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dashboard/appointments/1").should route_to("dashboard/appointments#destroy", :id => "1")
    end

  end
end
